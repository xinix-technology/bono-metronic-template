var alert_notify = function(message, type, cb = null) {

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "5000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    if (type == 'danger') {
        toastr.error(message);
    } else {
        toastr.success(message);
    }
    if (cb) {
        cb();
    }
    

}


$(function() {
    $('notification.notification-alert').find('div.alert').each(function() {
        var type = 'danger';
        if ($(this).hasClass('info')) {
            type = 'success'
        }
        $(this).find('span').each(function() {
            alert_notify($(this).text(), type);
        })

    });
});