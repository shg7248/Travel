const dummy = [
    {
        name: '송학관',
        start: '20220920',
        end: '20220922'
    },
    {
        name: '김찬우',
        start: '20220921',
        end: '20220927'
    },
    {
        name: '전진환',
        start: '20220909',
        end: '20220916'
    }
]

window.document.oncontextmenu = new Function("return false");
window.document.onselectstart = new Function("return false");
window.document.ondragstart = new Function("return false");

;(function(window, undefined) {

    const pluginName = 'calendar',
    defaults = {

    },
    monthInfo = {
        plusMonth: 0,
        now: function() {
            const d = new Date();
            d.setMonth(d.getMonth() + this.plusMonth);
            return d;
        },
        nowLast: function() {
            const d = this.now();
            d.setMonth(d.getMonth() + 1);
            d.setDate(0);
            return d;
        },
        prev: function() {
            const d = this.now();
            d.setDate(0);
            return d;
        },
        next: function() {
            const d = this.nowLast();
            d.setDate(this.nowLast().getDate()+1)
            return d;
        },
        prevMonth: function() {
            return this.prev.getMonth();
        },
        nextMonth: function() {
            const month = this.nowLast.setDate(this.nowLast.getDate()+1).getMonth();
            return month;
        }
    },
    makeElement = function(element, attr, eventType, eventCallback) {
        const e = document.createElement(element);
        Object.keys(attr).forEach((a, i)=> {
            e.setAttribute(a, attr[a]);
        });

        if(eventType && eventType != undefined) e.addEventListener(eventType, eventCallback);
        
        return e;
    },
    dateToString = function(d) {

        const year = d.getFullYear();
        const month = String(d.getMonth()+1).padStart(2, '0');
        const date = String(d.getDate()).padStart(2, '0');

        return {
            yearMonth: year + month,
            yearMonthDate: year + month + date
        } 
    }

    function Plugin(users, options) {
        this.users = dummy;
        this.options = {...defaults, ...options};

        this.init();
    }

    Plugin.prototype = {
        init: function() {
            this.calcDate();
            this.drawCalendar();
            this.drawColor();
        },
        calcDate: function() {

            this.prevDates = [];
            this.currDates = [...Array(monthInfo.nowLast().getDate() + 1).keys()].slice(1).map((value=> {
                return dateToString(monthInfo.now()).yearMonth.concat(String(value).padStart(2, '0'))
            }));
            this.nextDates = [];

            if(monthInfo.prev().getDay() < 6) {
                for(let i = 0; i <= monthInfo.prev().getDay(); i++) {
                    this.prevDates.unshift(dateToString(monthInfo.prev()).yearMonth.concat(monthInfo.prev().getDate() - i).padStart(2, '0'));
                }
            }
            
            for(let i = 1; i < 7 - monthInfo.nowLast().getDay(); i++) {
                this.nextDates.push(dateToString(monthInfo.next()).yearMonth.concat(String(i).padStart(2, '0')));
            }

            this.dates = [...this.prevDates, ...this.currDates, ...this.nextDates];
        },
        drawCalendar: function() {

            // 기본 구조
            const c = document.querySelector('.calendar2');
            let inner = `<div class='calendar__inner'>`;
            inner += `<div class='calendar__header2'></div>`;
            inner += `<div class='calendar__content2'></div>`;
            inner += `<div class='calendar__footer2'></div>`;
            inner += `</div>`;
            c.innerHTML = inner;

            // 해더
            const header = document.querySelector('.calendar__header2');
            const prev = makeElement('input', {type: 'button', class: 'calendar__btn calendar__btn--prev', value: '<'}, 'click', ()=> {
                monthInfo.plusMonth -= 1;
                this.init();
            });
            const next = makeElement('input', {type: 'button', class: 'calendar__btn calendar__btn--next', value: '>'}, 'click', ()=> {
                monthInfo.plusMonth += 1;
                this.init();
            });
            header.append(prev);
            header.append(`${monthInfo.now().getFullYear()}년 ${monthInfo.now().getMonth()+1}월`);
            header.append(next);

            // 컨텐츠
            const days = ['일', '월', '화', '수', '목', '금', '토'].map(ele=> `<div class='calendar__date'>${ele}</div>`)
            const content = document.querySelector('.calendar__content2');
            const makeDates = this.dates.map((value, i)=> {
                return `<div class='calendar__date' data-date='${value}'>${value.substring(6, 8).replace(/0(?=\d{1})/, '')}</div>`
            });
            content.innerHTML = days.join().concat(makeDates.join()).replaceAll(',', '');
        },
        drawColor: function() {
            
            const calendar = Array.from(document.querySelectorAll('.calendar__date'));
            const users = this.users;

            users.forEach((user, i1)=> {

                calendar.forEach((value, i2)=> {
                    const d = value.dataset.date;
                    if(user.start <= d && user.end >= d) {
                        const ele = makeElement('div', {class: `schedule schedule-${i1+1}`});
                        ele.innerHTML = `${user.name}`;
                        value.append(ele);
                    }
                });
            });
        }
    }

    window.Calendar = Plugin;
    
}(window, undefined));