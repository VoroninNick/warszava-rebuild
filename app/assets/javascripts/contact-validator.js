    $(document).ready(function() {
    
//    if ($.cookie('e_mails') == 1) {
//        $("#contact-form").hide();
//        $('.contact-h1-second').after('<div class="succses"><h2>Дякуємо!</h2><p>Ваше повідомлення було успішно відправленно.</p></div>');
//    };
    

 
    $("#btn-submit").click(function(event) {
        event.preventDefault()
        $(".error").hide();
        var hasError = false;
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var phoneReg = /[0-9 () *]{9}/;
 
        var emailaddressVal = $("#UserEmail").val();
        var nameVal = $("#UserName").val();
        var phoneaVal = $("#UserPhone").val();
        var msgVal = $("#UserMsg").val();
        var msgErrorMessage = $('#UserMsg').attr('data-error-message')
        var phoneErrorMessage = $('#UserPhone').attr('data-error-message')
        var nameErrorMessage = $('#UserName').attr('data-error-message')
        var emailErrorMessage = $('#UserEmail').attr('data-error-message')

        if(nameVal == '') {
            $("#UserName").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">'+nameErrorMessage+'</span>');
            hasError = true;

        }
        if(emailaddressVal == '' || !emailReg.test(emailaddressVal)) {
            $("#UserEmail").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">'+emailErrorMessage+'</span>');
            hasError = true;

        }
        if(phoneaVal == '' || !phoneReg.test(phoneaVal)) {
            $("#UserPhone").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: right;color: #7c1616;">'+phoneErrorMessage+'</span>');
            hasError = true;

        }
        if(msgVal == '') {

            $("#UserMsg").after('<span class="error" style="padding-left: 20px;font-size: 10px;float: left;color: #7c1616;">'+msgErrorMessage+'</span>');
            hasError = true;
        }


        if(hasError == true) { 
            //return false;
        }else{
            //var date = new Date();
            //date.setTime(date.getTime() + (1 * 60 * 1000));
            //var expiry = {seconds:25*60};
            //$.cookie( 'e_mails', '1', { expires: expiry } );

            $("#contact-form-section").hide();
            var $contact_form = $('#contact-form').find('form')
            data = $contact_form.serializeArray()
            var target_url = $contact_form.attr('action') + '?ajax=true'
            $.post(target_url, data,
                function(){
                    console.log('thanks for message')

                })
            //return false;
        }
 
    });
});