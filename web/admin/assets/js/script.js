/*
 Author       : Dreamguys
 Template Name: Mentoring - Bootstrap Admin Template
 Version      : 1.0
 */

(function ($) {
    "use strict";

    // Variables declarations

    var $wrapper = $('.main-wrapper');
    var $pageWrapper = $('.page-wrapper');
    var $slimScrolls = $('.slimscroll');

    feather.replace();

    // Sidebar

    var Sidemenu = function () {
        this.$menuItem = $('#sidebar-menu a');
    };

    function init() {
        var $this = Sidemenu;
        $('#sidebar-menu a').on('click', function (e) {
            if ($(this).parent().hasClass('submenu')) {
                e.preventDefault();
            }
            if (!$(this).hasClass('subdrop')) {
                $('ul', $(this).parents('ul:first')).slideUp(350);
                $('a', $(this).parents('ul:first')).removeClass('subdrop');
                $(this).next('ul').slideDown(350);
                $(this).addClass('subdrop');
            } else if ($(this).hasClass('subdrop')) {
                $(this).removeClass('subdrop');
                $(this).next('ul').slideUp(350);
            }
        });
        $('#sidebar-menu ul li.submenu a.active').parents('li:last').children('a:first').addClass('active').trigger('click');
    }

    // Sidebar Initiate
    init();

    // Mobile menu sidebar overlay

    $('body').append('<div class="sidebar-overlay"></div>');
    $(document).on('click', '#mobile_btn', function () {
        $wrapper.toggleClass('slide-nav');
        $('.sidebar-overlay').toggleClass('opened');
        $('html').addClass('menu-opened');
        return false;
    });

    // Sidebar overlay

    $(".sidebar-overlay").on("click", function () {
        $wrapper.removeClass('slide-nav');
        $(".sidebar-overlay").removeClass("opened");
        $('html').removeClass('menu-opened');
    });

    // Page Content Height

    if ($('.page-wrapper').length > 0) {
        var height = $(window).height();
        $(".page-wrapper").css("min-height", height);
    }
    // Editor
    if ($('#editor').length > 0) {
        ClassicEditor
                .create(document.querySelector('#editor'), {
                    toolbar: ['bold', 'italic', 'link']
                })
                .then(editor => {
                    window.editor = editor;
                })
                .catch(err => {
                    console.error(err.stack);
                });
    }
    // Logo Hide Btn

    $(document).on("click", ".logo-hide-btn", function () {
        $(this).parent().hide();
    });
    // Experience Add More

    $(".settings-form").on('click', '.trash', function () {
        $(this).closest('.links-cont').remove();
        return false;
    });

    $(document).on("click", ".add-links", function () {
        var experiencecontent = '<div class="row form-row links-cont">' +
                '<div class="col-12 col-md-11">' +
                '<div class="form-group d-flex">' +
                '<button class="btn social-icon"><i class="feather-github"></i></button>' +
                '<input type="text" class="form-control" placeholder="Social Link">' +
                '</div>' +
                '</div>' +
                '<div class="col-12 col-md-1 col-lg-1"><a href="#" class="btn trash"><i class="feather-trash-2"></i></a></div>' +
                '</div>';

        $(".settings-form").append(experiencecontent);
        return false;
    });
    // Checkbox Select

    $('.app-listing .selectBox').on("click", function () {
        $(this).parent().find('#checkBoxes').fadeToggle();
        $(this).parent().parent().siblings().find('#checkBoxes').fadeOut();
    });

    $('.invoices-main-form .selectBox').on("click", function () {
        $(this).parent().find('#checkBoxes-one').fadeToggle();
        $(this).parent().parent().siblings().find('#checkBoxes-one').fadeOut();
    });

    // Invoices Checkbox Show

    $(function () {
        $("input[name='invoice']").click(function () {
            if ($("#chkYes").is(":checked")) {
                $("#show-invoices").show();
            } else {
                $("#show-invoices").hide();
            }
        });
    });

    // Invoices Add More

    $(".links-info-one").on('click', '.service-trash', function () {
        $(this).closest('.links-cont').remove();
        return false;
    });

    $(document).on("click", ".add-links", function () {
        var experiencecontent = '<div class="links-cont">' +
                '<div class="service-amount">' +
                '<a href="#" class="service-trash"><i class="feather-minus-circle me-1"></i>Service Charge</a> <span>$ 4</span' +
                '</div>' +
                '</div>';

        $(".links-info-one").append(experiencecontent);
        return false;
    });

    $(".links-info-discount").on('click', '.service-trash-one', function () {
        $(this).closest('.links-cont-discount').remove();
        return false;
    });

    $(document).on("click", ".add-links-one", function () {
        var experiencecontent = '<div class="links-cont-discount">' +
                '<div class="service-amount">' +
                '<a href="#" class="service-trash-one"><i class="feather-minus-circle me-1"></i>Offer new</a> <span>$ 4 %</span' +
                '</div>' +
                '</div>';

        $(".links-info-discount").append(experiencecontent);
        return false;
    });

    // Invoices Table Add More

    $(".add-table-items").on('click', '.remove-btn', function () {
        $(this).closest('.add-row').remove();
        return false;
    });

    $(document).on("click", ".add-btn", function () {
        var experiencecontent = '<tr class="add-row">' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control">' +
                '</td>' +
                '<td class="add-remove text-end">' +
                '<a href="javascript:void(0);" class="add-btn me-2"><i class="fas fa-plus-circle"></i></a> ' +
                '<a href="#" class="copy-btn me-2"><i class="feather-copy"></i></a>' +
                '<a href="javascript:void(0);" class="remove-btn"><i class="feather-trash-2"></i></a>' +
                '</td>' +
                '</tr>';

        $(".add-table-items").append(experiencecontent);
        return false;
    });

    // Page Content Height Resize

    $(window).resize(function () {
        if ($('.page-wrapper').length > 0) {
            var height = $(window).height();
            $(".page-wrapper").css("min-height", height);
        }
    });

    // Select 2
    if ($('.select').length > 0) {
        $('.select').select2({
            minimumResultsForSearch: -1,
            width: '100%'
        });
    }
    // Datetimepicker

    if ($('.datetimepicker').length > 0) {
        $('.datetimepicker').datetimepicker({
            format: 'DD/MM/YYYY',
            icons: {
                up: "fa fa-angle-up",
                down: "fa fa-angle-down",
                next: 'fa fa-angle-right',
                previous: 'fa fa-angle-left'
            }
        });
        $('.datetimepicker').on('dp.show', function () {
            $(this).closest('.table-responsive').removeClass('table-responsive').addClass('temp');
        }).on('dp.hide', function () {
            $(this).closest('.temp').addClass('table-responsive').removeClass('temp');
        });
    }

    // Tooltip

    if ($('[data-toggle="tooltip"]').length > 0) {
        $('[data-toggle="tooltip"]').tooltip();
    }

    // Datatable

    if ($('.datatable').length > 0) {
        $('.datatable').DataTable({
            "bFilter": false
        });
    }

    // Sidebar Slimscroll

    if ($slimScrolls.length > 0) {
        $slimScrolls.slimScroll({
            height: 'auto',
            width: '100%',
            position: 'right',
            size: '7px',
            color: '#ccc',
            allowPageScroll: false,
            wheelStep: 10,
            touchScrollStep: 100
        });
        var wHeight = $(window).height() - 60;
        $slimScrolls.height(wHeight);
        $('.sidebar .slimScrollDiv').height(wHeight);
        $(window).resize(function () {
            var rHeight = $(window).height() - 60;
            $slimScrolls.height(rHeight);
            $('.sidebar .slimScrollDiv').height(rHeight);
        });
    }

    // Small Sidebar

    $(document).on('click', '#toggle_btn', function () {
        if ($('body').hasClass('mini-sidebar')) {
            $('body').removeClass('mini-sidebar');
            $('.subdrop + ul').slideDown();
        } else {
            $('body').addClass('mini-sidebar');
            $('.subdrop + ul').slideUp();
        }
        setTimeout(function () {
            mA.redraw();
            mL.redraw();
        }, 300);
        return false;
    });
    $(document).on('mouseover', function (e) {
        e.stopPropagation();
        if ($('body').hasClass('mini-sidebar') && $('#toggle_btn').is(':visible')) {
            var targ = $(e.target).closest('.sidebar').length;
            if (targ) {
                $('body').addClass('expand-menu');
                $('.subdrop + ul').slideDown();
            } else {
                $('body').removeClass('expand-menu');
                $('.subdrop + ul').slideUp();
            }
            return false;
        }
    });


})(jQuery);

