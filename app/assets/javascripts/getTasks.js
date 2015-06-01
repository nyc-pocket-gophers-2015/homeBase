$(document).ready(function(){
  getTasks();
});


var getTasks = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    console.log(response);
    var template = $('#task-template').html();
    response.forEach(function(task){
    if(task.id < 5){
    var render = Mustache.render(template, task);
    $('.tasks-container').append(render);
  }
    else if(task.assigned_member_id === null){
      console.log(task);
    var render_unassigned = Mustache.render(template, task);
    $('.unassigned').append(render_unassigned);

  }
    })
    });
};