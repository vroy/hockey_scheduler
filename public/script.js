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
	
	setTimeout(function(){
		$(".flash_error").fadeOut(1000, function() { $(this).remove() });
		$(".flash_message").fadeOut(1000, function() { $(this).remove() });
	}, 5000);
	
	
	$("#remaining_players, #selected_players").sortable({
		connectWith: '.connectedSortable',
		receive: function(event, ui) {
		  $("#remaining_players_count").html($("#remaining_players li").length);
		  $("#selected_players_count").html($("#selected_players li").length);
	  }

	}).disableSelection();
  
  $('a[rel*=facebox]').facebox();
  
});
