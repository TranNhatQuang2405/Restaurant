var buttons = document.querySelectorAll(".menu-strip li button");
buttons.forEach(function(button) {
    button.addEventListener("click", function(event) {
        var btnlist = document.querySelectorAll(".menu-strip li button");
        for (var i = 0; i < btnlist.length; i++) {
            btnlist[i].style.color = "white";
        }
        var divs = document.querySelectorAll(".menu-right div");
        for (var i = 0; i < divs.length; i++)
            divs[i].style.display = "none";
        var btnItem = event.target;
        btnItem.style.color = "maroon";
        var text = btnItem.innerText;
        if (text == "Order Now" || text =="Booking Accepted")
            document.querySelector(".now").style.display = "block";
        else if (text == "Order Wait" || text == "Booking Waiting")
            document.querySelector(".wait").style.display = "block";
        else 
            document.querySelector(".history").style.display = "block";
    });
});