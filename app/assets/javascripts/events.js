$(document).ready(function(){
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();
  var calendar = $('#calendar').fullCalendar({
    theme: true,
    contentHeight: 300,
    fixedWeekCount: false,
    defaultView: 'basicWeek',
    header: {
      left: "prev, next today",
      center: "title",
      right: "month,agendaWeek,agendaDay"
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventSources: [{
      url: '/events'
    }],
    timeFormat: 'h:mm'
  });

  // $('#datepicker').datepicker({
  //   changeMonth: true,
  //   changeYear: true
  // });
  //  $('#datepicker2').datepicker({
  //   changeMonth: true,
  //   changeYear: true
  // });
});