function CheckFullName(text) {
    var full_name = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]{4,}(?:[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+){0,2}$/;
    var spanFullName = document.getElementById('span_admin_fullname');
    if (!full_name.test(text.value)) {
        spanFullName.innerHTML = 'Họ tên không hợp lệ';
        spanFullName.style.color = 'red';
        return false;
    }
    spanFullName.innerHTML = '';
    return true;
}

function CheckAccountName(text) {
    var accountname = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{5,29}$/;
    var spanAccountName = document.getElementById('span_admin_username');
    if (!accountname.test(text.value)) {
        spanAccountName.innerHTML = 'Tên tài khoản không khớp()<br><ul><li>Không chứa hai dấu chấm liên tiếp</li><li>Không kết thúc bằng một dấu chấm</li>' +
                '<li>Bắt đầu bằng một ký tự chữ hoặc số </li>' + '<li>Có độ dài từ 5 đến 30 ký tự.</li>' + '<li>Chỉ chứa các ký tự chữ, số, dấu gạch dưới (_), hoặc dấu chấm (.).</li>' + '</ul>';
        spanAccountName.style.color = 'red';
        return false;
    }
    spanAccountName.innerHTML = '';

    return true;
}

function CheckEmail(text) {
    var email = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var spanEmail = document.getElementById('span_admin_email');
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
    var spanPassword = document.getElementById('span_admin_password');
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
    var spanRePassword = document.getElementById('span_admin_cofirmpassword');
    if (password !== text.value) {
        spanRePassword.innerHTML = 'Mật khẩu không khớp!';
        spanRePassword.style.color = 'red';
        return false;
    }
    spanRePassword.innerHTML = '';
    return true;

}

