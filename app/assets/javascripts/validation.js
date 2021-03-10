function hideValidateOnFocus() {
    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
            var thisAlert = $(this).parent();
            $(thisAlert).removeClass('alert-validate');
        });
    });
}

$(function() {
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;
        input = $('.validate-input .input100');
        return on_submit_form(check);
    });

    hideValidateOnFocus();

    function on_submit_form(check) {
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        return check;
    }

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        } else if ($(input).attr('type') == 'phone' || $(input).attr('name') == 'telephone') {
            if($(input).val().trim().match('^\\d+$') == null || ($(input).val().length < 6) || ($(input).val().length > 15)) {
                return false;
            }

        } else if (($(input).attr('type') == 'checkbox' || $(input).attr('name') == 'checkbox')) {
            let checkbox_id = $(input).attr('id');
            if (document.getElementById(checkbox_id).checked == false) {
                return false;
            }

        } else if (($(input).attr('type') == 'password')  || ($(input).attr('name') == 'password') ) {
            if ( (document.getElementById("password_checkbox") != null) && (document.getElementById("password_checkbox").checked == true)) {
                if ($(input).val().trim() == '') {
                    return false;
                } else if (($(input).val() != document.getElementById('old_password').value != '') && ($(input).val() != document.getElementById('password').value) || (($(input).val().length < 6))) {
                    return false;
                }
            } else if (document.getElementById("password_checkbox") == null) {
                if (($(input).val().trim() == '') || ($(input).val().length < 6 || ($(input).val() != document.getElementById('password').value))) {
                    return false;
                }
            }

        } else if($(input).val().trim() == ''){
            return false;
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }
});
