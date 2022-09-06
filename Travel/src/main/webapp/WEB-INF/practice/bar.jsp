<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }
        .bar-wrap {
            position: absolute;
            width: 300px;
            height: 300px;
            top: 100px;
            left: 100px;
            border: 1px solid black;
        }
        .bar {
            width: 200px;
            height: 10px;
            left: 50px;
            top: 100px;
            background: red;
        }
        .circle {
            position: absolute;
            width: 20px;
            height: 20px;
            transform: translateY(-25%) translateX(-25%);
            border-radius: 20px;
            background: black;
        }
    </style>
</head>
<body>
    <div class="bar-wrap">
        <div class="bar">
            <div class="circle"></div>
        </div>
        <div class="price">
            
        </div>
    </div>
<script type="text/javascript">

    const circle = document.querySelector('.circle');
    const bar_wrap = document.querySelector('.bar-wrap');
    const price_w = document.querySelector('.price');
    
    bar_wrap.addEventListener('mousemove', function(e) {

        if (e.target !== e.currentTarget) return;

        // console.log(e.target);
        // console.log(e.pageX - 100);
    });

    circle.addEventListener('mousedown', (e)=>{

        const mouseMove = (e) => {
            let pageX = e.pageX - 100 - 5;
            if(pageX <= 0)
                pageX = 0;

            if(pageX >= 200)
                pageX = 200;

            let price = parseInt((pageX / 200) * 300000)
            console.log(String(price).padStart(6, 0));
            price_w.innerHTML = price;

            circle.style.left = pageX + "px";
        }

        const mouseUp = (e) => {
            
            console.log("mouseup!!");

            document.removeEventListener('mousemove', mouseMove);
            document.removeEventListener('mouseup', mouseUp);
        }

        document.addEventListener('mousemove', mouseMove);
        document.addEventListener('mouseup', mouseUp);
    });
</script>
</body>
</html>