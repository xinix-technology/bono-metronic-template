var FileUpload = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            var element = $('fileupload');

            if (obj) {
                element = $(obj).find('fileupload');
            }

            element.each(function(e) {
                var obj = $(this);
                var native = this
                var value = obj.find("input[type='hidden']").val();
                var button = native.querySelector('button');
                var file = obj.find('input[type="file"]');


                if (value != '') {
                    var img = document.createElement('img');
                    value = JSON.parse(value);
                    obj.find('.fileupload-filename').html(value.name);
                    if (obj.hasClass('fileupload-new')) {
                        obj.removeClass('fileupload-new');
                        obj.addClass('fileupload-exists');
                    }
                }

                $(button).click(function(e) {
                    e.preventDefault();
                    file.trigger('click');

                });

                obj.find("input[type='file']").change(function(e) {
                    var input = $(this).get(0).files;
                    var uri = obj.data('url');
                    FileUpload.spinner.start(obj);

                    if (obj.data('bucket') != '') {
                        uri += '?bucket=' + obj.data('bucket');
                    }

                    FileUpload.upload(input, uri, function(data, error) {
                        FileUpload.spinner.stop(obj);
                        if (error) {
                            return;
                        }

                        if (obj.hasClass('fileupload-new')) {
                            obj.removeClass('fileupload-new');
                            obj.addClass('fileupload-exists');
                        }

                        if (data.length > 0) {
                            obj.find('input[type="hidden"]').val(JSON.stringify(data[0]));
                            var curobj = data[0];

                            obj.find('.fileupload-filename').html(curobj.name);
                        }


                    });

                });

                obj.find('a.fileupload-exists').click(function(e) {
                    if (obj.find('.fileupload-filename').length > 0) {
                        obj.find('.fileupload-filename').html('');
                    }

                    if (obj.hasClass('fileupload-exists')) {
                        obj.removeClass('fileupload-exists');
                        obj.addClass('fileupload-new');
                    }


                });

            });


            $('filereadonly').each(function(e) {
                var obj = this;
                if ($(this).find('input[type="hidden"]').val() == '') {
                    $(this).find('button.btn-download').attr('disabled', true);
                    return;
                }
                $(this).find('button.btn-download').click(function(e) {
                    var data = JSON.parse($(obj).find('input[type="hidden"]').val());
                    var url = $(obj).data('url') + data.bucket + '/' + data.filename;
                    window.open(url, '_blank');

                });
            });
        },
        processFile: function(files) {
            Thumbnail.processFile(files);

        },


        upload: function(file, url, cb = null) {
            Thumbnail.upload(file, url, cb);
        },
        spinner: function() {
            return {
                start: function(obj) {
                    obj.find('button span.spinner').addClass('show');
                    obj.find('.btn').attr('disabled', true);

                },
                stop: function(obj) {
                    obj.find('button span.spinner').removeClass('show');
                    obj.find('.btn').attr('disabled', false);
                }
            }
        }()

    };

}();

jQuery(document).ready(function() {
    FileUpload.init();
});