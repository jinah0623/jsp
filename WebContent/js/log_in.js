var log = document.getElementById("login");
var reg = document.getElementById("register");
var tog = document.getElementById("btn");

function login(){
    log.style.left = "50px";
    reg.style.left = "450px";
    tog.style.left = "0";
}

function register(){
    log.style.left = "-400px";
    reg.style.left = "50px";
    tog.style.left = "120px";
}