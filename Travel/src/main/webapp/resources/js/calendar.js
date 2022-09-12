var Calendar = (function() {

    let pluginName = 'calendar',
        flag = false
        date = new Date(),
        changeNum = function(num) {
            return String(num).padStart(2, '0');
        },
        getDateToString = {
            yearMonth: function(d) {
                return String(d.getFullYear()) + changeNum(d.getMonth() + 1);
            },
            yearMonthDate: function(d) {
                return String(d.getFullYear()) + changeNum(d.getMonth() + 1) + changeNum(d.getDate());
            }
        },
        defaults = {
            start: getDateToString.yearMonthDate(date),
            end: getDateToString.yearMonthDate(new Date(date.getTime() + 86400000)),
            clickable: true
        },
        makeElement = function(ele, attr, eventType, event) {
            const e = document.createElement(ele);
            Object.keys(attr).forEach((a, i)=>{
                e.setAttribute(a, attr[a]);
            });
            if(eventType !== undefined) 
                e.addEventListener(eventType, event);
            return e;
        }

    const App = function(obj) {
        defaults = {...defaults, ...obj};
        this.plusMonth = 0;
        this.init();
    };

    App.prototype.init = function() {
        this.currDate = new Date();
        this.changeMonthDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth() + this.plusMonth);
        this.currEnd = new Date(this.changeMonthDate.getFullYear(), this.changeMonthDate.getMonth() + 1 , 0);
        this.prevEnd = new Date(this.changeMonthDate.getFullYear(), this.changeMonthDate.getMonth(), 0);

        this.draw();
    };

    App.prototype.draw = function() {

        const cal = document.querySelector('.calendar');

        cal.innerHTML = "";
        const calendar__title = makeElement('div', {class: 'calendar__title'});
        const calendar__view = makeElement('div', {class: 'calendar__view'});
        const calendar__buttom = makeElement('div', {class: 'calendar__buttom'});

        cal.append(calendar__title);
        cal.append(calendar__view);
        cal.append(calendar__buttom);

        const prev = makeElement('input', {type: 'button', value: '이전', class: `calendar__btn--prev`}, 'click', () => {
            this.prevMonth();
        });
        const next = makeElement('input', {type: 'button', value: '다음', class: `calendar__btn--next`}, 'click', () => {
            this.nextMonth();
        });

        calendar__title.append(prev);
        calendar__title.append(`${this.changeMonthDate.getFullYear() }년 ${changeNum(this.changeMonthDate.getMonth() + 1) }월`);
        calendar__title.append(next);

        const submitBtn = makeElement('input', {type: 'button', class: 'calendar__btn', value: '선택'}, 'click', () => {
            location.href=`search.shop?start=${this.getResDate().start}&end=${this.getResDate().end}`;
        });
        calendar__buttom.append(submitBtn);
            
        this.prevDates = [];
        this.currDates = [...Array(this.currEnd.getDate() + 1).keys()].slice(1);
        this.nextDates = [];

        if(this.prevEnd.getDay() < 6) {
            for(let i = 0; i <= this.prevEnd.getDay(); i++) {
                this.prevDates.unshift(this.prevEnd.getDate() - i);
            }
        }

        for(let i = 1; i < 7 - this.currEnd.getDay(); i++) {
            this.nextDates.push(i);
        }

        const dates = [...this.prevDates, ...this.currDates, ...this.nextDates];
        
        const a = this.prevDates.length;
        const b = this.prevDates.length + this.currDates.length - 1;

        const c = dates.map((e, i) => {

            const f = i < a || i > b; // 다른월의 일
            const g = getDateToString.yearMonth(this.currDate) === getDateToString.yearMonth(this.changeMonthDate) && e < this.currDate.getDate(); // 이번달에서 현재일보다 낮은 일
            const h = getDateToString.yearMonth(this.changeMonthDate) < getDateToString.yearMonth(this.currDate); // 이번달보다 낮은 달

            // 위 조건중에 하나라도 해당되면 선택 못하게 막음
            if (f || g || h) {
                return `<div class="calendar__date calendar__date--disabled"><span>${e }</span></div>`;
            } 
            else {
                return `<div class="calendar__date" data-date = "${this.changeMonthDate.getFullYear() }${changeNum(this.changeMonthDate.getMonth() + 1)}${changeNum(e) }">${e }</div>`;
            }
        });

        const days = ["일", "월", "화", "수", "목", "금", "토"].map(ele => `<div>${ele }</div>`);

        calendar__view.innerHTML = days.join().concat(c.join()).replaceAll(',', '');

        this.clickableDate = Array.from(document.querySelectorAll('.calendar__date')).filter(ele => {
            return ! ele.classList.contains('calendar__date--disabled');
        });

        // 클릭 이벤트
        if(defaults.clickable) {
            let that = this;
            this.clickableDate.forEach((ele, i) => {
                ele.addEventListener('click', function(e) {
                    if(flag) {
                        flag = !flag;
                        defaults.end = ele.dataset.date;
                        that.init(that.changeMonthDate.getMonth());
                    }
                    else {
                        flag = !flag;
                        that.clear();
                        ele.classList.add('calendar__date--red');
                        defaults.start = ele.dataset.date;
                    }
                });
            });
        }

        this.drawColor(defaults);
    }

    App.prototype.prevMonth = function() {
        this.plusMonth -= 1;
        this.init();
    }
    App.prototype.nextMonth = function() {
        this.plusMonth += 1;
        this.init();
    }
    App.prototype.clear = function() {
        this.clickableDate.forEach((ele, i) => {
             ele.classList.remove('calendar__date--red');
        });
    }
    App.prototype.drawColor = function(obj) {
        if(obj.start === '' && obj.end === '')
            return;
        if(obj.start > obj.end) {
            defaults = {...obj, start:obj.end, end:obj.start}
        }
        this.clickableDate.forEach((ele, i) => {
            if(ele.dataset.date >= defaults.start && ele.dataset.date <= defaults.end) {
                ele.classList.add('calendar__date--red');
            }
        });
    }
    App.prototype.getResDate = function(obj) {
        return {
            start: defaults.start,
            end: defaults.end
        };
    }
    return App;
}());