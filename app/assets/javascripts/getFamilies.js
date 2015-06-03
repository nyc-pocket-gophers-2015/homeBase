$(document).ready(function() {
  getFamilymembers();
});


var getFamilymembers = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    $('.familyname-container').html("");
    var memberMedalTemplate = $('#memberMedal-template').html();
    var dropdown = $('#child-points').html();
    var familynameTemplate = $('#familyname-template').html();
    var familynameRender = Mustache.render(familynameTemplate, response);
    $('.familyname-container').append(familynameRender);
    $('.members-medals-container').html("");
    $('.child-points').html("");
    response.members.forEach(function(member){
      var memberMedalRender = Mustache.render(memberMedalTemplate, member);
      var renderChildPoints = Mustache.render(dropdown, member);
      $('.members-medals-container').append(memberMedalRender);
      $('.child-points').append(renderChildPoints);
    })
  });
};
