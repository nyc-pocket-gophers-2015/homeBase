$(document).ready(function() {
	$('a.chore-window').click(function() {

    var choreBox = $(this).attr('href');

    $(choreBox).fadeIn(300);

    var popMargTop = ($(choreBox).height() + 24) / 2;
    var popMargLeft = ($(choreBox).width() + 24) / 2;

    $(choreBox).css({
        'margin-top' : -popMargTop,
        'margin-left' : -popMargLeft
    });

    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);

    return false;
	});

	$('.signin').on('submit', assignChore)

// When clicking on the button close or the mask layer the popup closed
$(document).on('click', 'a.close, #mask', function() {
  $('#mask, .chore-popup').fadeOut(300, function(e) {
    $('#mask').remove();
	});
	return false;
});


});

var assignChore = function(e){
	e.preventDefault();
	$('#mask, .chore-popup').fadeOut(300, function(e) {
    $('#mask').remove();
	});
	$.ajax({
		url: '/tasks',
		method: 'post',
		data: $(e.target).serialize()
	}).done(function(response){
		console.log(response)
    location.reload(false)
	}).fail(function(error){
		console.log(error)
	})
}