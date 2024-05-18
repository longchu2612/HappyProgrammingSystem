(function ($) {
    'use strict';
    /*==================================================================
     [ Daterangepicker ]*/
    try {
        $('.js-datepicker').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            "autoUpdateInput": false,
            locale: {
                format: 'DD/MM/YYYY'
            },
        });

        var myCalendar = $('.js-datepicker');
        var isClick = 0;

        $(window).on('click', function () {
            isClick = 0;
        });

        $(myCalendar).on('apply.daterangepicker', function (ev, picker) {
            isClick = 0;
            $(this).val(picker.startDate.format('DD/MM/YYYY'));

        });

        $('.js-btn-calendar').on('click', function (e) {
            e.stopPropagation();

            if (isClick === 1)
                isClick = 0;
            else if (isClick === 0)
                isClick = 1;

            if (isClick === 1) {
                myCalendar.focus();
            }
        });

        $(myCalendar).on('click', function (e) {
            e.stopPropagation();
            isClick = 1;
        });

        $('.daterangepicker').on('click', function (e) {
            e.stopPropagation();
        });


    } catch (er) {
        console.log(er);
    }
    /*[ Select 2 Config ]
     ===========================================================*/

    try {
        var selectSimple = $('.js-select-simple');

        selectSimple.each(function () {
            var that = $(this);
            var selectBox = that.find('select');
            var selectDropdown = that.find('.select-dropdown');
            selectBox.select2({
                dropdownParent: selectDropdown
            });
        });

    } catch (err) {
        console.log(err);
    }


})(jQuery);



function CheckEmail(text) {
    var email = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var spanEmail = document.getElementById('span_email');
    if (!email.test(text.value)) {
        spanEmail.innerHTML = 'Email không hợp lệ (email_123@gmail.com)';
        spanEmail.style.color = 'red';
        return false;
    }
    spanEmail.innerHTML = '';
    return true;
}

function CheckPassword(text) {
    var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
    var spanPassword = document.getElementById('span_password');
    if (!password.test(text.value)) {
        spanPassword.innerHTML = 'Mật khẩu không hợp lệ (Cần có ít nhất 8 ký tự bao gồm viết hoa và ký tự đặc biệt)!';
        spanPassword.style.color = 'red';
        return false;
    }
    spanPassword.innerHTML = '';
    return true;
}

function CheckConfirmPassword(text) {
    var password = document.getElementById('password').value;
    var spanRePassword = document.getElementById('span_rePassword');
    if (password != text.value) {
        spanRePassword.innerHTML = 'Mật khẩu không khớp!';
        spanRePassword.style.color = 'red';
        return false;
    }
    spanRePassword.innerHTML = '';
    return true;

}

function CheckAccountName(text) {
    var accountname = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{5,29}$/;
    var spanAccountName = document.getElementById('span_accountName');
    if (!accountname.test(text.value)) {
        spanAccountName.innerHTML = 'Tên tài khoản không khớp()<br><ul><li>Không chứa hai dấu chấm liên tiếp</li><li>Không kết thúc bằng một dấu chấm</li>' +
                '<li>Bắt đầu bằng một ký tự chữ hoặc số </li>' + '<li>Có độ dài từ 5 đến 30 ký tự.</li>' + '<li>Chỉ chứa các ký tự chữ, số, dấu gạch dưới (_), hoặc dấu chấm (.).</li>' + '</ul>';
        spanAccountName.style.color = 'red';
        return false;
    }
    spanAccountName.innerHTML = '';

    return true;
}

function CheckPhoneNumber(text) {
    var phone_number = /^0\d{9}$/;
    var spanPhoneNumber = document.getElementById('span_phoneNumber');
    if (!phone_number.test(text.value)) {
        spanPhoneNumber.innerHTML = 'Số điện thoại không hợp lệ';
        spanPhoneNumber.style.color = 'red';
        return false;
    }
    spanPhoneNumber.innerHTML = '';
    return true;
}

function CheckFullName(text) {
    var full_name = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]{4,}(?:[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+){0,2}$/;
    var spanFullName = document.getElementById('span_fullname');
    if (!full_name.test(text.value)) {
        spanFullName.innerHTML = 'Họ tên không hợp lệ';
        spanFullName.style.color = 'red';
        return false;
    }
    spanFullName.innerHTML = '';
    return true;
}

function CheckAddress(text) {
    var address = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]{4,}(?:[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+){0,2}$/;
    var spanAddress = document.getElementById('span_address');
    if (!address.test(text.value)) {
        spanAddress.innerHTML = 'Địa chỉ không hợp lệ';
        spanAddress.style.color = 'red';
        return false;
    }
    spanAddress.innerHTML = '';
    return true;

}

function validateForm() {

    if (!CheckEmail(document.getElementsByName("email")[0]) ||
            !CheckPassword(document.getElementsByName("password")[0]) ||
            !CheckConfirmPassword(document.getElementsByName("confirm_password")[0]) ||
            !CheckAccountName(document.getElementsByName("account_name")[0]) ||
            !CheckPhoneNumber(document.getElementsByName("phone")[0]) ||
            !CheckFullName(document.getElementsByName("full_name")[0]) ||
            !CheckAddress(document.getElementsByName("address")[0])) {

        return false;
    }

    return true;
}


