$(document).ready(function() {
  $(document).on('submit', '.giveanewreward', giveReward)
  $(document).on('submit', '.denyanewreward', denyReward)
  $('.addpoints').on('submit', givePoints)
  $('.rmpoints').on('submit', removePoints)
  $('a.points-window').on('click', togglePointsBox);
  $('a.rmpoints-window').on('click', togglePointsBox);
  $(document).on('click', 'a.close, #mask', closeAddPoints);
  $(document).on('click', 'a.close, #mask', closeRemovePoints);
});

var closeAddPoints = function() {
  $('#mask, .points-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  return false;
}

var closeRemovePoints = function() {
  $('#mask, .rmpoints-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  return false;
}

var giveReward = function(e) {
  e.preventDefault();
  $.ajax({
    url: '/members/give_reward',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getFamilymembers()
  }).fail(function(response) {
    console.log(response)
  })
};

var denyReward = function(e) {
  e.preventDefault();
  $.ajax({
    url: '/members/deny_reward',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getFamilymembers()
  }).fail(function(response) {
    console.log(response)
  })
};

var givePoints = function(e) {
  e.preventDefault();
  console.log(e.target)
  $('#mask, .points-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  $.ajax({
    url: '/members/add_points',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getFamilymembers()
  }).fail(function(error) {
    console.log(error)
  })
}

var removePoints = function(e) {
  e.preventDefault();
  console.log(e.target)
  $('#mask, .rmpoints-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  $.ajax({
    url: '/members/remove_points',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getFamilymembers()
  }).fail(function(error) {
    console.log(error)
  })
}

var togglePointsBox = function() {
  var pointsBox = $(this).attr('href');
  $(pointsBox).fadeIn(300);
  var popMargTop = ($(pointsBox).height() + 24) / 2;
  var popMargLeft = ($(pointsBox).width() + 24) / 2;
  $(pointsBox).css({
    'margin-top': -popMargTop,
    'margin-left': -popMargLeft
  });
  $('body').append('<div id="mask"></div>');
  $('#mask').fadeIn(300);
  return false;
}
