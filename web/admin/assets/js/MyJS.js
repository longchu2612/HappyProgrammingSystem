function approve() {
    var note = document.getElementById('noteInput').value;
    var cvId = document.getElementById('cvId').value; // Assuming you have cv.id available in this context
    window.location.href = 'ListRequest?service=approve&cvId=' + cvId + '&note=' + encodeURIComponent(note);
}

function reject() {
    var note = document.getElementById('noteInput').value;
    var cvId = document.getElementById('cvId').value; // Assuming you have cv.id available in this context
    window.location.href = 'ListRequest?service=reject&cvId=' + cvId + '&note=' + encodeURIComponent(note);
}