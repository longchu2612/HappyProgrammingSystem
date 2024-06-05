<%-- 
    Document   : UpdateSchedule
    Created on : Jun 3, 2024, 9:28:51 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản Lý Lịch Trình</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .container {
                max-width: 600px;
                margin: auto;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input, select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            button {
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
            .schedule-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Quản Lý Lịch Trình</h2>
            <div id="current_schedule">
                <h3>Lịch Trình Hiện Tại</h3>
                <!-- Lịch trình sẽ được hiển thị ở đây -->
            </div>
            <div id="edit_schedule" style="display:none;">
                <h3>Chỉnh Sửa Lịch Trình</h3>
                <div class="form-group">
                    <label for="edit_day">Chọn Ngày Trong Tuần:</label>
                    <select id="edit_day">
                        <option value="Monday">Thứ Hai</option>
                        <option value="Tuesday">Thứ Ba</option>
                        <option value="Wednesday">Thứ Tư</option>
                        <option value="Thursday">Thứ Năm</option>
                        <option value="Friday">Thứ Sáu</option>
                        <option value="Saturday">Thứ Bảy</option>
                        <option value="Sunday">Chủ Nhật</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="edit_start_time">Giờ Bắt Đầu:</label>
                    <input type="time" id="edit_start_time">
                </div>
                <div class="form-group">
                    <label for="edit_end_time">Giờ Kết Thúc:</label>
                    <input type="time" id="edit_end_time">
                </div>
                <button id="save_edit">Lưu Thay Đổi</button>
            </div>
        </div>

        <script>
            let currentSchedule = [
                {id: 1, day: 'Monday', start_time: '09:00', end_time: '11:00'},
                {id: 2, day: 'Wednesday', start_time: '13:00', end_time: '15:00'},
                {id: 3, day: 'Friday', start_time: '10:00', end_time: '12:00'},
                        // Các buổi học khác sẽ được thêm vào đây
            ];

            function renderSchedule() {
                const scheduleContainer = document.getElementById('current_schedule');
                scheduleContainer.innerHTML = '<h3>Lịch Trình Hiện Tại</h3>';
                currentSchedule.forEach(item => {
                    const scheduleItem = document.createElement('div');
                    scheduleItem.className = 'schedule-item';
                    scheduleItem.innerHTML = `
                        <span>${item.day} từ ${item.start_time} đến ${item.end_time}</span>
                        <button onclick="editSchedule(${item.id})">Chỉnh Sửa</button>
                    `;
                    scheduleContainer.appendChild(scheduleItem);
                });
            }

            function editSchedule(id) {
                const schedule = currentSchedule.find(item => item.id === id);
                if (schedule) {
                    document.getElementById('edit_day').value = schedule.day;
                    document.getElementById('edit_start_time').value = schedule.start_time;
                    document.getElementById('edit_end_time').value = schedule.end_time;
                    document.getElementById('edit_schedule').style.display = 'block';
                    document.getElementById('save_edit').onclick = function () {
                        saveEdit(id);
                    };
                }
            }

            function saveEdit(id) {
                const day = document.getElementById('edit_day').value;
                const startTime = document.getElementById('edit_start_time').value;
                const endTime = document.getElementById('edit_end_time').value;

                const schedule = currentSchedule.find(item => item.id === id);
                if (schedule) {
                    schedule.day = day;
                    schedule.start_time = startTime;
                    schedule.end_time = endTime;
                    renderSchedule();
                    document.getElementById('edit_schedule').style.display = 'none';

                    // Gửi yêu cầu cập nhật lên server
                    fetch('/update_schedule', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({id, day, start_time: startTime, end_time: endTime})
                    })
                            .then(response => response.json())
                            .then(data => {
                                alert(data.message);
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                renderSchedule();
            });
        </script>
    </body>
</html>
