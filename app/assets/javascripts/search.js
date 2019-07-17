$(document).on('turbolinks:load', function(){
  function buildHTML(datafromsearch){
    let html = `<div class="food_add_space__dish">
                  <p class="food_add_space__dish__name">
                    ${datafromsearch.name}
                  </p>
                  <p class="food_add_space__dish__calorie">
                    ${datafromsearch.calorie} 
                  </p>
                  <p class="food_add_space__dish__unit">
                    kcal
                  </p>
                  <div class="food_add_space__dish__add" data-food-id="${datafromsearch.id}" data-food-name="${datafromsearch.name}" data-food-calorie="${datafromsearch.calorie}" >
                    チェック
                  </div>
                </div>`
    $("#search_result").append(html);
  }

  function NoResult(message){
    let html = `<div class="food_add_space__dish">
                  <p class="food_add_space__dish__name">
                    ${message}
                  </p>
                </div>`
    $("#search_result").append(html);
  }
  
  $(document).on("keyup",".form_searchfood__form-for__item__name", function() {
    $(".alert").empty();
    $("#search_result").empty();
    var input = $(".form_searchfood__form-for__item__name").val();
    if (input.length !== 0) {

      $.ajax({
        type: 'GET',
        url: '/foods/search',
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(foods) {
        if (foods.length !== 0) {
          foods.forEach(function(data){
            buildHTML(data);
          });
        }
        else {
          NoResult("一致する食品が見つかりません");   
        }
      })
      .fail(function() {
        alert('食品検索に失敗しました');
      });
    } 
  });
});