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
    </style>
</head>
<body>
<div id="calendar">
    <div class="calendar__view">

    </div>
</div>
<script type="text/javascript">
    
    const Calendar = function() {
        this.init();
    };

    Calendar.prototype.init = function() {
        this.currDate = new Date();
        this.startDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth(), 1);
        this.endDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth() + 1 , 1);
        this.endDate.setDate(0);
        this.prevMonthDate = new Date(this.currDate.getFullYear(), this.currDate.getMonth());
        this.prevMonthDate.setDate(0);
        
        console.log(this.currDate.toLocaleDateString());
        console.log(this.startDate.toLocaleDateString());
        console.log(this.endDate.toLocaleDateString());
        console.log(this.prevMonthDate.toLocaleDateString());

        this.draw();
    };

    Calendar.prototype.draw = function() {
        
        const calendar__view = document.querySelector('.calendar__view');
    }
</script>
</body>
</html>