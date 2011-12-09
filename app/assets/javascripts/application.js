// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$(".add_step").click(function(event){
		event.preventDefault();
		// make an ajax call to the steps controller / new action
		var id = location.href.match(/\/goals\/(\d+)/)[1];
		console.log(id);
		$.post("/goals/" +id+"/edit", function(){
			
		})
	})
});
