var Select2Reference = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            var element = $('.select2reference.select2');
            if (obj) {
                element = obj.find('.select2reference.select2');
            }
            element.each(function() {
                $(this).select2({ width: '100%' });
                $(this).val($(this).data('value')).trigger('change');

            });
        }

    };

}();

jQuery(document).ready(function() {
    Select2Reference.init();
});