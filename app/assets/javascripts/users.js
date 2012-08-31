function scroll_down(){
	$('html, body').animate({scrollTop:$(document).height()}, 'slow');
}
$('#load_more').bind('ajax:before', function() {  
	$('#load_more').html('Loading...').attr('class','btn btn-info btn-large btn-block');
}); 
$('#load_more').bind('ajax:complete', function() {  
	$('#load_more').html('Load more').attr('class','btn btn-primary btn-large btn-block');
	scroll_down();
}); 
$('#category').change(function(c) {
	if (this.value){
		$('#users').html('<tr><td collspan="5">Loading...</td></tr>');
		$('#load_more').hide();
		$.getScript('/users/category.js?page=1&category='+this.value);
	} else {
		$('#users').html('');
		$('#loading').hide();
		$('#load_more').show();
		$.getScript('/users.js');
		scroll_down();
	}
}); 