function validateSelection() {
    const roleSelect = document.getElementById("roleSelect");
    const errorMessage = document.getElementById("span-error-message");
    const selectedValue = roleSelect.value;

    if (selectedValue === "" || roleSelect.selectedIndex === 0) {
        errorMessage.innerHTML = 'Bạn chưa chọn role!';
        errorMessage.style.color = 'red';
        return false;
    } else {
        errorMessage.innerHTML = '';
        return true; // Trả về true nếu không có lỗi
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const roleSelect = document.getElementById("roleSelect");
    roleSelect.addEventListener("change", function () {
        const errorMessage = document.getElementById("error-message");
        errorMessage.innerHTML = '';
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const myForm = document.getElementById('myForm');

    myForm.addEventListener('submit', function (event) {
        if (!validateSelection()) {
            event.preventDefault(); // Ngăn chặn form gửi đi nếu có lỗi
        }
    });
});

function validateForm() {

    if (!CheckEmail(document.getElementsByName("email")[0]) ||
            !CheckPassword(document.getElementsByName("password")[0]) ||
            !CheckConfirmPassword(document.getElementsByName("confirm_password")[0]) ||
            !CheckAccountName(document.getElementsByName("account_name")[0]) ||
            !CheckFullName(document.getElementsByName("full_name")[0])
            ) {

        return false;
    }

    return true;
}