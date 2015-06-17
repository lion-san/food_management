//スクロールされた時
var timer = false;
$(window).scroll(function() {
    
    $("#item_regist").fadeOut("normal");
    
    if (timer !== false) {
        clearTimeout(timer);
    }
    timer = setTimeout(function() {
        console.log('scroll');
		$("#item_regist").fadeIn("slow");
    }, 1500);
});

