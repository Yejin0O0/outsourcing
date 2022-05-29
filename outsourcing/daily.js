var daily_add = document.getElementById('daily_add')
var schedule_change = document.getElementById('schedule_change')
var daily_aside_list = document.getElementById('daily_aside_list')


function deleteSchedule(num) {
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

function addSchedule() {
    if (daily_add.style.display === 'none' ) {
        daily_add.style.display = 'block';

    }
    else {
        daily_add.style.display = 'none';

    }

}

function changeSchedule(num) {
    var schedule_change = document.getElementById('schedule_change_'+num)
    var schedule_date = document.getElementById('schedule_date_'+num)   
    var schedule_time = document.getElementById('schedule_time_'+num)
    var schedule_cont = document.getElementById('schedule_cont_'+num)
    var schedule_date_p = document.getElementById('schedule_date_p_'+num)
    var schedule_time_p = document.getElementById('schedule_time_p_'+num)
    var schedule_cont_p = document.getElementById('schedule_cont_p_'+num)
    var daily_article_form = document.getElementById('daily_article_form_'+ num)

    
    if (schedule_change.value == '수정') {
        schedule_date.style.display = 'block'
        schedule_time.style.display = 'block'
        schedule_cont.style.display = 'block'
        schedule_date.focus()
        schedule_date_p.style.display = 'none'
        schedule_time_p.style.display = 'none'
        schedule_cont_p.style.display = 'none'
        schedule_change.value = '확인'
    }
    else {
        daily_article_form.action = 'dailyUpdateModule.jsp'
        daily_article_form.submit()
    }

}

function deleteSchedule(num) {

    var daily_article_form = document.getElementById('daily_article_form_'+ num)


    daily_article_form.action = 'dailyDeleteModule.jsp'
    daily_article_form.submit()

}