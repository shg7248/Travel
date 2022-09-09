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
            border-left: 1px solid black;
            border-top: 1px solid black;
        }
        .calendar__view div {
            width: var(--s);
            height: var(--s);
            border-right: 1px solid black;
            border-bottom: 1px solid black;
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

        let init = {
            start: '20220911',
            end: '20221016'
        }

        function changeNum(num) {
            return String(num).padStart(2, '0');
        }

        const App = function(obj) {

            init = {...init, ...obj};
            this.init();
        };

        App.prototype.init = function(month) {

            this.currDate = new Date();
            this.changeMonthDate = new Date();
            this.changeMonthDate.setMonth(month || this.currDate.getMonth());
            this.currEnd = new Date(this.changeMonthDate.getFullYear(), this.changeMonthDate.getMonth() + 1 , 0);
            this.prevEnd = new Date(this.changeMonthDate.getFullYear(), this.changeMonthDate.getMonth(), 0);

            this.draw();
        };

        App.prototype.draw = function() {

            const calendar__view = document.querySelector('.calendar__view');
            const calendar__title = document.querySelector('.calendar__title');

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
                if ((i >= a && i <= b)) {
                    return `<div class="calendar__date" data-date = "${this.changeMonthDate.getFullYear() }${changeNum(this.changeMonthDate.getMonth() + 1)}${changeNum(e) }">${e }</div>`;
                } 
                else {
                    return `<div class="calendar__date calendar__date--disabled">${e }</div>`;
                }
            });
            calendar__view.innerHTML = c.join().replaceAll(',', '');

            this.clickableDate = Array.from(document.querySelectorAll('.calendar__date')).filter(ele => {
                return ! ele.classList.contains('calendar__date--disabled');
            });

            this.clickableDate.forEach((ele, i) => {
                ele.addEventListener('click', function(e) {
                    console.log(ele);
                });
            });

            this.drawColor(init);
        }

        App.prototype.prevMonth = function() {
            this.init(this.changeMonthDate.getMonth() - 1);
        }

        App.prototype.nextMonth = function() {
            this.init(this.changeMonthDate.getMonth() + 1);
        }

        App.prototype.drawColor = function(obj) {
            this.clickableDate.forEach((ele, i) => {
                if(ele.dataset.date >= obj.start && ele.dataset.date <= obj.end) {
                    ele.classList.add('calendar__date--red');
                }
            })
        }

        App.prototype.getResDate = function(obj) {
            return init;
        }

        return App;

    }());
</script>
</body>
</html>