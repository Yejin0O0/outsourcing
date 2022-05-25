var daily_add = document.getElementById('daily_add')
var schedule_date = document.getElementById('schedule_date')
var schedule_time = document.getElementById('schedule_time')
var schedule_cont = document.getElementById('schedule_cont')
var schedule_change = document.getElementById('schedule_change')
var daily_aside_list = document.getElementById('daily_aside_list')

function addSchedule() {
    if (daily_add.style.display === 'none' ) {
        daily_add.style.display = 'block';

    }
    else {
        daily_add.style.display = 'none';

    }

}

function changeSchedule() {
    if (schedule_change.innerHTML === '수정') {
        schedule_date.type = 'date';
        schedule_time.disabled = false;
        schedule_cont.disabled = false;
        schedule_change.innerHTML = '확인'
    }
    else {
        schedule_date.type = 'hidden';
        schedule_time.disabled = true;
        schedule_cont.disabled = true;
        schedule_change.innerHTML = '수정'
    }


    console.log("3")

}

function deleteSchedule() {
    confirm("정말로 삭제하시겠습니까?")
}


function showList() {
    if (daily_aside_list.style.display === 'none' ) {
        daily_aside_list.style.display = 'block';

    }
    else {
        daily_aside_list.style.display = 'none';

    }

}