display_modal = false
form_loading = false
form_loaded = false

$(document).on('ready', function(){
    $body = $('body')
})

function getLocale(){
    return $('html').attr('lang')
}

function showModal($link){
    $modal_wrapper = $('#modal-wrapper')
    if(display_modal && $modal_wrapper.length > 0) {

        var room_id = $link.attr('data-room-id')

        $modal_wrapper.find('select').val(room_id)
        //href = $link.attr('href')
        //console.log('showModal: $link: href='+href)

        //$contact_header = $modal_wrapper.find('.contact-header')
        //$tabs = $contact_header.find('[id*=tab]')
        //$selected_tab = $tabs.filter('[data-url*="' + href + '"]')
        //selected_tab_content_id = $selected_tab.attr('data-tab-content-id')

        //$tab_contents = $modal_wrapper.find('.body-contacts')

        //$selected_tab_content = $tab_contents.filter('#' + selected_tab_content_id)

        //$tabs.removeClass('contact-active-tab')
        //$selected_tab.addClass('contact-active-tab')

        //$tab_contents.attr('style', 'display:none;')
        //$selected_tab_content.attr('style', 'display:block;')

        //$('#modal-wrapper .contact-header')

        $.fancybox({
            'padding': 0,
            'width': 1100,
            'height': 722,
            //'type':     'iframe',
            content: $modal_wrapper,
            beforeShow: function(){
                $(".fancybox-wrap").addClass("room-form-popup");
            },
            afterShow: function () {
                $body.css({overflow: 'hidden'})
            },
            beforeClose: function () {
                $body.css({overflow: 'auto'})
            }
        });
    }
}

function loadModalContent(){

    if(!form_loaded && !form_loading ) {
        form_loading = true
        console.log('form loading')
        $.ajax({
            type: 'get',
            url: '/' + getLocale() + '/rooms/order?modal=true',
            success: function (data) {
                form_loaded = true
                form_loading = false

                var $data = $(data)
                $data.wrap('<div style="display:none;" id="modal-wrapper"></div>');
                var $modal_wrapper = $data.parent()
                console.log('before insert')
                $body.append($modal_wrapper)
                //initTabs()
                initFormValidation()

                //console.log(' form initialized ')

                if (display_modal) {
                    showModal(display_modal)
                }

                //console.log(' form showed ')


            }
        })
    }
}

function initTabs(){


    $modal_wrapper = $('#modal-wrapper');
    $contact_header = $modal_wrapper.find('.contact-header');

    $tabs = $contact_header.find('[id*=tab]')

    $close_button = $contact_header.find('.modal-cls-btn')

    $close_button.click(function(){
        parent.$.fancybox.close( true );
    });


    $tabs.click(function(){
        var $tab = $(this)
        tab_content_id = $tab.attr('data-tab-content-id')
        var $tab_contents = $modal_wrapper.find('.body-contacts')
        var $tab_content = $tab_contents.filter('#'+tab_content_id)



        $tab_contents.hide();
        $tab_content.show();


        $tabs.removeClass("contact-active-tab");
        $tab.addClass("contact-active-tab");


        //$('#wrapper').addClass('selected-' + $tab.attr('id'))
    });



}

//function initFormValidation(){
//    $.validate({
//        form: '#order-form, #join-us-form'
//    })
//
//    var $forms = $('#order-form, #join-us-form')
//    $forms.submit(function(event){
//        var $form = $(this)
//        //console.log('submit order form')
//        if( $form.find('.error').length == 0 ){
//            event.preventDefault()
//            var form_data = $form.serialize()
//            var $form_container = $form.parent()
//            var $form_waiting = $form_container.find('.form-waiting')
//            $form.remove()
//            $form_waiting.show()
//            $.ajax({
//                url: $form.attr('action'),
//                type: 'POST',
//                data: form_data,
//                complete: function(){
//                    $form.animate(
//                        {
//                            opacity: 0
//                        },
//
//                        {
//                            complete: function(){
//                                var $alert = $form_container.find('.form-success-alert')
//                                $form_waiting.hide()
//                                //var $alert = $('<div id="alert"></div>')
//
//                                $alert.show()
//                            }
//                        }
//                    )
//                }
//            })
//        }
//
//        //console.log('submit order form')
//
//        return false
//    })
//}

function getFormForControl(selector){
    var $obj = $(selector)

    if($obj[0].tagName.toLowerCase() == 'form'){
        return $obj
    }
    else{
        return getFormForControl($obj.parent())
    }

}

