$(document).ready(function() {

    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) { // cuộn trang quá 100px
            $('#totop').fadeIn(); // nút back top hiện ra nếu vượt quá 100px 
        } else {
            $('#totop').fadeOut(); // ngược lại
        }
    });

    // quay lại vị đầu trang
    $('#totop').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

});

function showpass() {
	  var x = document.getElementById("passan");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
	function showpass2() {
	  var x = document.getElementById("inputEmail3");
	  var y = document.getElementById("inputPassword3");
	  var z = document.getElementById("inputPassword34");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	  
	  if (y.type === "password") {
	    y.type = "text";
	  } else {
	    y.type = "password";
	  }
	  
	  	  if (z.type === "password") {
	    z.type = "text";
	  } else {
	    z.type = "password";
	  }
	}
	function showpass3() {
	  var a = document.getElementById("password_field");
	  if (a.type === "password") {
	    a.type = "text";
	  } else {
	    a.type = "password";
	  }
	}