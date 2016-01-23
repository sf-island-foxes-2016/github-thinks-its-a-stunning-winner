// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */

function showCategoriesMenu(){
  document.getElementById("shop-by-category-Dropdown").classList.toggle("show");
}
window.onclick = function(event) {
  if (!event.target.matches('#shop-by-category-button')) {

    var dropdowns = document.getElementsByClassName("category-dropdown");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

$(document).ready(function(){
  $(".cartbtn").on('click', function(e){
    e.preventDefault();
    var product_id = $(this).attr('id');
    var user_id = $(this).closest('.product-detail-container').attr('id')
    addToCart(user_id, product_id);
  })

})

  var cartId = user_id
  //post to cart#create(product id, quantity if !=1)
  $.ajax({
    type: "PUT",
    url: "/carts/" + cartId,
   data: {product_id},
   })
  .done(function(response){
    $('#cartstuffiguess').html(response)
  })
}
