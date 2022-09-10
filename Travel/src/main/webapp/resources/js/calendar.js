/* jshint esversion: 6 */

var Calendar = (function() {

    let options = {
        start: '',
        end: '',
        clickable: false
    }

    let flag = false;

    function changeNum(num) {
        return String(num).padStart(2, '0');
    }

    function makeInputElement(type, value, event) {
        const ele = document.createElement('input');
        ele.setAttribute('type', type);
        ele.setAttribute('value', value);
        ele.setAttribute('class', `calendar__btn--${value }`)
        ele.addEventListener('click', event);
        return ele;
    }

    const App = function(obj) {
        options = {...options, ...obj};
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

        const calendar__title = document.querySelector('.calendar__title');
        const calendar__view = document.querySelector('.calendar__view');

        calendar__title.innerHTML = "";
        const prev = makeInputElement('button', 'prev', ()=>{
            this.prevMonth();
        });
        const next = makeInputElement('button', 'next', ()=>{
            this.nextMonth();
        });

        calendar__title.append(prev);
        calendar__title.append(`${this.changeMonthDate.getFullYear() }년 ${changeNum(this.changeMonthDate.getMonth() + 1) }월`);
        calendar__title.append(next);
            


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

        	// 다른월의 일
            const f = i < a || i > b;
            
         	// 이번달에서 현재일보다 낮은 일
            const g = this.getYearMonth(this.currDate) === this.getYearMonth(this.changeMonthDate) && e < this.currDate.getDate();
         	
         	// 이번달보다 낮은 달
            const h = this.getYearMonth(this.changeMonthDate) < this.getYearMonth(this.currDate);

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
        if(options.clickable) {
            let that = this;
            this.clickableDate.forEach((ele, i) => {
                ele.addEventListener('click', function(e) {
                    if(flag) {
                        flag = !flag;
                        options.end = ele.dataset.date;
                        that.init(that.changeMonthDate.getMonth());
                    }
                    else {
                        flag = !flag;
                        that.clear();
                        ele.classList.add('calendar__date--red');
                        options.start = ele.dataset.date;
                    }
                });
            });
        }

        this.drawColor(options);
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
            obj = {...obj, start:obj.end, end:obj.start}
        }
        this.clickableDate.forEach((ele, i) => {
            if(ele.dataset.date >= obj.start && ele.dataset.date <= obj.end) {
                ele.classList.add('calendar__date--red');
            }
        });
    }

    App.prototype.getYearMonth = function(date) {
        return String(date.getFullYear()).concat(changeNum(date.getMonth())) ;
    }

    App.prototype.getResDate = function(obj) {
        return {
            start: options.start,
            end: options.end
        };
    }
    return App;
}());