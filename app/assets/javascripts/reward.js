$(document).on('ready on:load', function() {

  $('a.new-reward-link').click(function() {
    var rewardBox = $(this).attr('href');
    $(rewardBox).fadeIn(300);
    var popMargTop = ($(rewardBox).height() + 24) / 2;
    var popMargLeft = ($(rewardBox).width() + 24) / 2;
    $(rewardBox).css({
      'margin-top': -popMargTop,
      'margin-left': -popMargLeft
    });
    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);
    return false;
  });
  $(document).on('submit', '.buyreward', buyReward);
  $(document).on('submit', '.create-reward', createReward)
  getRewards();
  $(document).on('click', '#mask', function() {
    $('#mask, #new-reward').fadeOut(300, function(e) {
      $('#mask').remove();
    });
    return false;
  });
});

var createReward = function(e) {
  e.preventDefault();
  $('#mask, #new-reward').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  $.ajax({
    url: '/rewards',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getRewards();
  }).error(function(response){
    alert("We're sorry something went wrong. You're reward was not created.")
    console.log(response)
  })
};

var buyReward = function(e){
  e.preventDefault();
  console.log("hello")
  $.ajax({
    url: 'rewards/buy_reward',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    getRewards()
  }).fail(function(response){
    console.log(response)
  })
};


var getRewards = function() {
  $.ajax({
    url: "http://localhost:3000/rewards",
    type: 'get',
    dataType: 'json'
  }).done(function(response) {
    var rewardTemplate = $('#reward-template').html();
    var dropdown = $('#child-reward').html();
    $('.rewards-container').html("");
    $('.child-options').html("");
    response.members.forEach(function(member) {
      var rewardRender = Mustache.render(rewardTemplate, member);
      var rewardDropdownMember = Mustache.render(dropdown, member);
      $('.rewards-container').append(rewardRender);
      $('.child-options').append(rewardDropdownMember);
    });
  });
};
