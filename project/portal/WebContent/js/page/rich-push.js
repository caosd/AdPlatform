var richPush = (function() {

    function generatePayload() {
        var payload = {};
        payload.title = $('#id_title').val();
        $('#display-title').text(payload.title);
        if(tinyMCE && tinyMCE.get('display_message') != null){
            payload.message = tinyMCE.get('display_message').getContent();
        }
        // if ($('#template-select-yes').is(':checked')) {
        //     $('#display-template').html($('#template').val());
        //     // TODO: if we need to put the template selection in the payload, it should go right here.
        // } else {
        //     $('#display-template').html('None');
        // }
        if ($('#alert-select-yes').is(':checked')) {
            payload.push = {};
            payload.push.aps = {};
            payload.push.aps.alert = $('#push_alert').val();

            /**
            * Find and add any custom key/value pairs
            */
            var custom_keys = [];
            $('#display-push-keys').html('');
            $('.custom_key').each(function(index) {
               key_number = $(this).attr('id').replace("push_key", "")
               var key = $(this).val();
               if (key !== ""){
                   var value = $("#push_value" + key_number).val();
                   payload.push[key] = value
                   custom_keys.push([key, value]);
                   var html_str = "<li><strong>" + key + "</strong>: " + value + "</li>"
                   $('#display-push-keys').append(html_str);
               }
             });
            if (custom_keys.length > 0){
                $('#id_custom_keys').val($.toJSON(custom_keys));
            }
            else{
                $('#display-push-keys').html('<li>None</li>');
            }

            if ($('#push_sound').val() > '') {
                payload.push.aps.sound = $('#push_sound').val();
                $('#display-push-sound').text(payload.push.aps.sound);
            } else {
                $('#display-push-sound').html('None');
            }
            $('#display-push-alert').text(payload.push.aps.alert);
        } else {
            $('#display-push-alert').html('None');
        }
        if ($('#id_tags').val() > '' && $('#select-recipient-some').is(':checked')) {
            escaped_string = $('#id_tags').val().replace(/\&/g, '&amp;').
                    replace(/</g, '&lt;').
                    replace(/>/g, '&gt;').
                    replace(/"/g, '&quot;').
                    replace(/'/g, '&#39;')
            payload.tags = escaped_string.split(',');
            $('#display-recipients').html('<strong>Only users tagged:</strong> ' + payload.tags.join(', '));
        } else {
            $('#display-recipients').html('这个应用的<strong>所有的注册用户</strong>。');
        }
        $('#id_payload').val($.toJSON(payload));
        //Update title of message
        $("div.step span.message_title").text(payload.title);
        //console.log('finished generating payload. it is: ',payload);
    }

    // 256 bytes - the {"aps":{}} part and reserving 14 bytes for the badge
    var MAX_BYTES = 256 - (10 + 14);
    var MAX_TITLE_BYTES = 255;

    var getRemainingPushBytes = function() {
        var bytesRemaining = MAX_BYTES;
        var idList = ["#push_alert", "#push_sound"];
        for (var i=0; i < idList.length; i++) {
            var id = idList[i];
            var elem = $(id);
            var val = elem.val()
            var additionalBytesRequired = 11;
            if (val === "") {
                // Item is not present.
               continue;
            }
            var byteLength = (unescape(encodeURIComponent(val)).length)
            bytesRemaining -= additionalBytesRequired;
            bytesRemaining -= byteLength;
        }

        var custom_keys = false;
        $('.custom_key').each(function(index) {
            key_number = $(this).attr('id').replace("push_key", "")
            var key = $(this).val();
            if (key !== ""){
                custom_keys = true;
                var value = $("#push_value" + key_number).val();
                // Slightly magic number, 6 = "{key}":"{value}",
                bytesRemaining -= (key.length + value.length + 6);
            }
          });

        // Need to add 1 back to bytesRemaining since the last key won't
        // be followed by a ,
        if (custom_keys){
            bytesRemaining += 1
        }

        return bytesRemaining;
    }

    var calculateRemainingPushBytes = function(e) {
        var bytesRemaining = getRemainingPushBytes();
        var previewChars = $('#preview-chars');
        previewChars.removeClass('alert').removeClass('warning');
        if (bytesRemaining > 10 && bytesRemaining <= 50) {
            previewChars.addClass('warning');
        }
        if (bytesRemaining <= 10) {
            previewChars.addClass('alert');
        }
        previewChars.text(bytesRemaining);
    }

    var calculateRemainingTitleBytes = function() {
        var bytesUsed = $("#id_title").val().length
          , previewChars = $("#title-preview-chars")
          , bytesRemaining = MAX_TITLE_BYTES - bytesUsed

        previewChars.removeClass('alert').removeClass('warning')

        if(bytesRemaining > 10 && bytesRemaining <= 15) {
            previewChars.addClass('warning')
        }

        if(bytesRemaining <= 10) {
            previewChars.addClass('alert')
        }

        previewChars.text(bytesRemaining)
    }
    
    var previewNotifications = function() {
      $("#preview-android > span,#preview-android > p").html($("#id_title").val());
    }

    var steps = (function() {

        function Step(opts) {
            for (k in opts) {
                this[k] = opts[k];
            }
            this.validations = {};
            this.validationConditions = {};
            this.values = {};
            if (!this.fields) {
                this.fields = {};
            }
            for (f in this.fields) {
                this.validations[f] = typeof this.fields[f].validation === 'string' ?
                this.validationFunctions[this.fields[f].validation] :
                this.fields[f].validation;
                this.values[f] = document.getElementById(f);
                if (this.fields[f].validateIf) {
                    this.validationConditions[f] = this.fields[f].validateIf;
                }
            }
        }

        Step.prototype.next = function() {
            var canProceed = true;
            for (f in this.fields) {
                if (this.validate(f) === false) {
                    canProceed = false;
                }
            }
            this.complete = canProceed;
            if (canProceed) {
                this.onNext.call(this);
            } else {
                this.onError.call(this);
            }
            return canProceed;
        };

        Step.prototype.previous = function() {
            this.onPrevious.call(this);
        };

        Step.prototype.validate = function(f) {
            if (!this.validations[f] ||
            (this.validationConditions[f] &&
            !this.validationConditions[f].call(this))) {
                return true;
            }

            var value = this.fields[f].getValue ?
            this.fields[f].getValue(this.values[f].id) :
            this.values[f].value;
            return this.validations[f].call(this, value);
        };

        Step.prototype.onNext = function() {};
        Step.prototype.onPrevious = function() {};
        Step.prototype.onError = function() {};

        Step.prototype.validationFunctions = {};

        Step.prototype.validationFunctions.notEmpty = function(v) {
            if (typeof v == 'undefined' || typeof v == null) {
                return false;
            }
            if (typeof v == 'string') {
                return v > '';
            }
            return false;
        };

        Step.prototype.validationFunctions.underByteMax = function(v) {
            return getRemainingPushBytes(v) > 0;
        };

        Step.prototype.validationFunctions.notEmptyUnderByteMax = function(v) {
            var notEmpty = this.validationFunctions.notEmpty.call(this, v)
              , underMax = this.validationFunctions.underByteMax.call(this, v)

            return notEmpty && underMax
        }

        function step(num) {
            $('div.step').hide();
            $('#step-' + num).fadeIn('fast');
            $('#rich-push-steps li a').removeClass('active');
            for (var j = 0; j < num + 1; j++) {
                $('#step-nav-' + j).addClass('active');
                currentStep = num;
            }
            if (num == 4) {
                $('#id_ready_to_deliver').val('1');
            } else {
                $('#id_ready_to_deliver').val('');
            }
            stepList[num].complete = false;
        }

        function showError(num, err) {
            $('#step-' + num).find('span.alert:last').html(err).show();
        }

        function saveAndContinue(num) {
        	step(num + 1);
//            var d = $('#rich-push-form').serialize();
//            // console.log('saving: ', d);
//            $.ajax({
//                url: "./",
//                dataType: 'json',
//                data: d,
//                type: 'post',
//                success: function(data) {
//                    step(num + 1);
//                    if (data.rich_push_history_id) {
//                        $('#id_rich_push_history_id').val(data.rich_push_history_id);
//                    }
//                }
//            });
        }

        function sendMessage() {
            $('#rich-push-form').submit();
        }

        var stepErrors = {
            NOT_EMPTY: "字段不允许为空",
            NO_TITLE: "请给推送通知设置一个标题",
            NOT_EMPTY_TOO_MANY_BYTES: "Please fill in all required fields, use " +
                MAX_BYTES + " or fewer bytes"
        };

        var previewSettings = {
            "iphone": {
                "width": 418,
                "height": 810
            },
            "iphone4": {
                "width": 772,
                "height": 1560
            },
            "ipad": {
                "width": 1186,
                "height": 1335
            }
        };

        var stepList = [];
        var currentStep = 0;

        var stepConfigs = [
        {
            // Template
            fields: {
                template: {
                    validation: 'notEmpty',
                    validateIf: function() {
                        return $('#template-select-yes').is(':checked');
                    }
                }
            },
            onNext: function() {
                // If this is a new message, populate TinyMCE with template content
                if (!window.isRichPushDraftMessage) {
                    var tpl = $('#template').val();
                    var url = $('#' + tpl).attr('link-data');
                    $.ajax({
                        url: url,
                        context: document.body,
                        async: false,
                        success: function(data) {
                            tinyMCE.get('display_message').setContent('');
                            tinyMCE.get('display_message').setContent(data);
                        }
                    });
                }
                step(this.stepNum + 1);
            },
            onError: function() {
                showError(this.stepNum, stepErrors.NOT_EMPTY);
            }
        },
        {
            // Message
            fields: {
                display_message: {
                    validation: 'notEmpty',
                    getValue: function(f) {
                        return tinyMCE.get(f).getContent();
                    }
                }
            },
            onNext: function() {
                //console.log('#id_message: ', $('#id_message').val());
                //console.log('tinyMCE.get: ', tinyMCE.get('display_message').getContent());
                //check to see if entered text = stored data
                if ($('#id_message').val() == tinyMCE.get('display_message').getContent()) {
                    //console.log('no changes, continue.')
                    step(this.stepNum + 1);
                } else {
                    //console.log('message not saved, saving now.')
                    $('#id_message').val(tinyMCE.get('display_message').getContent());
                    saveAndContinue(this.stepNum);
                }

            },
            onPrevious: function() {
                step(this.stepNum - 1);
            },
            onError: function() {
            }
        },
        {
            // Notification
            fields: {
                id_title: {
                    validation: 'notEmpty'
                }
            },
            onNext: function() {
                // reset the error border-color
                $('input#id_title').css('border-color','#ccc');
                saveAndContinue(this.stepNum);
            },
            onPrevious: function() {
                step(this.stepNum - 1);
            },
            onError: function() {
                showError(this.stepNum, stepErrors.NO_TITLE);
                $('input#id_title').css('border-color','red');
            }
        },
        {
            // Recipients
            fields: {
                id_tags: {
                    validation: 'notEmpty',
                    validateIf: function() {
                        return $('#select-recipient-some').is(':checked');
                    }
                }
            },
            onNext: function() {
                saveAndContinue(this.stepNum);
            },
            onPrevious: function() {
                step(this.stepNum - 1);
            },
            onError: function() {
                showError(this.stepNum, stepErrors.NOT_EMPTY);
            }
        },
        {
            // Review
            onPrevious: function() {
                step(this.stepNum - 1);
            }
        },
        {}
        ];


        function init() {

            for (var i = 0; i < stepConfigs.length; i++) {
                stepConfigs[i].stepNum = i;
                stepList.push(new Step(stepConfigs[i]));
            }

            $('div.step').each(function(i, item) {
                var al = $(item).find('span.alert');

                $(item).find('div.action button[rel=next]').bind('click',
                function() {
                    al.html('').hide();
                    stepList[i].next();
                    generatePayload();
                    return false;
                });

                $(this).find('div.action button[rel=back]').bind('click',
                function() {
                    stepList[i].previous();
                    generatePayload();
                    return false;
                });
            });

            $('#rich-push-steps li a').each(function(i, item) {
                $(this).bind('click',
                function() {
                    if (stepList[i].complete && i <= currentStep) {
                        step(i);
                    }
                    return false;
                });
            });

            $('#step-0 div.template').bind('click',
            function() {
                $('#step-0 div.template').removeClass('selected');
                $(this).addClass('selected');
                $('#template').val($(this).attr('id'));
            });

            $('div.preview a').bind('click',
            function(e) {
                e.preventDefault();
                var device = $(this).attr('class');
                function richPushPreview(id, device, template) {
                    function setMessageHeight() {
                        var preview_container = $('#preview_container');
                        var message_body_height = $(preview_container).contents().find('body').height();
                        if (message_body_height>preview_container.height()) {
                            $(preview_container).attr({'height':Math.round(message_body_height+50)});
                        } else {
                            $(preview_container).attr({'height':'100%'});
                        }
                    }
                    function setPreviewControls() {
                        $('#ipad-preview').each(function() {
                            $(document.createElement('button'))
                            .addClass('ipad-rotate')
                            .attr({
                                'id': 'ipad-rotate-button',
                                'title': 'Rotate iPad Preview'
                            })
                            .bind('click',
                            function(e) {
                                e.preventDefault();
                                // handle som edge cases first
                                if ($('#ipad-preview').hasClass('portrait') && $('#preview_container').contents().find('body').height() < 706) {
                                    // carry on
                                } else if ($('#ipad-preview').hasClass('landscape') && $('#preview_container').contents().find('body').height() < 960) {
                                    // carry on
                                } else {
                                    $('#preview_container').attr({'height':'0'});
                                }
                                // rotate the ipad
                                $('#ipad-preview').toggleClass('portrait').toggleClass('landscape');
                                // trigger the lightbox_me reposition
                                $('#rich-push-preview').trigger('reposition');
                                // resize the iframe
                                clearTimeout(resizeTimer);
                                resizeTimer = setTimeout(setMessageHeight, 500);
                            })
                            .prependTo('#email-links');
                        });
                        // bind events to email links
                        $('#send-email-links').bind('click',
                        function(e) {
                            $.ajax({
                                type: 'post',
                                url: 'email-preview/',
                                data: 'email=' + $('#email-links input[type=text]').val() + '&id=' + $('#id_rich_push_history_id').val() + '&csrfmiddlewaretoken=' + $("[name=csrfmiddlewaretoken]").val(),
                                success: function(res) {
                                    var emailalert = $('#email-links .alert');
                                    $(emailalert).html('Email Sent').css('display','inline-block').addClass('success');
                                    setTimeout(function(){
                                        $(emailalert).fadeOut('slow', function() {
                                            $(emailalert).html('').css('display','inline-block').removeClass('success');
                                        });
                                    }, 4000);
                                },
                                error: function(res) {
                                    var emailalert = $('#email-links .alert');
                                    $(emailalert).html('Enter an Email Address').show();
                                    setTimeout(function(){
                                        $(emailalert).fadeOut('slow', function() {
                                            $(emailalert).html('').toggle();
                                        });
                                    }, 4000);
                                }
                            });
                            return false;
                        });
                    }
                    var resizeTimer;
                    if (typeof template == 'undefined' || typeof template == null) template = 'default';
                    var url = 'preview/?id=' + id + '&device=' + device + '&template=' + template + ' #rich-push-preview-body';
                    preview = $(document.createElement('div')).addClass('rich-push-preview').attr({'id': 'rich-push-preview'}).load(url,
                    function() {
                        $(this).lightbox_me({
                            centered: true,
                            destroyOnClose: true,
                            zIndex: 200001,
                            onLoad: function() {
                                setPreviewControls();
                                clearTimeout(resizeTimer);
                                resizeTimer = setTimeout(setMessageHeight, 500);
                            },
                            onClose: function() {
                                //console.log();
                            }
                        });
                    });
                }

                // check if this message has already been saved
                if ($('#id_message').val() !== tinyMCE.get('display_message').getContent()) {
                    generatePayload();

                    // looks like this msg is new, let's save it before we continue
                    $('#id_message').val(tinyMCE.get('display_message').getContent());
                    var d = $('#rich-push-form').serialize();

                    $.ajax({
                        url: "./",
                        dataType: 'json',
                        data: d,
                        type: 'post',
                        success: function(data) {
                            //successful save, save the id and fire the preview
                            if (data.rich_push_history_id) {
                                $('#id_rich_push_history_id').val(data.rich_push_history_id);
                                richPushPreview(data.rich_push_history_id, device, $('#template').val());
                            }
                        }
                    });
                } else {
                    //already saved so we can fire the preview
                    richPushPreview($('#id_rich_push_history_id').val(), device, $('#template').val());
                }
            });

            $('#step-2 input[name=send_alert]').bind('click',
            function(e) {
                var container = $('#push-alert-content'),
                inputs = container.find('input[type=text], textarea');
                if ($(e.target).val() == '1') {
                    container.removeClass('disabled');
                    inputs.removeAttr('disabled');
                } else {
                    container.addClass('disabled');
                    inputs.attr('disabled', 'disabled');
                }
            });

            var recipientTypes = ['all', 'some'];
            $('#step-3 input[name=is_broadcast]').bind('click',
            function(e) {
                $(recipientTypes).each(function(i, item) {
                    $('#recipient-' + item).addClass('disabled');
                    $('#recipient-' + item + ' input[type=text]').attr('disabled', 'disabled');
                });
                var clicked = '#' + $(this).attr('id').replace(/^select\-/, '');
                $(clicked).removeClass('disabled');
                $(clicked + ' input[type=text]').removeAttr('disabled');
            });

            $('#step-4 button[rel=change]').each(function(i, item) {
                $(this).bind('click',
                function() {
                    step(i + 1);
                    return false;
                });
            });
            $('#step-4 button[rel=later]').each(function() {
                $(this).bind('click',
                function() {
                    $('#id_ready_to_deliver').val('');
                    $('#id_save_for_later').val('1');
                    $('#rich-push-form').submit();
                    return false;
                });
            });

        }

        return {
            init: init
        };

    } ());

    /**
     * Wrapper for tags functionality
     * @return {Object.<Function>} an interface to inner functions
     */
    var tags = (function() {

        var searchTimeout,
        selectedTags = {},
        results = [],
        currentResult = -1;

        var list,
        search,
        loader,
        selectedDisplay,
        defaultSearchValue;


        function saveTags() {
            var out = [];
            for (k in selectedTags) {
                out.push(k);
            }
            $('#id_tags').val(out.join(','));
        };

    /**
     * Event listener attached to window to allow keyboard navigation
     *     of tag search results and search box autocomplete.
     */
        function listListener(e) {
        /**
         * Only react if search box if focused.
         */
            if (search.is(':focus')) {
                switch (e.keyCode) {
                /**
                 * "tab to complete word" functionality in search box
                 */
                case 9:
                    // tab
                    if (list.is(':visible')) {
                        e.preventDefault();
                    }
                    break;
                /**
                 * capture return key and append highlighted tag
                 * to the tag list.
                 */
                case 13:
                    // enter
                    var selected;
                    if (results.length > 0) {
                        $('#result-' + currentResult).html();
                    } else {
                        selected = search.val();
                    }
                    list.hide();
                    if (!selectedTags[selected]) {
                        selectedDisplay.append('<a class="selected-tag">' +
                        search.val() + '</a>');
                    }
                    search.val('');
                    selectedTags[selected] = true;
                    generatePayload();
                    e.preventDefault();
                    break;
                /**
                 * Hide search box and reset search box value.
                 */
                case 27:
                    // esc
                    list.hide();
                    $(e.target).val(defaultSearchValue);
                    break;
                /**
                 * Navigate to the previous tag in search results list.
                 */
                case 38:
                    // up
                    currentResult--;
                    if (currentResult < 0) {
                        currentResult = results.length - 1;
                    }
                    search.val($('#result-' + currentResult).html());
                    e.preventDefault();
                    break;
                /**
                 * Navigate to the next tag in search results list.
                 */
                case 40:
                    // down
                    currentResult++;
                    if (currentResult > results.length - 1) {
                        currentResult = 0;
                    }
                    search.val($('#result-' + currentResult).html());
                    e.preventDefault();
                    break;
                }
                /**
                 * Reset the active classes on tag list and highlight
                 *     currently selected tag (if any).
                 */
                list.find('li').removeClass('active');
                $('#result-' + currentResult).addClass('active');
            }
            saveTags();
        };

    /**
     * Event listener for tag search box.
     * @param {Event} e
     * Fires off an AJAX request with search box contents.
     * Takes results and appends them to the search result DOM node.
     */
        function tagSearch(e) {
            loader.show();
            var value = $(e.target).val();
            if (value > '' && value != defaultSearchValue) {
                results = [];
                $.ajax({
                    url: "./tags/?tag=" + value,
                    dataType: 'json',
                    type: 'get',
                    success: function(data) {
                        loader.hide();
                        list.css({
                            width: search.get(0).offsetWidth,
                            left: 0
                        });
                        list.show().find('li').remove();
                        results = data,
                        currentResult = -1;
                        if (data.length > 0) {
                            var out = [];
                            for (var i = 0, tag; tag = data[i]; i++) {
                                out.push('<li id="result-' + i + '">' +
                                tag + '</li>');
                            }
                            list.append(out.join(''));
                        } else {
                            list.hide();
                        }
                    }
                });
            } else {
                list.hide();
                loader.hide();
            }
        };


    /**
     * Event listener for tag search box.
     * @param {Event} e
     * This is the actual function attached as an event listener
     *     that wraps a setTimeout around the tagSearch function
     *     so it doesn't clobber the server with every keystroke.
     */
        function performTagSearch(e) {
            /**
             * Only search when non-meta keys pressed.
             */
            if (e.keyCode != 13 &&
            // Enter
            e.keyCode != 38 &&
            // Up
            e.keyCode != 40 &&
            // Down
            e.keyCode != 27
            // Esc
            ) {
                clearTimeout(searchTimeout);
                searchTimeout = setTimeout(function() {
                    tagSearch(e);
                },
                500);
            } else {
        /**
         * If enter pressed, prevent submitting form
         */
                if (e.keyCode == 13) {
                    clearTimeout(searchTimeout);
                    results = [];
                    loader.hide();
                }
                e.preventDefault();
            }
        };

        /**
         * Initialize event listeners for tags.
         */
        function init(opts) {
            list = $('#tag-list');
            search = $('#tag_search');
            loader = $('#tag_loader');
            selectedDisplay = $('#selected-tags');
            defaultSearchValue = search.val();
            list.css({
                "width": search.width() + 'px',
                "left": 0
            });

            $(window).bind('keydown', listListener);

            search.bind('keydown', performTagSearch);

        /**
         * Reset placeholder text in search box on blur.
         */
            search.bind('blur',
            function(e) {
                var target = $(e.target);
                if (target.val() == '') {
                    target.val(defaultSearchValue);
                }
            });

        /**
         * Allow clicking on selected tags to remove them from the list.
         */
            selectedDisplay.bind('click',
            function(e) {
                var target = $(e.target);
                if (target.hasClass('selected-tag')) {
                    delete selectedTags[target.html()];
                    target.remove();
                }
                saveTags();
                generatePayload();
            });

        /**
         * When mousing over the tag search results list, highlight
         * item and set it as the currentResult, in case user
         * hits the Enter key.
         */
            list.bind('mouseover',
            function(e) {
                var target = $(e.target);
                if (target.get(0).nodeName == 'LI') {
                    list.find('li').removeClass('active');
                    target.addClass('active');
                    if (currentResult == -1) {
                        currentResult = 0;
                    }
                    for (var i = 0, res; res = results[i]; i++) {
                        if (res == target.html()) {
                            currentResult = i;
                            break;
                        }
                    }
                }
            });

        /**
         * Clear all active list items on mouse out and unset currentResult.
         */
            list.bind('mouseout',
            function(e) {
                list.find('li').removeClass('active');
                currentResult = -1;
            });

        /**
         * Allow clicking on tag search results list to select tag.
         */
            list.bind('click',
            function(e) {
                var target = $(e.target);
                if (target.get(0).nodeName == 'LI') {
                    search.val(target.html());
                    var selected = search.val();
                    if (!selectedTags[selected]) {
                        selectedDisplay.append('<a class="selected-tag">' +
                        search.val() + '</a>');
                    }
                    list.hide();
                    search.val(defaultSearchValue);
                    selectedTags[selected] = true;
                    search.focus();
                    saveTags();
                }
            });

        /**
         * If tags form field value is set, add them to the
         * selectedTags list.
         * Used when loading the page with pre-populated values.
         */
            if ($('#id_tags').val() > '') {
                var t = $('#id_tags').val().split(',');
                $.each(t,
                function(i, item) {
                    selectedTags[item] = item;
                    selectedDisplay.append('<a class="selected-tag">' +
                    item + '</a>');
                });
                $('#id_aps').attr('checked', 'checked');
                $('#id_device_token').val('');
                $('.revealed-field').hide();
                $('#tag-search-box').show();
                $('#tag_search').focus();
            }

        };

    /**
     * Expose internal functions as public API.
     */
        return {
            init: init
        };

    } ());

    function init() {
        steps.init();
        tags.init();
        tinyMCE.init({
            mode: "textareas",
            theme: "advanced",
            plugins: "autolink,lists,table,advlink,inlinepopups,insertdatetime,paste,nonbreaking,advlist,fullpage,media",
            theme_advanced_fonts: "Arial=arial,Helvetica=helvetica,Trebuchet MS=TrebuchetMS,Verdana=verdana,Arial Rounded=ArialRoundedMTBold,Georgia=georgia,Times New Roman=TimesNewRomanPSMT",
            theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,fontselect,fontsizeselect,formatselect,|,forecolor,backcolor",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,charmap,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,image,media,|,|,removeformat,cleanup,undo,redo,|,code",
            theme_advanced_buttons3: "",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_resizing: false,
            theme_advanced_path: false,
            width: '663',
            height: '500',
            editor_selector: 'editor',
            valid_children: '+body[style]',
            oninit: function() {
                if (window.isRichPushDraftMessage) {
                    $('#step-0 button[rel="next"]').click();
                }
            }
        });
        $("#push_sound").bind("keyup", calculateRemainingPushBytes);
        $("#push_alert").bind("keyup", calculateRemainingPushBytes);
        $("#push_key1").bind("keyup", calculateRemainingPushBytes);
        $("#push_value1").bind("keyup", calculateRemainingPushBytes);
        $("#id_title").bind("keyup", calculateRemainingTitleBytes);
        $("#id_title").bind("keyup", previewNotifications);
        calculateRemainingTitleBytes();
        calculateRemainingPushBytes();
    }

    init();

    /**
     * Expose internal functions as public API.
     */
    return {
        init: init,
        generatePayload: generatePayload,
        calculateRemainingPushBytes: calculateRemainingPushBytes
    };

} ());
