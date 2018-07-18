// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chosen-jquery

jQuery(function($){
  // Customize certain select boxes with Chosen
  //$(".chosen").chosen();

  // Append divs to add multiple ingredients on recipe pages
  $('.add-ingredient-btn').click(function(){
    var lastRow = $('div[id^="ingredient"]:last');
    var rowNumber = parseInt(lastRow.prop("id").match(/\d+/g), 10) +1;

    var newRow = lastRow.clone(true);
    newRow.prop('id', 'ingredient' + rowNumber);
    newRow.find('input').val('');
    //newRow.children('select').prop('id', 'recipe_recipe_ingredient_joins_attributes_' + rowNumber +'_ingredient_id_chosen');

    if (rowNumber == 2){
      newRow.append('<ion-icon name="close" size="small" class="remove-ingredient-btn btn"></ion-icon>')
    }

    lastRow.after(newRow);
  })

  // Remove appended divs on recipe pages
  $('div[id^="ingredient"]').on("click", '.remove-ingredient-btn', function(){
    $(this).parent('div[id^="ingredient"]').remove();
  })

})
