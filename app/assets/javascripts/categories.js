// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  nfdns
  //Add a sub-category within the create new category form
  $('#more-sub-cats-btn').click(function() {
    var cat_textfield = document.createElement("input");
    cat_textfield.setAttribute("name",`main_category[sub_categories][]`);
    cat_textfield.setAttribute("type","text");
    cat_textfield.setAttribute("placeholder","Sub-category name");
    cat_textfield.setAttribute("class","form-control sub-cat-textfield");
    var sub_cat_textfield_div = document.createElement("div");
    sub_cat_textfield_div.setAttribute("class","col-xs-11 sub-cat-textfield-div");
    sub_cat_textfield_div.appendChild(cat_textfield);

    var cat_rmv_link = document.createElement("a");
    cat_rmv_link.setAttribute("class","rmv-sub-cat-row-btn");
    var cat_rmv_icon = document.createElement("span");
    cat_rmv_icon.setAttribute("class","glyphicon glyphicon-remove modal-glyphicon-remove");
    cat_rmv_link.appendChild(cat_rmv_icon);
    var sub_cat_rmv_btn_div = document.createElement("div");
    sub_cat_rmv_btn_div.setAttribute("class","col-xs-1 sub-cat-rmv-btn-div");
    sub_cat_rmv_btn_div.appendChild(cat_rmv_link);

    var cat_row_div = document.createElement("div");
    cat_row_div.setAttribute("class","col-xs-12 form-group sub-cat-row");
    cat_row_div.appendChild(sub_cat_textfield_div);
    cat_row_div.appendChild(sub_cat_rmv_btn_div);

    var sub_cats_div = $("#sub-cats-div");
    sub_cats_div.append(cat_row_div);
  });

  //Remove a sub-category row
  $("body").on("click", ".rmv-sub-cat-row-btn", function(){
    $(this).parent().parent().remove();
  });

  //Reset the Bootstrap modal pop-up box
  $('body').on('hidden.bs.modal', '.modal', function () {
    var sub_cats_div = $("#sub-cats-div");
    sub_cats_div.children().remove();
    });
});
