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
$(document).on("page:change", function() {
	$("[data-deletable]").on("ajax:complete", function(e) {
		$(e.currentTarget).closest('div').fadeOut();
	})

	$("[data-follow]").on("ajax:complete", function(e) {
		$(e.currentTarget).hide();
		$(e.currentTarget).show();
	})

	$("[data-unfollow]").on("ajax:complete", function(e){
		$(e.currentTarget).hide();
		$(e.currentTarget).show();
	})
});

$(document).on("page:fetch", function(){
	$('body').css("cursor", "wait");
})

$(document).on("page:receive", function(){
	$('body').css("cursor", "default");
})