function initFormValidation(){
    $("input[type=submit]").click(function(event) {
        event.preventDefault()
        $(".error").hide();
        var hasError = false;
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var phoneReg = /[0-9 () *]{9}/;

        var emailaddressVal = $("#UserEmail").val();
        var nameVal = $("#UserName").val();
        var phoneaVal = $("#UserPhone").val();
        var msgVal = $("#UserMsg").val();
        var room_id = Number.parseInt( $('select').val() )

//        if (nameVal == '' && emailaddressVal == '' && phoneaVal == '' && msgVal == ''){
//            $("#UserName").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваше імя! </span>');
//            $("#UserEmail").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Вашу поштову скриньку!</span>');
//            $("#UserPhone").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваш телефон!</span>');
//            $("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">Введіть будь-ласка Ваше повідомлення!</span>');
//            hasError = true;
//
//        }
        if(room_id == 0){
            $("select").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Виберіть, будь-ласка, номер! </span>');
            hasError = true
        }
        if(nameVal == '') {
            $("#UserName").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваше імя! </span>');
            //$("#UserEmail").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Вашу поштову скриньку!</span>');
            //$("#UserPhone").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваш телефон!</span>');
            //$("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">Введіть будь-ласка Ваше повідомлення!</span>');
            hasError = true;

        }
        if(emailaddressVal == '' || !emailReg.test(emailaddressVal)) {
            $("#UserEmail").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Вашу поштову скриньку!</span>');
            //$("#UserPhone").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваш телефон!</span>');
            //$("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">Введіть будь-ласка Ваше повідомлення!</span>');
            hasError = true;

        }
        if(phoneaVal == '' || !phoneReg.test(phoneaVal)) {
            $("#UserPhone").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">Введіть будь-ласка Ваш телефон!</span>');
            //$("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">Введіть будь-ласка Ваше повідомлення!</span>');
            hasError = true;

        }
        if(msgVal == '') {
            $("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">Введіть будь-ласка Ваше повідомлення!</span>');
            hasError = true;
        }


        if(hasError == true) {
            //return false;
        }else{
            //var date = new Date();
            //date.setTime(date.getTime() + (1 * 60 * 1000));
            //var expiry = {seconds:25*60};
            //$.cookie( 'e_mails', '1', { expires: expiry } );

            var room_id = $('select').val()

            $("#contact-form-section").hide();
            var $contact_form = $('#order-form-wrapper').find('form')
            data = $contact_form.serializeArray()

            var target_url = '/' + getLocale() + '/rooms/' + room_id.toString() + '/order' + '?ajax=true'
            $.post(target_url, data,
                function(){
                    console.log('thanks for message')

                })
            //return false;
        }

    });
}



$(document).on('ready page:load', function(){
    display_modal = false
    loadModalContent()
})

$(document).on('ready page:load', function() {



    $(".modal-link").each(function() {
        //console.log('init modal link')
        $link = $(this)
        var original_href = $link.attr('href')

        if(1 == 2) {
            $link.fancybox({
                href: original_href + '?iframe=true',
                padding: 0,
                width: 1100,
                //height: 746,
                autoHeight: true,
                closeBtn: false,
                overlayOpacity: '0.4',
                overlayColor: '#fff',
                closeClick: true,
                scrolling: 'no',
                helpers: {
                    overlay: {
                        locked: false
                    }
                },
                iframe: {
                    preload: true
                },
                beforeLoad: function () {
                    console.log('fancybox before_load')
                },
                afterLoad: function () {
                    console.log('fancybox after_load')
                },
                afterClose: function () {
                    $("#contact-form").removeClass("current");
                    if (window.location.pathname == "/about") {
                        $("#li-about").addClass("current");
                    } else if (window.location.pathname == "/service") {
                        $("#li-service").addClass("current");
                    } else if (window.location.pathname == "/articles") {
                        $("#li-article").addClass("current");
                    }

                },

                aftershow: function () {
                    console.log('fancybox after_show')
                    $iframe = $('.fancybox-iframe')
                    $iframe_body = $iframe.contents().find('body')
                    $iframe_body_wrapper = $iframe_body.find('#wrapper')


                    wrapper_height = $iframe_body_wrapper.height()

                    $('.fancybox-wrap, .fancybox-skin, .fancybox-outer, .fancybox-inner, .fancybox-iframe').css({
                        height: '' + wrapper_height + 'px'
                    });

                    console.log('wrapper_height:' + wrapper_height)
                },

                beforeShow: function () {
                    console.log('fancybox before_show')
                    $iframe = $('.fancybox-iframe')
                    $iframe_body = $iframe.contents().find('body')
                    $iframe_body_wrapper = $iframe_body.find('#wrapper')


                    wrapper_height = $iframe_body_wrapper.height()

                    $('.fancybox-wrap, .fancybox-skin, .fancybox-outer, .fancybox-inner, .fancybox-iframe').css({
                        height: '' + wrapper_height + 'px'
                    });


                    $iframe_contact_header = $iframe_body.find('.contact-header')
                    $tabs = $iframe_contact_header.find('[id*=tab]')
                    $tabs.click(function () {
                        $tab = $(this);
                        $active_tab = $tabs.filter('.contact-active-tab')
                        wrapper_height = $iframe_body_wrapper.height()

                        console.log('wrap_height:' + wrapper_height)

                        $('.fancybox-wrap, .fancybox-skin, .fancybox-outer, .fancybox-inner, .fancybox-iframe').css({
                            height: '' + wrapper_height + 'px'
                        });

                    });

                    console.log('hello')
                }
            });

        }



        $link.click(function(event){
            event.preventDefault()
            var $link = $(this)

            display_modal = $link
            showModal($link)
        })
    })

    var $window = $(window);

    if(1 == 2) {
        $window.resize(function () {
            var window_width = window.innerWidth
            var window_height = window.innerHeight
            var $wrapper = $('.fancybox-wrap').find('iframe').contents().find('#wrapper');
            var $inner = $('.fancybox-inner');
            //$inner.height( $wrapper.height() );
            $('.fancybox-wrap, .fancybox-skin, .fancybox-outer, .fancybox-inner, .fancybox-iframe').css({
                'max-height': '' + window_height + 'px',
                'max-width': '' + window_width + 'px'
            });
        })
    }
});

