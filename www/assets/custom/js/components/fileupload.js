var FileUpload = function() {
    return {
        init: function(obj = null) {
            var element = $('fileupload .fileupload');
            if (obj) {
                element = $(obj).find('fileupload');
            }
            Dropzone.autoDiscover = false;
            Array.prototype.slice.call(document.querySelectorAll('fileupload .fileupload')).forEach(element => {
                var uri = element.dataset.url;
                var value = element.querySelector("input[type='hidden']").value;
                var myDropzone = new Dropzone(element, {
                    url: uri,
                    maxFiles: 1,
                    maxFilesize: 10, // MB
                    addRemoveLinks: true,
                    thumbnailWidth: null,
                    thumbnailHeight: null,
                    init: function() {
                        this.on("success", function(file, response) {
                            if (this.files.length > 1) {
                                this.removeFile(this.files[0]);
                            }
                            if (response.length > 0) {
                                element.querySelector("input[type='hidden']").value = JSON.stringify(response[0])
                            }
                        })
                    }
                });

                if (value != '') {
                    value = JSON.parse(value);
                    var mockFile = { name: value.name, size: 12345 };
                    myDropzone.options.addedfile.call(myDropzone, mockFile);
                    myDropzone.options.thumbnail.call(myDropzone, mockFile, window.base_url + value.bucket + '/' + value.filename);
                    myDropzone.options.complete.call(myDropzone, mockFile);
                    myDropzone.files.push(mockFile);
                }
            });

            $('filereadonly').each(function(e) {
                var obj = this;
                if ($(this).find('input[type="hidden"]').val() == '') {
                    $(this).find('button.btn-download').attr('disabled', true);
                    return;
                }
                $(this).find('button.btn-download').click(function(e) {
                    var data = JSON.parse($(obj).find('input[type="hidden"]').val());
                    console.log(data)
                    var url = $(obj).data('url') + data.bucket + '/' + data.filename;
                    window.open(url, '_blank');

                });
            });
        }
    }
}();

$(document).ready(function() {
    FileUpload.init();
});