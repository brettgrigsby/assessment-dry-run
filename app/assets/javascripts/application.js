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


$(document).on("click", ".read-btn", toggleLink)

function toggleLink() {
  var $link = $(this).parent();
  var linkId = $(this).parent().attr("data-id");

  $.ajax({
    url: "/links/" + linkId,
    type: "PUT",
    success: function(result) {
      var otherList = $link.parent().siblings().first();
      var url = $link.children('a').first().text()

      otherList.append(createLink(url, linkId));
      var newButton = otherList.last().children('button').first();
      newButton.on("click", toggleLink);
      $link.remove();
    }
  });
};

function addNewLink(url) {
  $.ajax({
    url: "/links",
    type: "POST",
    data: { link: { url: url } },
    success: function(link) {
      var list = $("#unread-links");
      console.log(link);
      list.append(createLink(url, 50));
      var newButton = list.last().children('button').first();
      newButton.on("click", toggleLink);
    }
  });
}

function createLink(url, id, buttonText) {
  return '<li data-id="' + id + '"><a href="' + url + '">' + url + '</a><button class="read-btn">toggle read</button></li>'
}

$(document).ready(function () {

})

