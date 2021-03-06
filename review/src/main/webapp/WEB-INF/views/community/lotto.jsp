<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../header.jsp" />
<%-- <%@include file="header.jsp" %> --%>


<div id="wrapper">
	<h1 id="title">Lotto</h1>
	<div id="numbers">
		<div class="ball blue">?</div>
		<div class="ball blue">?</div>
		<div class="ball blue">?</div>
		<div class="ball red">?</div>
		<div class="ball red">?</div>
		<div class="ball grey">?</div>
		<div class="plus">+</div>
		<div class="ball bonus">?</div>
	</div>
	<button id="btn">시작!</button>
</div>



<jsp:include page="../footer.jsp" />
<style>
@
keyframes done { 70% {transform: scale(1.2)}100%{transform:scale(1)}}*, ::before, ::after {	box-sizing: border-box}

body, div, button, h1 {
	font: inherit;
	padding: 0;
	margin: 0;
	border: 0;
	outline: 0;
	background: 0
}

#title {
	font-size: 3rem;
	margin: 2rem 0
}

#wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 10px
}

#numbers {
	display: flex;
	margin-bottom: 20px;
	padding: 30px;
	border: 3px solid pink;
	border-radius: 20px
}

#numbers .ball {
	width: 80px;
	height: 80px;
	margin-right: 10px;
	line-height: 80px;
	font-size: 48px;
	border-radius: 50%;
	text-align: center;
}

#numbers .ball.blue {
	background: #69c8f2
}

#numbers .ball.red {
	background: #ff7272
}

#numbers .ball.grey {
	background: #aaa
}

#numbers .ball.bonus {
	background: #b0d840
}

#numbers .ball.done {
	animation: done .3s linear
}

#numbers .ball:last-child {
	margin-right: 0
}

#numbers .plus {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
	font-size: 48px;
	font-weight: bold
}

#btn {
	position: relative;
	display: block;
	padding: 1rem 2.5rem 1.6rem;
	background: #fff;
	color: #666;
	border: 2px solid #666;
	border-radius: 6px;
	overflow: hidden;
	transition: .5s;
	user-select: none
}

#btn:hover {
	padding: 1rem 2.5rem 1rem;
	margin-top: .6rem;
	background: #999;
	color: #fff
}

#btn::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	display: block;
	height: .6rem;
	width: 100%;
	background-image: repeating-linear-gradient(45deg, #666, #666 1px, transparent 2px,
		transparent 5px);
	border-top: 1px solid #666;
	transition: .5s
}

#btn:hover::after {
	transform: translateY(.6rem)
}

#btn.hide {
	transform: scale(0)
}

@media screen and (max-width: 800px) {
	#numbers {
		flex-direction: column;
		align-items: center
	}
	#numbers .ball {
		margin-right: 0;
		margin-bottom: 10px
	}
	#numbers .ball:last-child {
		margin-bottom: 0
	}
}
</style>
<script>
const btn = document.getElementById("btn");
let tmp = 1, numbers;

function getindex(c) {
    let d = 0;
    for (d; c = c.previousElementSibling; d++);
    return d
}

function decryptEffect(elem, time) {
    const effect = setInterval(function() {
        elem.innerText = Math.floor(Math.random()*44 + 1)
    }, 10);
    setTimeout(function() {
        const random = Math.floor(Math.random() * numbers.length);
        clearInterval(effect),
        elem.classList.add("done"),
        elem.innerText = numbers[random],
        numbers.splice(random, 1)
    },  time * 1000 + 1000)
}

function lottery() {
    Array.from(document.querySelectorAll(".ball")).forEach(a => {
        a.classList.remove("done"),
        decryptEffect(a, getindex(a))
    })
}

btn.addEventListener("click", function() {
    tmp === 1 && (
        numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45],
        tmp = 0,
        btn.classList.add("hide"),
        lottery(),
        setTimeout(function() {
            tmp = 1,
            btn.classList.remove("hide")
        }, 8500)
    )
})

</script>
