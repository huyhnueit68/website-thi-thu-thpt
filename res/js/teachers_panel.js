$(function() {
    $('#table_teachers').DataTable().destroy();
    get_list_teachers();
    $('.tabs').tabs();
    $('#add_teacher_form').on('submit', function() {
        submit_add_teacher($('#add_teacher_form').serializeArray());
        $('#add_teacher_form')[0].reset();
    });
    $('#add_via_file').on('submit', function() {
        $('#preload').removeClass('hidden');
        submit_add_teacher_via_file();
        $('#add_via_file')[0].reset();
        $('#preload').addClass('hidden');
    });
    $('#select_all').on('change', function() {
        if(this.checked){
            $('.checkbox').each(function(){
                this.checked = true;
            });
            $('#select_action').removeClass('hidden');
        }else{
            $('.checkbox').each(function(){
                this.checked = false;
            });
            $('#select_action').addClass('hidden');
        }
    });
    $('table').on('click', 'a.modal-trigger', function(){
        $('select').select();
        var elem = document.querySelector(this.id);
        var instance = M.Modal.init(elem);
        var instance = M.Modal.getInstance(elem);
        instance.open();
    });
});

function check_box() {
    $('#select_action').removeClass('hidden');
    if($('.checkbox:checked').length == $('.checkbox').length){
        $('#select_all').prop('checked',true);
    }else{
        $('#select_all').prop('checked',false);
    }
    if($('.checkbox:checked').length == 0) {
        $('#select_action').addClass('hidden');
    }
}

function delete_check() {
    var _list_check = '';
    $('.checkbox:checked').each(function(){
        _list_check += this.value + ','
    });
    data = {
        list_check : _list_check
    }
    $('#preload').removeClass('hidden');
    var url = "index.php?action=delete_check_teachers";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        $('#table_teachers').DataTable().destroy();
        get_list_teachers();
        $('#select_all').prop('checked',false);
        $('#select_action').addClass('hidden');
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
    
}

function get_list_teachers() {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=get_list_teachers";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_list_teachers(json_data);
        $('.modal').modal();
        $('select').select();
        $('#preload').addClass('hidden');
    };
    $.get(url, success);
}

function show_list_teachers(data) {
    var list = $('#list_teachers');
    list.empty();
    for (var i = 0; i < data.length; i++) {
        var tr = $('<tr class="fadeIn" id="teacher-' + data[i].teacher_id + '"></tr>');
        tr.append('<td class=""><p><label><input type="checkbox" name="checkbox_students" class="checkbox" onchange="check_box();" value="' + data[i].teacher_id + '" /><span></span></label></p></td>');
        tr.append('<td class="">' + data[i].teacher_id + '</td>');
        tr.append('<td class=""><img src="res/img/avatar/' + data[i].avatar + '" alt="avatar" class="avatar" /></td>');
        tr.append('<td class="">' + data[i].name + '</td>');
        tr.append('<td class="">' + data[i].username + '</td>');
        tr.append('<td class="">' + data[i].email + '</td>');
        tr.append('<td class="">' + data[i].gender_detail + '</td>');
        if(data[i].birthday == '' || data[i].birthday == '0000-00-00')
            data[i].birthday = 'Ch??a X??c ?????nh';
        tr.append('<td class="">' + data[i].birthday + '</td>');
        if(data[i].last_login == '' || data[i].last_login == '0000-00-00 00:00:00')
            data[i].last_login = 'Ch??a ????ng Nh???p';
        tr.append('<td class="">' + data[i].last_login + '</td>');
        tr.append('<td class="">' + teacher_edit_button(data[i]) + '<br />' + teacher_del_button(data[i]) + '</td>');
        list.append(tr);
    }
    $('#table_teachers').DataTable( {
        "language": {
            "lengthMenu": "Hi???n th??? _MENU_",
            "zeroRecords": "Kh??ng t??m th???y",
            "info": "Hi???n th??? trang _PAGE_/_PAGES_",
            "infoEmpty": "Kh??ng c?? d??? li???u",
            "emptyTable": "Kh??ng c?? d??? li???u",
            "infoFiltered": "(t??m ki???m trong t???t c??? _MAX_ m???c)",
            "sSearch": "T??m ki???m",
            "paginate": {
                "first":      "?????u",
                "last":       "Cu???i",
                "next":       "Sau",
                "previous":   "Tr?????c"
            },
        },
        "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0, 2, 9 ] }, //hide sort icon on header of column 0, 2, 9
        ],
        'aaSorting': [[1, 'asc']] // start to sort data in second column
    } );
    $("form").on('submit', function(event) {
        event.preventDefault();
    });
}

