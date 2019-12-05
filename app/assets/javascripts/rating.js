$(document).ready(function(){
	console.log("ok");
	$('.stars-ico').click(function(){
		var star = $(this);
		var stars = $(this).attr('data-stars');

		for ( i = 1; i <= 5; i++) {
			if (i <= stars) {
				$('#' + 'starid-' + i).removeClass('stars-icon-off');
				$('#' + 'starid-' + i).addClass('stars-icon-on');
			} else {
				$('#' + 'starid-' + i).removeClass('stars-icon-on');
				$('#' + 'starid-' + i).addClass('stars-icon-off');
			}
		}
	});
});