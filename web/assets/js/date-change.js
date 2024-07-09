function getWeeksInMonth(month, year) {
    const firstDay = new Date(year, month - 1, 1);
    const lastDay = new Date(year, month, 0);
    const weeks = [];
    let start = new Date(firstDay);

    while (start <= lastDay) {
        const end = new Date(start);
        end.setDate(start.getDate() + 6 - start.getDay()); // End of the week
        if (end > lastDay) {
            end.setDate(lastDay.getDate());
        }
        weeks.push({start: new Date(start), end: new Date(end)});
        start.setDate(start.getDate() + 7 - start.getDay());
        start.setHours(0, 0, 0, 0); // Reset time to midnight
    }
    return weeks;
}

function updateWeeks() {
    const selectMonth = document.getElementById("selectMonth");
    const selectWeek = document.getElementById("selectWeek");
    const month = parseInt(selectMonth.value, 10);
    const year = new Date().getFullYear();
    const weeks = getWeeksInMonth(month, year);

    selectWeek.innerHTML = ''; // Clear previous options
    weeks.forEach((week, index) => {
        const option = document.createElement("option");
        option.value = index;
        option.text = `${week.start.toLocaleDateString()} - ${week.end.toLocaleDateString()}`;
        selectWeek.appendChild(option);
    });
    updateDates();
}

function updateDates() {
    const selectMonth = document.getElementById("selectMonth");
    const selectWeek = document.getElementById("selectWeek");
    const fromDateInput = document.getElementById("fromDate");
    const toDateInput = document.getElementById("toDate");

    const month = parseInt(selectMonth.value, 10);
    const year = new Date().getFullYear();
    const weeks = getWeeksInMonth(month, year);
    const selectedWeek = parseInt(selectWeek.value, 10);

    if (weeks[selectedWeek]) {
        const startDate = weeks[selectedWeek].start;
        const endDate = weeks[selectedWeek].end;

        // Định dạng ngày tháng năm cho input[type="date"]
        const formatDate = (date) => date.toISOString().split('T')[0];

        fromDateInput.value = formatDate(startDate);
        toDateInput.value = formatDate(endDate);
    }
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("selectMonth").addEventListener("change", updateWeeks);
    document.getElementById("selectWeek").addEventListener("change", updateDates);
    updateWeeks(); // Gọi ngay khi trang được tải
});