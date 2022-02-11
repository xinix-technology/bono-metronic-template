var InputMask = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            var element = $('.inputmask');

            if (obj) {
                element = $(obj).find('.inputmask');
            }

            element.each(function() {
                $(this).inputmask({ "mask": $(this).attr('mask') });

            });

        }

    };

}();

jQuery(document).ready(function() {
    InputMask.init();
});