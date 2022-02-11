var Themes = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            if (obj) {
                $(obj).find('#createform input[type=text],#updateform input[type=text],#readform input[type=text]').addClass('form-control');
                $(obj).find('#createform input[type=password],#updateform input[type=password]').addClass('form-control col-md-6');
                $(obj).find('#createform input[type=password],#updateform input[type=password]').removeClass('span-6');

                $(obj).find('#createform textarea,#updateform textarea, #readform textarea').addClass('form-control');
                $(obj).find('#createform select,#updateform select').addClass('form-control');
                $(obj).find('#createform input[type=text],#updateform input[type=text]').attr('placeholder', '');
                $(obj).find('#readform span.field').addClass('form-control form-control-solid');
                $(obj).find('#createform .form-group label,#updateform .form-group label').addClass('control-label');

            } else {
                $('#createform input[type=text],#updateform input[type=text],#readform input[type=text]').addClass('form-control');
                $('#createform input[type=password],#updateform input[type=password]').addClass('form-control col-md-12');
                $('#createform input[type=password],#updateform input[type=password]').removeClass('span-6');

                $('#createform textarea,#updateform textarea, #readform textarea').addClass('form-control');
                $('#createform select,#updateform select').addClass('form-control');
                $('#createform input[type=text],#updateform input[type=text]').attr('placeholder', '');
                $('#readform span.field').addClass('form-control form-control-solid');
                $('#createform .form-group label,#updateform .form-group label').addClass('control-label');

            }


        }

    };

}();

jQuery(document).ready(function() {
    Themes.init();
});