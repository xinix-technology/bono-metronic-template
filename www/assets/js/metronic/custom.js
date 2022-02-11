var url = {
    getquery: function(name, url) {
        url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

}

$(function() {
    //simple search -- page search
    $("form#formsearch input#searchbar").keypress(function(evt) {
        if (evt.keyCode == 13) {
            evt.preventDefault();

            var findValue = $(this).val();
            var Url = window.location.href.replace(/\?.*/g, "");
            if (findValue.length == 0) {
                return;
            } else {
                var finderUrl = Url + '?!search=' + findValue;
            }
            window.location = finderUrl;
        }
    });

    $("form#formsearch input#searchbar").val(url.getquery('!search'));

    // end simple search



    // $('th type=[type=checkbox]').('checked')
    $('.group-checkable').click(function(event) {
        if (this.checked) {
            // Iterate each checkbox
            $('.checkboxes').each(function() {
                this.checked = true;
            });
        } else {
            $('.checkboxes').each(function() {
                this.checked = false;
            });
        }
    });

    // popup delete
    $('#theModal').on('show.bs.modal', function (e) {

        var button = $(e.relatedTarget);
        var modal = $(this);
    
        modal.find('.modal-header #modalLabel').html(button.data("title"));
    
        modal.find('.modal-body').load(button.data("remote"));
    
    });


    $(function() {
        $('data-repeater-item:first-child').find('.button-delete').hide();
        $('data-repeater-item').find('.button-add').hide();
    });
    

    //multiple delete on search
    $('a.btn-multi-delete').click(function(e) {
        e.preventDefault();
        var $delete = [];
        $('input.search-checkbox').each(function(e) {
            if ($(this).is(':checked')) {
                $delete.push($(this).val());
            }
        });

        var that = $(this)

        if ($delete.length > 0) {
            $('#theMultipleDeleteModal').modal('show')
            $('#theMultipleDeleteModal').on('shown.bs.modal', function (e) {
                var modal = $(this);
            
                modal.find('.modal-header #modalLabel').html(that.attr('data-title'));
            
                modal.find('.modal-body').load(that.attr('href').toString().replace(':mutliid', $delete.join()));
            
            });
        }

    });

    //search advance
    $('#btn-advance').on('click', function() {
        $('.advance').animate({ height: 'toggle' }, 'fast');
    });
    $('.advance .btn-cancel').on('click', function() {
        $('.advance').hide();
    });

    $("#kt_quick_user span.form-control.form-control-solid").each(function() {
        $(this).removeClass('form-control form-control-solid');
    })
});