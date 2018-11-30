// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  // var uuid = require("uuid");
  var id_string = Math.random().toString(36).substring(2)
               + (new Date()).getTime().toString(36);
  // var id_string = uuid.v4();
  
  //Add a sub-category within the Bootstrap modal pop-up box
  $('#modal-more-sub-cats-btn').click(function() {
     var cat_label = document.createElement("label");
     cat_label.innerHTML = "*";
     cat_label.setAttribute("class","modal-sub-cat-label");
     var sub_cat_label_div = document.createElement("div");
     sub_cat_label_div.setAttribute("class","col-xs-1 modal-sub-cat-label-div");
     sub_cat_label_div.appendChild(cat_label);

     var cat_textfield = document.createElement("input");
     cat_textfield.setAttribute("type","text");
     cat_textfield.setAttribute("class","form-control modal-sub-cat-textfield");
     var sub_cat_textfield_div = document.createElement("div");
     sub_cat_textfield_div.setAttribute("class","col-xs-10 modal-sub-cat-textfield-div");
     sub_cat_textfield_div.setAttribute("name", `sub_cat_${id_string}`);
     sub_cat_textfield_div.appendChild(cat_textfield);

     var cat_rmv_link = document.createElement("a");
     cat_rmv_link.setAttribute("class","modal-rmv-sub-cat-row-btn");
     var cat_rmv_icon = document.createElement("span");
     cat_rmv_icon.setAttribute("class","glyphicon glyphicon-remove modal-glyphicon-remove");
     cat_rmv_link.appendChild(cat_rmv_icon);
     var sub_cat_rmv_btn_div = document.createElement("div");
     sub_cat_rmv_btn_div.setAttribute("class","col-xs-1 modal-sub-cat-rmv-btn-div");
     sub_cat_rmv_btn_div.appendChild(cat_rmv_link);

     var cat_row_div = document.createElement("div");
     cat_row_div.setAttribute("class","col-xs-12 form-group");
     cat_row_div.appendChild(sub_cat_label_div);
     cat_row_div.appendChild(sub_cat_textfield_div);
     cat_row_div.appendChild(sub_cat_rmv_btn_div);

     var sub_cats_div = $("#modal-sub-cats-div");
     sub_cats_div.append(cat_row_div);
  });

  //Remove a sub-category row within the Bootstrap modal pop-up box
  $("body").on("click", ".modal-rmv-sub-cat-row-btn", function(){
    $(this).parent().parent().remove();
  });

  //Reset the Bootstrap modal pop-up box
  $('body').on('hidden.bs.modal', '.modal', function () {
    var sub_cats_div = $("#modal-sub-cats-div");
    sub_cats_div.children().remove();
    });
});
