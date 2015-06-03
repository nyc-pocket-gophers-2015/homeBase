$(document).ready(function() {
  $('a.chore-window').click(function() {
    var choreBox = $(this).attr('href');
    $(choreBox).fadeIn(300);
    var popMargTop = ($(choreBox).height() + 24) / 2;
    var popMargLeft = ($(choreBox).width() + 24) / 2;
    $(choreBox).css({
      'margin-top': -popMargTop,
      'margin-left': -popMargLeft
    });
    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);
    return false;
  });
  $(document).on('click', 'a.close, #mask', function() {
    $('#mask, #chore-box').fadeOut(300, function(e) {
      $('#mask').remove();
    });
    return false;
  });
  var date = new Date()
  $('#date').text(date.toDateString());
  getPeople();
  getUnassigned();
  $(document).on('submit', '.chore-form', updateChore);
  $(document).on('submit', '.unassigned-task', reassignChore);
  $(document).on('submit', '.chore-form', assignChore)
});

var assignChore = function(e) {
  e.preventDefault();
  $('#mask, #chore-box').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  $.ajax({
    url: '/tasks',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response) {
    getPeople();
    getUnassigned();
  }).fail(function(error) {})
}

var updateChore = function(e) {
  e.preventDefault();
  $.ajax({
    url: "tasks/kid_complete",
    type: 'post',
    data: $(e.target).serialize()
  }).then(function(response) {
    getPeople();
  }).fail(function(error) {})
};

var getPeople = function() {
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response) {
    var template = $('#person-template').html();
    var dropdown = $('#child-chore').html()
    $('.people-container').html("");
    $('#child-options').html('<option></option>')
    response.members.forEach(function(member) {
      var renderPeople = Mustache.render(template, member);
      var renderChildChores = Mustache.render(dropdown, member);
      $('.people-container').append(renderPeople);
      $('#child-options').append(renderChildChores);
    });
  });
};


var getUnassigned = function() {
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response) {
    var taskTemplate = $('#task-template').html();
    var unassignedDropdownOption = $("#unassigned-option").html()
    $("#unassigned").html("")
    response.unassignedTasks.forEach(function(task) {
      var renderUnassigned = Mustache.render(taskTemplate, task);
      $('#unassigned').append(renderUnassigned);
    })
    response.members.forEach(function(member) {
      var renderUnassignedDropdown = Mustache.render(unassignedDropdownOption, member);
      $(".unassigned-dropdown").append(renderUnassignedDropdown);
    })
  });
};

var reassignChore = function(e) {
  e.preventDefault();
  $.ajax({
    url: 'tasks/reassign',
    type: "post",
    data: $(e.target).serialize()
  }).done(function(response) {
    getUnassigned();
    getPeople();
  }).fail(function(error) {
    console.log(error);
  });
};
