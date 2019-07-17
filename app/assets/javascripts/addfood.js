$(document).on('turbolinks:load', function(){
  function buildHTML(id, name, calorie) {
    let html = `<div class="food_add_space__dish" id="food_add_space__dish-${id}">
                <input name='food[ids][]' type='hidden' value='${id}'>
                <p class="food_add_space__dish__name">
                  ${name}
                </p>
                <p class="food_add_space__dish__calorie fortotal">
                  ${calorie}
                </p>
                <p class="food_add_space__dish__unit">
                  kcal
                </p>
                <div class="food_add_space__dish__remove" >
                  はずす
                </div>
                </div>`
    $("#food_add_space").append(html);
  }

  function calcPrice() {
    var price = [];
    $('.fortotal').each(function(){
  　  //数値型に変換して変数に代入するよ
      var number = parseInt($(this).text());
      //配列に入れる                
      price.push(number);
    });
    var price_total = 0;
  　//for文で配列を回して合計を出す
    for(var i = 0, len = price.length;i < len; i++){
      price_total += price[i];
    }
    if (price_total <= 2000) {
      $("#total_calorie").text("合計： " + price_total + " kcal　(๑ÒωÓ๑)و✧");
    } else if (price_total <= 3000) {
      $("#total_calorie").text("合計： " + price_total + " kcal　( ˙꒳​˙ ٥)ｱﾗｰ？");
    } else {
      $("#total_calorie").text("合計： " + price_total + " kcal　(ﾉд<｡｀)ｬﾍﾞｰ");
    }
  }

  $(document).on("click", ".food_add_space__dish__add", function (e) {
    e.preventDefault();
    var id = $(this).data('food-id');
    var name = $(this).data('food-name');
    var calorie = $(this).data('food-calorie');
    buildHTML(id, name, calorie);
    calcPrice();
    $("#search_result").empty();
  });

  $(document).on('click', '.food_add_space__dish__remove', function() {
    var remove_dish = $(this).parent('.food_add_space__dish');
    remove_dish.remove();
    calcPrice();
  });
});