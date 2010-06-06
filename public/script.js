$(document).ready(function() {

  $("ul.sf-menu").superfish({
    pathClass: 'current',
    speed: 0,
    delay: 0,
    autoArrows: true
  });
  
  $(".datepicker").datepicker({
		showOn: 'both',
		buttonImage: '/jquery/jquery-ui-1.8.1/redmond-theme/images/calendar.gif',
		buttonImageOnly: true
	});
	
  msgFadeOut(".flash_error");
	msgFadeOut(".flash_message");
	
	$("#remaining_players, #selected_players").sortable({
		connectWith: '.connectedSortable',
		receive: function(event, ui) {
		  $("#remaining_players_count").html($("#remaining_players li").length);
		  $("#selected_players_count").html($("#selected_players li").length);
	  }

	}).disableSelection();
  
  $('a[rel*=facebox]').facebox();
  
});

function msgFadeOut(klass) {
  if ($(klass).length > 0) {
    setTimeout(function(){
  	  $(klass).fadeOut(1000, function() { $(this).remove() });
    }, 5000);
  }
}
