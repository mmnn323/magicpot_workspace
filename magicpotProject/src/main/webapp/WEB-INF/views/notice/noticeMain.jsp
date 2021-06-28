<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
    #outer{
        width:700px;
        height:1000px;
    }

    #content{
        margin-left:20px;
        margin-top:20px;
    }

    #content1{margin-top:30px; width:500px;}
    a{
		text-decoration:none;
		color:black;
    }
    #title{font-size:25px;}
    
    img{width:180px; height:150px; margin-top:15px;}

    #content>div{float:left;}
    #content>hr{margin-left:-20px;}
</style>
</head>
<body>
    <div id="outer">
        <h3>공지사항</h3>
        <hr>

        <div id="content">
            <div id="content1">
                <span>공지사항</span><br>
                <span id="title">
                    <a href="">가벼운 여름 캠핑 필수템만 시원하게 모았어요! <한여름의 쿨 캠핑> 기획전</a>
                </span>
                <br><span>2021-02-03</span>
            </div>
            
            <div id="content2">
                <a href=""><img src="../common/notice/공지1.jpg"></a>
            </div>
            <br><br><br><br><br><br><br><br><br><hr>
        </div>

        
        <div id="content">
            <div id="content1">
                <span>공지사항</span><br>
                <span id="title">
                    <a href="../common/notice/공지2.jpg">가벼운 여름 캠핑 필수템만 시원하게 모았어요! <한여름의 쿨 캠핑> 기획전</a>
                </span>                
                <br><span>2021-02-03</span>
            </div>
            
            <div id="content2">
                <a href=""><img src="../common/notice/공지3.png"></a>
            </div>
            <br><br><br><br><br><br><br><br><br><hr>
        </div>

        
        <div id="content">
            <div id="content1">
                <span>공지사항</span><br>
                <span id="title">
                    <a href="">가벼운 여름 캠핑 필수템만 시원하게 모았어요! <한여름의 쿨 캠핑> 기획전</a>
                </span>                
                <br><span>2021-02-03</span>
            </div>
            
            <div id="content2">
                <a href=""><img src="../common/notice/공지4.jpg"></a>
            </div>
            <br><br><br><br><br><br><br><br><br><hr>
        </div>
        

    </div>
</body>
</html>