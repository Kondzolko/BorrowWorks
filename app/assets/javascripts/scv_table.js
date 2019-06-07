function FrozeTable(id, collaps_id) {
    $('#' + collaps_id).on('shown.bs.collapse', function() {
    }).on('show.bs.collapse', function() {
        if($('#' + collaps_id).has('#' + id + '_Content_Fixed').length < 1){
            setTimeout(function() {
                var options = new GridViewScrollOptions();
                options.elementID = id;
                options.width = 930;
                options.height = 600;
                options.freezeColumn = true;
                options.freezeFooter = false;
                options.freezeColumnCssClass = "GridViewScrollItemFreeze small";
                options.freezeFooterCssClass = "GridViewScrollFooterFreeze small";
                options.freezeColumnCount = 3;

                console.log(options)
                gridViewScroll = new GridViewScroll(options);
                gridViewScroll.enhance();
            }, 40)
        }
    });
}

function UpdateSelectors(column, list_id, object, org_id) {
    data = {}
    data['list_id'] = list_id;
    data['column'] = column;
    data['selected'] = object.value;
    $.ajax({
        type: 'POST',
        dataType: 'script',
        url: '',
        data: data
    });
};


function ScrollRight(id) {
    var leftPos = $('#gvMain'+ id +'_Content_Fixed').scrollLeft();
    $('#gvMain'+ id +'_Content_Fixed').animate({scrollLeft: leftPos + 150}, 300);
}
function ScrollLeft(id) {
    var leftPos = $('#gvMain'+ id +'_Content_Fixed').scrollLeft();
    $('#gvMain'+ id +'_Content_Fixed').animate({scrollLeft: leftPos - 150}, 300);
}

$('#uploadList').on('hidden.bs.modal', function (e) {
    if($('#list').hasClass('in')) {}
    else {$('#list').modal('show');}
});

AutoFileUpload()
function AutoFileUpload() {
    $("input[name='file']").change(function() {
        var formData = new FormData(this.form);
        org_id = window.location.pathname.replace(/\D/g,'');

        $.ajax({
            url: '' + org_id + '/import_list',
            method: 'POST',
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,  // Important!
            contentType: false
        })
    });
}