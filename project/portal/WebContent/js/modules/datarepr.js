define(function(require) {
  var EE = require('../utils/eventemitter')
    , Configuration = require('../utils/config')

  function DataRepr(title, library) {
    this.spigots = []
    this.title = title
    this.config = new Configuration
    this.base_configuration = this.base_configuration()
    this.library = library
    EE.call(this)
  }

  var cons = DataRepr
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.listen = function(ee) {
    var callback = this.on_data.bind(this)

    this.spigots.push({ee:ee, callback:callback})
    ee.on('data', callback)

    return this
  }
 
  proto.on_data = function(data) {
    this.library.update(this.config, data)
  }

  proto.init = function() {
    var self = this
      , config = self.base_configuration

    Object.keys(config).forEach(function(key) {
      self.config.configure(key, config[key]) 
    })

    self.library.init(self.config)
  }

  proto.configure = Function('key', 'val', 'return this.config.configure(key, val)')

  // this is automatically called on instantiation and replaced with the resultant object
  proto.base_configuration = function() {
    return {
        'colors':[ '#2D6C8B', '#99261C' ]
      , 'credits.enabled':false
      , 'chart':{ 
            animate:false
          , backgroundColor:null 
          , borderRadius:0, borderWidth:0, borderColor:null
          , defaultSeriesType:'area'
          , marginTop:50, marginBottom:60
          , spacingTop:18, spacingBottom:20, spacingLeft:10, spacingRight:5
          , width:695
        }
      , 'legend': {
            verticalAlign:'bottom'
          , align:'center'
          , floating:true
          , backgroundColor:null
          , borderWidth:0
          , symbolWidth:12 
        } 
      , 'legend.itemStyle': { fontWeight:'normal', fontSize:'12px', color:'#333333', textShadow:'1px 1px 1px #FFF' }
      , 'navigation.buttonOptions.enabled': false
      , 'plotOptions.scatter': { }
      , 'plotOptions.area': { lineWidth:3, shadow:false, fillOpacity:0.2 }
      , 'plotOptions.area.states.hover.lineWidth': 3
      , 'plotOptions.area.marker': { radius:3, lineWidth:2, fillColor:'#FFFFFF', lineColor:'#2D6C8B' }
      , 'plotOptions.area.marker.states.hover': { radius:4, lineWidth: 2 }
      , 'plotOptions.series': { borderWidth:0, cursor:'pointer', shadow:false }
      , 'title.style':{ fontFamily:'helvetica', fontSize:'130%', fontWeight:'bold', color:'#888888' }
      , 'title.text':this.title || 'Generic Report'
      , 'tooltip': { 
            crosshairs:true
          , borderRadius:4, borderColor:'#CCCCCC', borderWidth:1
          , backgroundColor: 'rgba(51,51,51,0.8)'
          , style: { color: '#FFF' }
        }
      , 'xAxis.lineColor': '#CCCCCC'
      , 'xAxis.labels.style.fontSize':'9px'
      , 'xAxis.title.margin': 20
      , 'xAxis.tickmarkPlacement':'on'
      , 'yAxis':[]
    }
  }

  return cons
})