function teacher_edit_button(data) {
    return btn = '<a class="waves-effect waves-light btn modal-trigger" style="margin-bottom: 7px;" href="#edit-' + data.teacher_id + '" id="#edit-' + data.teacher_id + '">S???a</a>' +
    '<div id="edit-' + data.teacher_id + '" class="modal modal-edit">' +
    '<div class="row col l12">' +
    '<form action="" method="POST" role="form" id="form-edit-teacher-' + data.teacher_id + '">' +
    '<div class="modal-content"><h5>S???a: ' + data.name + '</h5>' +
    '<div class="modal-body">' +
    '<div class="col l6 s12">' +
    '<div class="input-field">' +
    '<input type="hidden" value="' + data.teacher_id + '" name="teacher_id">' +
    '<input type="hidden" value="' + data.username + '" name="username">' +
    '<input type="text" value="' + data.name + '" name="name" required>' +
    '<label for="name" class="active">T??n</label>' +
    '</div>' +
    '<div class="input-field">' +
    '<input type="password" name="password" required>' +
    '<label for="password">M???t Kh???u</label>' +
    '</div>' +
    '</div>' +
    '<div class="col l6 s12">' +
    '<div class="input-field">' +
    '<select name="gender_id">' +
    '<option value="1" selected>Kh??ng X??c ?????nh</option>' +
    '<option value="2">Nam</option>' +
    '<option value="3">N???</option>' +
    '</select>' +
    '<label>Gi???i T??nh</label>' +
    '</div>' +
    '<div class="input-field">' +
    '<input type="date" value="' + data.birthday + '" name="birthday" required>' +
    '<label for="birthday" class="active">Ng??y Sinh</label>' +
    '</div>' +
    '</div>' +
    '</div></div>' +
    '</div><div class="col l12 s12">' +
    '<div class="modal-footer">' +
    '<a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Tr??? L???i</a>' +
    '<button type="submit" class="waves-effect waves-green btn-flat" onclick="submit_edit_teacher(' + data.teacher_id + ')">?????ng ??</button>' +
    '</div></div></form></div></div>';
}

function teacher_del_button(data) {
    return btn = '<a class="waves-effect waves-light btn modal-trigger" href="#del-' + data.teacher_id + '" id="#del-' + data.teacher_id + '">X??a</a>' +
    '<div id="del-' + data.teacher_id + '" class="modal"><div class="modal-content">' +
    '<h5>C???nh B??o</h5><p>X??c nh???n x??a t??i kho???n ' + data.username + '</p></div>' +
    '<form action="" method="POST" role="form" onsubmit="submit_del_teacher(this.id)" id="form-del-teacher-' + data.teacher_id + '">' +
    '<div class="modal-footer"><a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Tr??? L???i</a>' +
    '<input type="hidden" value="' + data.teacher_id + '" name="teacher_id">' +
    '<button type="submit" class="waves-effect waves-green btn-flat modal-action modal-close">?????ng ??</button></div></form></div>';
}

function submit_add_teacher(data) {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=check_add_teacher";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            // teacher_insert_data(json_data);
            $('#table_teachers').DataTable().destroy();
            get_list_teachers();
            $('.modal').modal();
            $('select').select();
            $('#preload').addClass('hidden');
        }
    };
    $.post(url, data, success);
}

function submit_add_teacher_via_file() {
    $('#preload').removeClass('hidden');
    $('#error').text('');
    var file_data = $('#file_data').prop('files')[0];
    var type = file_data.type;
    var size = file_data.size;
    var match = ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel"];
    if (type == match[0] || type == match[1]) {
        var form_data = new FormData();
        form_data.append('file', file_data);
        $.ajax({
            url: 'index.php?action=check_add_teacher_via_file',
            dataType: 'text',
            cache: false,
            contentType: false,
            processData: false,
            data: form_data,
            type: 'post',
            success: function(result) {
                var json_data = $.parseJSON(result);
                show_status(json_data);
                $('#table_teachers').DataTable().destroy();
                get_list_teachers();
                $('.modal').modal();
                $('select').select();
            }
        });
    } else {
        $('#error').text('Sai ?????nh d???ng m???u, y??u c???u file excel ??u??i .xlsx theo m???u. N???u file l???i vui l??ng t???i l???i m???u v?? ??i???n l???i.');
    }
    $('#preload').addClass('hidden');
}

function submit_del_teacher(data) {
    $('#preload').removeClass('hidden');
    data = $('#' + data).serializeArray();
    var url = "index.php?action=check_del_teacher";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#table_teachers').DataTable().destroy();
            get_list_teachers();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function submit_edit_teacher(data) {
    $('#preload').removeClass('hidden');
    form = $('#form-edit-teacher-' + data);
    data = $('#form-edit-teacher-' + data).serializeArray();
    var url = "index.php?action=check_edit_teacher";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            // $('#teacher-' + json_data.teacher_id).remove();
            // teacher_insert_data(json_data);
            $('#table_teachers').DataTable().destroy();
            get_list_teachers();
            form[0].reset();
            $('.modal').modal();
            $('select').select();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

// function teacher_insert_data(data) {
//     var list = $('#list_teachers');
//     var tr = $('<tr class="fadeIn" id="teacher-' + data.teacher_id + '"></tr>');
//     tr.append('<td class="">' + data.teacher_id + '</td>');
//     tr.append('<td class=""><img src="res/img/avatar/' + data.avatar + '" alt="avatar" class="avatar" /></td>');
//     tr.append('<td class="">' + data.name + '</td>');
//     tr.append('<td class="">' + data.username + '</td>');
//     tr.append('<td class="">' + data.email + '</td>');
//     tr.append('<td class="">' + data.gender_detail + '</td>');
//     tr.append('<td class="">' + data.birthday + '</td>');
//     tr.append('<td class="">' + data.last_login + '</td>');
//     tr.append('<td class="">' + teacher_edit_button(data) + '<br />' + teacher_del_button(data) + '</td>');
//     list.append(tr);
//     $("form").on('submit', function(event) {
//         event.preventDefault();
//     });
// }