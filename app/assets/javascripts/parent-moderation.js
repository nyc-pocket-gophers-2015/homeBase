$(document).ready(function(){
  $(document).on('submit','.approve-chore', approveChore)
  $(document).on('submit', '.reject-chore', deleteChore);
  $(document).on('submit', '.redo-chore', redoChore);
})

var approveChore = function(e){
  e.preventDefault();
  $.ajax({
    url: 'tasks/parent_complete',
    method: "post",
    data: $(e.target).serialize(),
  }).done(function(response){
    getPeople();
  }).fail(function(error){
  });
}

var deleteChore = function(e){
  e.preventDefault();
  $.ajax({
    url: 'tasks/parent_delete',
    type: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    getPeople();
  }).fail(function(error){
  })
};

var redoChore = function(e){
  e.preventDefault();
  $.ajax({
    url: 'tasks/parent_redo',
    type: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    getPeople();
  }).fail(function(error){
  })
};
