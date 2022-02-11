var multireference = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            var element = $('.multi_reference');

            if (obj) {
                element = obj.find('.multi_reference');
            }

            element.each(function() {
                var component = $(this).select2({ width: '100%' });
            });
        }

    };

}();

jQuery(document).ready(function() {
    multireference.init();
});