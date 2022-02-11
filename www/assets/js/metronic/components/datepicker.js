
var KTBootstrapDatepicker = function () {

    var arrows;
    if (KTUtil.isRTL()) {
        arrows = {
            leftArrow: '<i class="la la-angle-right"></i>',
            rightArrow: '<i class="la la-angle-left"></i>'
        }
    } else {
        arrows = {
            leftArrow: '<i class="la la-angle-left"></i>',
            rightArrow: '<i class="la la-angle-right"></i>'
        }
    }

    return {
        // public functions
        init: function(obj = null) {
            var element = $('.input-group.date.date-picker-bono');
            if (obj) {
                element = $(obj).find('.input-group.date.date-picker-bono');
            }

            element.each(function(e) {
                var d = new Date($(this).data('value'));
                var open = false;
                var input = $(this).find('input[type="text"]');
                var input_hidden = $(this).find('input[type="hidden"]');

                var datepicker = input.datepicker({ 
                    autoclose: true, 
                    format: $(this).attr('date-format'), 
                    embedded: true,
                    rtl: KTUtil.isRTL(),
                    todayHighlight: true,
                    templates: arrows,
                    autoclose:true
                });

                datepicker.datepicker('update', new Date($(this).data('value')));
                datepicker.on('changeDate', function(e) {
                    input_hidden.val(new Date(e.date).toLocaleDateString('pt-br').split( '/' ).reverse( ).join( '-' ));
                    open = false;
                });
                $(this).find('button').click(function(e) {
                    if (!open) {
                        datepicker.datepicker('show');
                        open = true;
                    } else {
                        datepicker.datepicker('hide');
                        open = false;
                    }
                });
            });
        }
    };
}();

jQuery(document).ready(function() {    
    KTBootstrapDatepicker.init();
});
