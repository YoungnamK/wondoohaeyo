<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@charset "UTF-8";
article{
    display: flex;
    flex-direction: column;
}
.question{
    display: none;
}
.result{
    display: none;
}
#img{
    width: 300px;
    height: 300px;
    margin: 0 auto;
}
@media only screen and (max-width: 600px) {
    body {
      background-color: lightblue;
    }
  }
</style>
</head>
<body class="container">
    <article class="start">
        <h1 class="mt-5 text-center">나의 취향에 맞는 커피는 무엇일까요?</h1>
        <button type="button" class="btn btn-secondary mt-5" onclick="start();">테스트 시작하기</button>
    </article>

    <article class="question">
        <div class="progress mt-5">
            <div class="progress-bar bg-info" role="progressbar" style="width: calc(100/12*1%)"></div>
        </div>
        <h2 class="mt-5 text-center" id="title">문제</h2>
        <input id="type" type="hidden" value="SNS">
        <button id="A" type="button" class="btn btn-secondary mt-5">Light</button>
        <button id="B" type="button" class="btn btn-dark mt-5">Dark</button>
    </article>

    <article class="result">
        <img id="img" src="coffee.jpg" alt="coffeepic" class="rounded-circle mt-5">
        <h2 id="coffeebean" class="text-center mt-5">원두이름</h2>
        <h3 id="explain" class="text-center mt-5">설명....</h3>
    </article>
    <input type="hidden" id="SNS" value="0">
    <input type="hidden" id="BNB" value="0">
    <input type="hidden" id="FANA" value="0">
    <input type="hidden" id="WCCO" value="0">

    
    <script>
        var num = 1;
        var q ={
            1:{"title":"문제1", "type":"SNS", "A":"S", "B":"NS"},
            2:{"title":"문제2", "type":"SNS", "A":"S", "B":"NS"},
            3:{"title":"문제3", "type":"SNS", "A":"S", "B":"NS"}, 
            4:{"title":"문제4", "type":"BNB", "A":"B", "B":"NB"},
            5:{"title":"문제5", "type":"BNB", "A":"B", "B":"NB"},
            6:{"title":"문제6", "type":"BNB", "A":"B", "B":"NB"},
            7:{"title":"문제7", "type":"FANA", "A":"FA", "B":"NA"},
            8:{"title":"문제8", "type":"FANA", "A":"FA", "B":"NA"},
            9:{"title":"문제9", "type":"FANA", "A":"FA", "B":"NA"},
            10:{"title":"문제10", "type":"WCCO", "A":"WC", "B":"CO"},
            11:{"title":"문제11", "type":"WCCO", "A":"WC", "B":"CO"},
            12:{"title":"문제12", "type":"WCCO", "A":"WC", "B":"CO"}
        }
        var result ={
            "SBFAWC" : {"coffeebean":"A원두", "explain" : "a원두의 설명", "img" : "coffee.jpg"},
            "SBFACO" : {"coffeebean":"B원두", "explain" : "b원두의 설명", "img" : "coffee.jpg"},
            "SBNAWC" : {"coffeebean":"C원두", "explain" : "c원두의 설명", "img" : "coffee.jpg"},
            "SBNACO" : {"coffeebean":"D원두", "explain" : "d원두의 설명", "img" : "coffee.jpg"},
            "SNBFAWC" : {"coffeebean":"E원두", "explain" : "e원두의 설명", "img" : "coffee.jpg"},
            "SNBFACO" : {"coffeebean":"F원두", "explain" : "f원두의 설명", "img" : "coffee.jpg"},
            "SNBNAWC" : {"coffeebean":"G원두", "explain" : "g원두의 설명", "img" : "coffee.jpg"},
            "SNBNACO" : {"coffeebean":"H원두", "explain" : "h원두의 설명", "img" : "coffee.jpg"},
            "NSNBNAWC" : {"coffeebean":"I원두", "explain" : "i원두의 설명", "img" : "coffee.jpg"},
            "NSNBNACO" : {"coffeebean":"J원두", "explain" : "j원두의 설명", "img" : "coffee.jpg"},
            "NSNBFAWO" : {"coffeebean":"K원두", "explain" : "k원두의 설명", "img" : "coffee.jpg"},
            "NSNBFACO" : {"coffeebean":"L원두", "explain" : "l원두의 설명", "img" : "coffee.jpg"},
            "NSBNAWC" : {"coffeebean":"M원두", "explain" : "m원두의 설명", "img" : "coffee.jpg"},
            "NSBNACO" : {"coffeebean":"N원두", "explain" : "n원두의 설명", "img" : "coffee.jpg"},
            "NSBFAWC" : {"coffeebean":"O원두", "explain" : "o원두의 설명", "img" : "coffee.jpg"},
            "NSBFACO" : {"coffeebean":"P원두", "explain" : "p원두의 설명", "img" : "coffee.jpg"}
        }
        function start(){
            $(".start").hide();
            $(".question").show();
            next();
        }
        $('#A').click(function(){
            var type = $('#type').val();
            var preValue = $('#'+type).val();
            $('#'+type).val(parseInt(preValue)+1);
            next();
        });
        $('#B').click(function(){
           
            next();
        });

        function next(){
            if(num ==13){
                $(".question").hide();
                $('.result').show();
                var coffeeti ="";
                ($('#SNS').val() <2) ? coffeeti+="NS" : coffeeti+="S";
                ($('#BNB').val() <2) ? coffeeti+="NB" : coffeeti+="B";
                ($('#FANA').val() <2) ? coffeeti+="NA" : coffeeti+="FA";
                ($('#WCCO').val() <2) ? coffeeti+="CO" : coffeeti+="WC";                
                // alert(coffeeti);
                $('#img').attr("src",result[coffeeti]["img"]);
                $('#coffeebean').html(result[coffeeti]["coffeebean"]);
                $('#explain').html(result[coffeeti]["explain"]);
            }else{
            $('.progress-bar').attr('style', 'width: calc(100/12*'+num+'%)');
            $('#title').html(q[num]["title"]);
            $('#type').val(q[num]["type"]);
            $('#A').html(q[num]["A"]);
            $('#B').html(q[num]["B"]);
            num++;
            }
        }
    </script>


</body>
</body>
</html>