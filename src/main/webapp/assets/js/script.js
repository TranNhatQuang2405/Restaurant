const btn = document.querySelectorAll(".menu-add-to-cart button");
deleteCart();
btn.forEach(function(button, index) {
    button.addEventListener("click", function(event) {
        var btnItem = event.target;
        var product = btnItem.parentElement.parentElement;
        var productImg = product.querySelector("img").src;
        var productID = product.querySelector("input").value;
        var productCost = product.querySelector("span").innerText;
        productCost = productCost.replace("$", "");
        addcart(productID, productImg, productCost);
    });
});

function addcart(productID, productImg, productCost) {
    var addtr = document.createElement("tr");
    var contentr = '<td style=" align-items: center;"><img style="width: 70px;" src="' + productImg + '" alt="" /></td>' +
        '<td><span>$' + productCost + '</span></td>' +
        '<td>' +
        '<input class="id-food" type="hidden" value="' + productID + '" name="FOODID" />' +
        '<input onChange="carttotal()" class="amount" style="width: 40px; outline: none;" type="number" name="AMOUNT" value="1" min="1" />' +
        '</td>' +
        '<td class="delete" style="cursor: pointer;"><i class="fa fa-trash"></i></td>';
    addtr.innerHTML = contentr;
    var cartTable = document.querySelector("tbody");
    if(cartTable == null)
    	{
    		var table = document.querySelector("table");
            var body = document.createElement("tbody");
            table.append(body);
            cartTable = document.querySelector("tbody");
    	}
    var ProductID = document.querySelectorAll(".id-food");
    var cartItem = document.querySelectorAll("tbody tr");
    for(var i=0 ;i<ProductID.length;i++)
    {
        if(ProductID[i].value==productID){
            var InputValue = cartItem[i].querySelector(".amount").value;
            InputValue = InputValue * 1 + 1;
            var Amount = cartItem[i].querySelector(".amount");
            Amount.value = InputValue;
            deleteCart();
            carttotal();
            return;
        };
    }
    cartTable.append(addtr);
    deleteCart();
    carttotal();
}


function carttotal(){
    var cartItem = document.querySelectorAll("tbody tr");
    var Total = 0;
    for(var i =0 ;i<cartItem.length;i++)
    {
        var InputValue = cartItem[i].querySelector(".amount").value;
        var Cost = cartItem[i].querySelector("span").innerText.replace("$","");
        Total = Total + InputValue * Cost;
    }
    var cartTotal = document.querySelector(".total_price");
    cartTotal.innerText="Total: "+Total+"$";
}

function deleteCart(){
    var Xoa = document.querySelectorAll(".delete");
    for(var i=0 ;i<Xoa.length;i++)
    {
        Xoa[i].addEventListener("click", function(event){
            var CartDelete = event.target;
            var Item = CartDelete.parentElement;
            if(Item.nodeName != "TR")
            	Item = Item.parentElement;
            Item.remove();
            carttotal();
        });
    };
};
const cartbtn = document.querySelector(".fa-times");
const cartshow = document.getElementById("yourcart");
cartshow.addEventListener("click",function(){
    document.querySelector(".yourcart").style.right = "0";
})
cartbtn.addEventListener("click",function(){
    document.querySelector(".yourcart").style.right = "-100%";
});
/*var btnFind = document.getElementById("FIND");
btnFind.addEventListener("click",function(){
	var textFind = document.getElementById("FindFood").value;
    var listFood = document.querySelectorAll(".menu-container div div a");
    if(listFood != null){
    	for(var i=0;i<listFood.length;i++){
            listFood[i].parentElement.parentElement.style.display = "none";
        };
        for(var i=0;i<listFood.length;i++){
            if(listFood[i].innerText.indexOf(textFind) != -1)
                listFood[i].parentElement.parentElement.style.display = "block";
        };
    };
});*/
