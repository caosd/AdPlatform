define(function(require) {
  var TimeDelta = require('../utils/timedelta')
    , EE = require('../utils/eventemitter')

  function DateParser(string, pivot) {
    this.source = string
    this.tokens = string && this.tokenize()
    this.pivot = pivot || new Date
    EE.call(this)
  }

  var cons = DateParser
    , proto = cons.prototype = new EE

  proto.constructor = cons

  cons.WEEKDAYS = [
      "Sunday"
    , "Monday"
    , "Tuesday"
    , "Wednesday"
    , "Thursday"
    , "Friday"
    , "Saturday"
  ]

  cons.MONTHS = [ 
      "January"
    , "February"
    , "March"
    , "April"
    , "May"
    , "June"
    , "July"
    , "August"
    , "September"
    , "October"
    , "November"
    , "December" 
  ]

  var abbr = Function('x', 'return x.slice(0, 3)')
  cons.WEEKDAYS_ABBR = cons.WEEKDAYS.map(abbr)
  cons.MONTHS_ABBR = cons.MONTHS.map(abbr)

  cons.TOKENS = [ 
      ['ordinal'     , /(\d+)(st|nd|rd|th)/]
    , ['time'        , /(\d+:\d+)(\s*)?(AM|am|PM|pm|a\.m\.|p\.m\.)?/]
    , ['number'      , /(\d+)/]
    , ['humantime'   , /(noon|midnight)/i]
    , ['month'       , cons.MONTHS.concat(cons.MONTHS_ABBR)]
    , ['weekday'     , cons.WEEKDAYS.concat(cons.WEEKDAYS_ABBR)]
    , ['positional'  , /(last|next)/i]
    , ['direct'      , /^(now|tomorrow|today|yesterday)/i]
    , ['unit'        , /(day|week|month|year)(s)?/i]
    , ['direction'   , /(ago|from_now)?/i]
    , ['(unknown)'   , /.*/]
  ]

  // TODO: "start of week", "end of month", "start of day", "end of day"
  cons.FORMULA = { 
      'parse_numeric'         : [['number'],     ['number'],             ['number']]    // -> 2001 1 12 OR 1 12 2012
    , 'parse_month_date_year' : [['month'],      ['number', 'ordinal'],  ['number']]    // -> Mar 1 2012 
    , 'parse_month_date'      : [['month'],      ['number', 'ordinal']]                 // -> Mar 21 <this year>
    , 'parse_date_month'      : [['number'],     ['month']]                             // -> 12 Mar <this year>

    // these create and apply timedeltas to "now"
    , 'parse_positional_num'  : [['positional'], ['number'], ['unit']]                  // -> last 30 days
    , 'parse_positional'      : [['positional'], ['unit', 'month', 'weekday']]          // -> last week, last tuesday, next year
    , 'parse_directional'     : [['number'],     ['unit'], ['direction']]               // -> 3 weeks ago, 1 day from now
    , 'parse_direct'          : [['direct']]                                            // -> yesterday, tomorrow
    //, 'parse_bound'           : [['bound'], ['unknown'], ['unit', 'month']]           // -> start of month, last of february, start of day 
  } 

  proto.parse_numeric = function(year, month, day) {
    // we got the "M-D-Y" variant, swap 'em to "Y-M-D"
    if(day.content.length > 2) {
      return this.parse_numeric(day, year, month)
    }
    return new Date(~~year.content, (~~month.content)-1, ~~day.content)
  } 

  proto.parse_month_date_year = function(month, date, year) {
    var month_no = this.determine_month_from_token(month.content) 
    return new Date(+year.content, month_no, +date.content.replace(/[a-zA-Z]+/g, '')) 
  }

  proto.parse_month_date = function(month, date) {
    var month_no = this.determine_month_from_token(month.content)
      , year_no = this.pivot.getFullYear()

    return new Date(year_no, month_no, +date.content.replace(/[a-zA-Z]+/g, ''))
  }

  proto.parse_date_month = function(date, month) {
    return this.parse_month_date(month, date)
  }

  proto.parse_positional_num = function(positional, number, unit) {
    var dir = (positional.content === 'last' ? -1 : 1)

    unit = unit.content
    unit = /s$/.test(unit) ? unit : unit+'s'
    number = ~~number.content

    if(unit === 'months') {
      return new Date(
          this.pivot.getFullYear()
        , this.pivot.getMonth() + dir * number
        , 1
      )
    }

    var offset = {}
      , delta

    offset[unit] = number
    delta = new TimeDelta(offset)

    return new Date(
        +this.pivot + dir * delta
    )
  }

  proto.parse_positional = function(positional, target) {
    switch(target.type) {
      case 'unit': return this.parse_positional_unit(positional, target)
      case 'weekday': return this.parse_positional_weekday(positional, target)
      case 'month': return this.parse_positional_month(positional, target)
    }
  }

  proto.parse_positional_unit = function(positional, target) {
    // next week, last week, next day, last month

    var dir = positional.content === 'next'
      , unit = target.content
      , now = this.pivot

    if(unit === 'week') {
      return new Date(+now + (dir ? new TimeDelta({days:7-now.getDay()}) : -new TimeDelta({days:now.getDay()+7}))) 
    }

    if(unit === 'day') {
      return new Date(+now + (dir ? new TimeDelta({hours:24-now.getHours()}) : -new TimeDelta({hours:now.getHours()})))
    }

    if(unit === 'year') {
      return new Date(now.getFullYear() + (dir ? 1 : -1), 0, 1)
    }

    // over the "last month" or "next month"
    return new Date(now.getFullYear(), now.getMonth() + (dir ? 1 : 0), 1, 0, 0)
  }

  proto.parse_positional_weekday = function(positional, target) {
    var weekday_no = this.determine_weekday_from_token(target.content)
      , dir = positional.content === 'next'
      , now = this.pivot 
      , today = now.getDay()
      , days = weekday_no - today

    if(dir && days < 1) {
      days += 7
    } else if(!dir && days > -1) {
      days -= 7
    }

    return new Date((+now) + new TimeDelta({days:days}))
  }

  proto.parse_positional_month = function(positional, target) {
    var target_month = this.determine_month_from_token(target.content)
      , dir = positional.content === 'next'
      , now = new Date(this.pivot.getFullYear(), this.pivot.getMonth(), 1)
      , this_month = now.getMonth()
      , months = target_month - this_month
      , incr

    if(dir && months < 1) {
      months += 12 
    } else if(!dir && months > -1) {
      months -= 12
    }

    return new Date(now.getFullYear(), this_month + months, 1)
  }

  proto.parse_directional = function(num, unit, direction) {
    var dir   = direction.content === 'ago' ? -1 : 1
      , unit  = unit.content
      , config = {}
      , delta

    // pluralize  
    if(unit.slice(-1).charAt(0) !== 's') {
      unit += 's'
    }

    if(unit === 'months') {
      var shift = new Date(+this.pivot)
      shift.setDate(1)
      shift.setMonth(shift.getMonth() + (dir > 0 ? 1 : -1) * +num.content)
      return shift
    }

    config[unit] = +num.content 
    delta = new TimeDelta(config)

    return new Date(+this.pivot + (dir * delta))
  }

  proto.parse_direct = function(dir) {
    if(dir.content === 'yesterday') {
      return new Date(
          this.pivot.getFullYear()
        , this.pivot.getMonth()
        , this.pivot.getDate()-1
      )
    } else if(dir.content === 'today') {
      return new Date(
          this.pivot.getFullYear()
        , this.pivot.getMonth()
        , this.pivot.getDate()
        , 0
        , 0
      )
    } else if(dir.content === 'now') {
      return this.pivot
    }
    return new Date(this.pivot.getFullYear(), this.pivot.getMonth(), this.pivot.getDate()+1)
  }

  proto.determine_month_from_token = function(month) {
    var idx

    if(/^\d+$/.test(month))
      return ~~month - 1

    idx = cons.MONTHS.map(Function('x', 'return x.toLowerCase()')).indexOf(month.toLowerCase())
    if(!!~idx)
      return idx

    idx = cons.MONTHS_ABBR.map(Function('x', 'return x.toLowerCase()')).indexOf(month.toLowerCase())

    if(!!~idx)
      return idx

    return null
  }

  proto.determine_weekday_from_token = function(weekday) {
    var idx

    idx = cons.WEEKDAYS.map(Function('x', 'return x.toLowerCase()')).indexOf(weekday.toLowerCase())
    if(!!~idx)
      return idx

    idx = cons.WEEKDAYS_ABBR.map(Function('x', 'return x.toLowerCase()')).indexOf(weekday.toLowerCase())
    if(!!~idx)
      return idx

    return null
  }

  proto.modify_by_time = function(result, time_token) {
    var hour
      , minute

    switch(time_token.content.toLowerCase()) {
      case 'noon': hour = 12, minute = 0; break
      case 'midnight': hour = 23, minute = 59; break
      default: parse_time()
    }

    result.setHours(hour)
    result.setMinutes(minute)

    return result

    function parse_time() {
      var bits = time_token.content.split(':')
      hour = +bits[0]
      minute = +bits[1].replace(/(am|pm|a.m.|p.m.)/g, '')

      if(/(pm|p.m.)/.test(time_token.content))
        hour += 12
    }
  }

  proto.tokenize = function() {
    return this.source
            .replace(/[\.'",\-]+/g, ' ')
            .replace(/from now/g, 'from_now')
            .split(/\s+/)
            .map(to_token)

    function to_token(word) {
      var matches = cons.TOKENS.filter(match_word.bind(null, word))

      return {content:word.toLowerCase(), type:matches[0][0]}
    }

    function match_word(word, match) {
      var name = match[0]
        , test = match[1]

      if(Array.isArray(test)) {
        return test.map(Function('x', 'return x.toLowerCase()')).indexOf(word.toLowerCase()) !== -1
      }
      return test.test(word)
    }   
  }

  proto.parse = function() {
    var self = this
      , match
      , num_to_splice

    if(!self.tokens.length) {
      self.emit('end')
      return null
    }

    Object.keys(cons.FORMULA).some(function(formula_method) {
      var sequence = cons.FORMULA[formula_method]

      return self.attempt_sequence(sequence) && (match = formula_method)
    }) 

    if(!match) {
      self.tokens.shift()
      return self.parse()
    }

    num_to_splice = cons.FORMULA[match].length
    
    var bits = self.tokens.splice(0, num_to_splice)
      , result = self[match].apply(self, bits)

    if(result && self.tokens.length > 1) {
      if(self.tokens[0].content === 'at' && ['time','humantime'].indexOf(self.tokens[1].type) !== -1) {
        result = this.modify_by_time(result, self.tokens[1])
      }
    }

    self.emit('end', result)
    return result
  }

  proto.attempt_sequence = function(sequence) {
    for(var i = 0, len = sequence.length; i < len; ++i) {
      var step = sequence[i]
      if(this.tokens[i] === undefined || (this.tokens[i] && step.indexOf(this.tokens[i].type) === -1)) {
        i > 0 && this.emit('data', sequence, i)
        return false
      }
    }
    return true
  }

  return cons
})
