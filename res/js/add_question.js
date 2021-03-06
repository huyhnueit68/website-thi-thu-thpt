$(function() {
    $('.tabs').tabs();
    $('select').select();
    select_grade();
    select_subject();
    $('#add_question_form').on('submit', function() {
        submit_add_question($('#add_question_form').serializeArray());
        $('#add_question_form')[0].reset();
        CKEDITOR.instances.question_detail.setData('', function() {
            this.updateElement();
        })
        CKEDITOR.instances.answer_a.setData('', function() {
            this.updateElement();
        })
        CKEDITOR.instances.answer_b.setData('', function() {
            this.updateElement();
        })
        CKEDITOR.instances.answer_c.setData('', function() {
            this.updateElement();
        })
        CKEDITOR.instances.answer_d.setData('', function() {
            this.updateElement();
        })
    });
    $('#add_via_file').on('submit', function() {
        $('#preload').removeClass('hidden');
        submit_add_question_via_file();
        $('#add_via_file')[0].reset();
        $('#preload').removeClass('hidden');
    });
});

function submit_add_question(data) {
    data[0]['value'] = CKEDITOR.instances.question_detail.getData();
    data[1]['value'] = CKEDITOR.instances.answer_a.getData();
    data[2]['value'] = CKEDITOR.instances.answer_b.getData();
    data[3]['value'] = CKEDITOR.instances.answer_c.getData();
    data[4]['value'] = CKEDITOR.instances.answer_d.getData();
    $('#preload').removeClass('hidden');
    var url = "index.php?action=check_add_question";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        select_grade();
        select_subject();
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function submit_add_question_via_file() {
    $('#preload').removeClass('hidden');
    $('#error').text('');
    var file_data = $('#file_data').prop('files')[0];
    var subject = $('#_subject').val();
    var type = file_data.type;
    var size = file_data.size;
    var match = ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel", "application/wps-office.xlsx"];
    if (type == match[0] || type == match[1] || type == match[2]) {
        var form_data = new FormData();
        form_data.append('file', file_data);
        form_data.append('subject_id', subject);
        $.ajax({
            url: 'index.php?action=check_add_question_via_file',
            dataType: 'text',
            cache: false,
            contentType: false,
            processData: false,
            data: form_data,
            type: 'post',
            success: function(result) {
                var json_data = $.parseJSON(result);
                show_status(json_data);
                select_grade();
                select_subject();
            }
        });
    } else {
        $('#error').text('Sai ?????nh d???ng m???u, y??u c???u file excel ??u??i .xlsx theo m???u. N???u file l???i vui l??ng t???i l???i m???u v?? ??i???n l???i.');
    }
    $('#preload').addClass('hidden');
}