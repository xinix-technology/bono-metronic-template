var alert_notify = function(message, options = {}, cb = null) {

    var _default = {
        z_index: 99999,
        allow_dismiss: true,
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        placement: {
            from: "top",
            align: "center"
        }
    }

    _default = $.extend({}, _default, options);

    $.notify(message, _default);
    if (cb) {
        cb();
    }

}


$(function() {
    $('notification.notification-alert').find('div.alert').each(function(e) {
        var type = 'danger';
        if ($(this).hasClass('info')) {
            type = 'success'
        }
        alert_notify({ 'message': $(this).html() }, { type: type });

    });
});