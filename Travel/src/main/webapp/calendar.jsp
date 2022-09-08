<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            --s: 100px;
        }
        .calendar__view {
            width: calc(var(--s) * 7);
            display: grid;
            grid-template-columns: repeat(7, 1fr);
        }
        .calendar__view div {
            width: var(--s);
            height: var(--s);
            border: 1px solid black;
        }
        .calendar__date--disabled {
            color: rgb(209, 209, 209);
        }
        .calendar__date--red {
            background: red;
            color: white;
        }
    </style>
</head>
<body>
<div id="calendar">
    <div class="calendar__title">

    </div>
    <div class="calendar__view">

    </div>
</div>
<script type="text/javascript">
    
    var Calendar = (function() {

        function makeButton() {

        };

        const cal = function() {
            this.init();
        };

        cal.prototype.init = function(month) {
            this.startend = [];
            this.currDate = function() {
                if(month === undefined) {
                    return new Date();
                }
                else {
                    const date = new Date();
                    date.setMonth(month);
                    return date;
                }
            }();

            this.startDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth(), 1);
            this.endDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth() + 1 , 1);
            this.endDate.setDate(0);
            this.prevMonthDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth());
            this.prevMonthDate.setDate(0);
            this.nextMonthDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth() + 1);

            this.draw();
        };

        cal.prototype.draw = function() {

            const calendar__view = document.querySelector('.calendar__view');
            const calendar__title = document.querySelector('.calendar__title');
            const prevBlack = this.startDate.getDay() - 1;

            const year = this.currDate.getFullYear();
            const month = this.currDate.getMonth();

            calendar__title.innerHTML = "";

            const prev = document.createElement('button');
            prev.innerHTML = "<<";
            prev.addEventListener('click', this.setMonth.bind(this, this.currDate.getMonth() - 1));
            calendar__title.appendChild(prev);

            const next = document.createElement('button');
            next.innerHTML = ">>";
            next.addEventListener('click', this.setMonth.bind(this, this.currDate.getMonth() + 1));
            calendar__title.appendChild(next);

            let divs = "";
            for(let i = this.prevMonthDate.getDate() - prevBlack; i <= this.prevMonthDate.getDate(); i++) {
                divs += `<div class="calendar__date calendar__date--disabled">${i }</div>`;
            }
            for(let i = 1; i <= this.endDate.getDate(); i++) {
                if(i < this.currDate.getDate()) {
                    divs += `<div class="calendar__date calendar__date--disabled" data-date = "${this.currDate.getFullYear() }${month + 1}${String(i).padStart(2, '0') }">${i }</div>`;
                }
                else {
                    divs += `<div class="calendar__date" data-date = "${this.currDate.getFullYear() }${month + 1}${String(i).padStart(2, '0') }">${i }</div>`;
                }
            }
            for(let i = this.nextMonthDate.getDay(); i < 7; i++) {
                divs += `<div class="calendar__date calendar__date--disabled">${i - this.nextMonthDate.getDay() + 1}</div>`;
            }

            calendar__view.innerHTML = divs;

            const that = this;

            this.dates = Array.from(document.querySelectorAll('.calendar__date')).filter((ele) => {
                return !ele.classList.contains('calendar__date--disabled');
            });

            this.dates.forEach((ele, idx) => {
                ele.addEventListener('click', (event) => {
                    that.startend.push(ele.dataset.date);
                    that.drawColor();
                });
            });
        }

        cal.prototype.setMonth = function(month) {
            this.init(month);
        }

        cal.prototype.drawColor = function(data) {
            if(this.startend.length === 2) {
                this.dates.forEach(ele => {
                    if(ele.dataset.date >= this.startend[0] && ele.dataset.date <= this.startend[1]) {
                        ele.classList.add('calendar__date--red');
                    }
                });
            }
        }

        return cal;
    }());
</script>
</body>
</html>