const currentUrl = window.location.href
var url = new URL(currentUrl);
if (url.searchParams.get('!limit')) {
    $('select.datatable-pager-size').val(url.searchParams.get('!limit'))
}
$('select.datatable-pager-size').on('change', function () {
    var url = new URL(currentUrl);
    if (url.searchParams.get('!skip')) {
        url.searchParams.delete('!skip')
    }
    url.searchParams.set("!limit", $(this).val());
    var newUrl = url.href;
    window.location.href = newUrl;
})