
function guidGenerator()
{
    var S4 = function ()
    {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };

    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}

function showDialog(url, title, width, height)
{
    $(function ()
    {
        $('#modal-container').load(url, null, function ()
        {
            $('#modal-container').dialog(
                {
                    title: title,
                    minWidth: width,
                    minHeight: height,
                    modal: true
                });
        });
    });
}

function hideDialog()
{
    $(function () { var dialog = $('#modal-container').dialog('close'); return false; });
}

function showAlert(url, title, width, height)
{
    hideDialog();
    showDialog(url, title, width, height);

    setTimeout(function (e)
    {
        $('#modal-container').fadeOut('fast', function ()
        {
            $(this).dialog('close');
        });
    }, 1500);
}

function requestAuthentication()
{
    $('#login-dialog').dialog({ title: 'Sign In', minWidth: 200, minHeight: 100, modal: true });
}

function callAction(controller, action, data, success, failure)
{

    $.ajax(
        {
            url: websiteRoot + controller + '/' + action,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: success,
            error: failure
        });
}

function ajaxFailure(context)
{
    var c = context;

}