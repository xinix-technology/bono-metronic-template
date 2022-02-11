var SearchReference = function() {

    return {
        init: function(obj = null) {
            var element = $('.searchreference');
            var that = this;
            if (obj) {
                element = $(obj).find('.searchreference');
            }

            element.each(function() {
                var btnsearch = $(this).find('button.btn-search');
                var btnclear = $(this).find('button.btn-clear');
                var dataUrl = $(this).data('url');
                var dataLabel = $(this).data('title');
                var newthat = this;
                var $field = $(this).data('field');
                var searchform = that.templateform($field, dataLabel);

                var labelkey = { label: $(this).data('label'), key: $(this).data('key') };

                btnsearch.click(function(e) {
                    $('#theSearchReferenceModal'+dataLabel).modal('show')
                    $('#theSearchReferenceModal'+dataLabel).on('shown.bs.modal', function (e) {
                        var modal = $(this);

                        $(searchform).find('input').val('');
                        $(searchform).find('tbody').empty();

                        that.searchquery(searchform, dataUrl, { field: $field, labelkey: labelkey });

                        $(searchform).on('click', 'a', function(e) {
                            e.preventDefault();

                            $(newthat).find('input[type="text"]').val($(this).parents('tr').data('label'));
                            $(newthat).find('input[type="hidden"]').val($(this).parents('tr').data('value'));

                            $(modal).modal('hide');
                        });

                        $(searchform).on('click', 'a', function(e) {
                            e.preventDefault();

                            var dataEntry = JSON.stringify($(this).parents('tr').data('entry'));

                            $(newthat).find('input[type="text"]').val($(this).parents('tr').data('label'));
                            $(newthat).find('input[type="hidden"]').attr('data-entry', dataEntry);
                            $(newthat).find('input[type="hidden"]').val($(this).parents('tr').data('value')).trigger('change');
                            $(newthat).addClass('selected');

                            $(modal).modal('hide');
                        });
                    
                    });
                });

                btnclear.click(function(e) {
                    $(newthat).find('input[type="text"]').val('');
                    $(newthat).find('input[type="hidden"]').val('');
                    $(newthat).removeClass('selected');
                });

            });

        },

        templateform: function($field, label) {

            var dom = document.createElement('div');

            dom.className = 'modal fade';
            dom.setAttribute('id', 'theSearchReferenceModal'+label);
            dom.setAttribute('role', 'dialog');
            dom.setAttribute('tabindex', '-1');

            var body = '<div class="modal-dialog modal-dialog-centered" role="document">'+
                '<div class="modal-content">'+
                    '<div class="modal-header">'+
                        '<h5 class="modal-title" id="modalLabel'+label+'">Choose '+label+'</h5>'+
                    '</div>'+
                    '<div class="modal-body">'+
                        '<div class="card card-custom">'+
                            '<div class="card-body">'+
                                '<div class="row"><div class="col-md-12">' +
                                    '<input class="input-search form-control" name="name" placeholder="Search" autocomplete="off"/>' +
                                '</div> </div>' +
                                '<div class="row"><div class="table-responsive col-md-12">' +
                                    '<table class="table table-striped table-productreference">' +
                                        '<thead>' +
                                            '<tr></tr>' +
                                        '</thead>' +
                                        '<tbody>' +
                                        '</tbody>' +
                                    '</table>' +
                                '</div></div>' +
                            '</div>' +
                        '</div>' +
                    '</div>'+
                '</div>'+
            '</div>';


            dom.innerHTML = body;

            for (var key in $field) {
                $(dom).find('thead tr').append('<th>' + $field[key] + '</th>')

            }
            $(dom).find('thead tr').append('<th>&nbsp;</th>');

            $('body').append(dom);


            return dom;
        },

        searchquery: function(templateform, dataUrl, $attributes) {
            var inputsearch = $(templateform).find('input');
            var $field = $attributes.field;

            inputsearch.on('change', function(e) {
                var valquery = $(this).val();
                var keyquery = $(this).attr('name');
                var query = { '!include': 1 }

                if (valquery != '') {
                    query['!search'] = valquery;
                }
                console.log(dataUrl);
                console.log(query);
                $.ajax({
                    type: 'GET',
                    url: dataUrl,
                    data: query,
                    success: function(data) {
                        console.log(data);
                        if (data.entries.length == 0) {
                            return;
                        }
                        $(templateform).find('tbody').empty();

                        $.each(data['entries'], function(key, value) {
                            var dataEntry = JSON.stringify(value);

                            domdata = "<tr data-value='" + value[$attributes.labelkey.key] + "' data-label='" + value[$attributes.labelkey.label] + "' data-entry='" + dataEntry + "'>";

                            for (var key in $attributes.field) {
                                domdata += "<td>" + value[key] + "</td>";
                            }

                            domdata += "<td><a href='javascript:;' class='btn success btn-info'>choose</a></td></tr>";

                            $(templateform).find('tbody').append(domdata);
                        });
                    }
                });

            }).trigger('change');
        }

    };

}();

jQuery(document).ready(function() {
    SearchReference.init();
});