function completionIconDisplay (){
 var $statusArray = $('.current-status');
 for(i=0; i < $statusArray.length; i++){
  var $currentCell = $($statusArray[i]);
  if ($currentCell.html()==="false"){
    $currentCell.html('<i class="fa fa-times"></i>');
  } else if($currentCell.html()==="true"){
    $currentCell.html('<i class="fa fa-check"></i>');
  }
 }
}

// Function that will change the color of the table row depending on completion status

// function completionRowColor(){
//   $noteRow = $('.note-row');
//   for(i=0; i < $noteRow.length; i++){
//     if($noteRow.find('i')[i].className === 'fa fa-times'){
//       $($noteRow[i]).css("background-color", "#FF6464");
//     } else {
//       $($noteRow[i]).css("background-color", "#55D955");
//     }
//   }
// }


$(document).ready(function() {
  $(document).foundation();

  $('#back-button').click(function() {
    parent.history.back();
    return false;
  });

  completionIconDisplay();

//   var $completionIcon = $('.current-status').children().children('i');

//   $completionIcon.on('click', function(event){
//     event.preventDefault();
//     var $target = $(event.target);
//     var $url = $(event.currentTarget.offsetParent.innerHTML);

//     $.ajax({
//       type: "GET",
//       url: $url.attr('href'),
//       dataType: 'html'
//     }).done(function(response){
//       $resp = $(response).children().children('#notes-table');
//       $target.closest('#note-index').html($resp);
//       completionIconDisplay();
//     });
//   });
// });

// ajax call in loop doesn't quite work

  var $completionIcon = $('.current-status').children();

  for (var i = 0; i < $completionIcon.length; i++)
  {
    (function(i) {
      $($completionIcon[i]).on('click', function(event){
        var $target = $(event.target);
        var $url = $(event.currentTarget.offsetParent.innerHTML);
        $.ajax({
            type: "GET",
            url: $url.attr('href'),
            dataType: "html"
        }).done(function(response){
          $resp = $(response).children().children('#notes-table');
          $target.closest('#note-index').html($resp);
          completionIconDisplay();
        });
      });
    })(i);
  }

  var $trueSort = $('#true-sort');
  var $falseSort = $('#false-sort');
  var $dateSort = $('#date-sort');

  $trueSort.on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "GET",
      url: $target.attr('href')
    }).done(function(response){
      $resp = $(response).children().children('#notes-table');
      // debugger
      $target.closest('body').children('#content').children('#note-index').html($resp);
      completionIconDisplay();
    });
  });

  $falseSort.on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "GET",
      url: $target.attr('href')
    }).done(function(response){
      $resp = $(response).children().children('#notes-table');
      // debugger
      $target.closest('body').children('#content').children('#note-index').html($resp);
      completionIconDisplay();
    });
  });

  $dateSort.on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "GET",
      url: $target.attr('href')
    }).done(function(response){
      $resp = $(response).children().children('#notes-table');
      // debugger
      $target.closest('body').children('#content').children('#note-index').html($resp);
      completionIconDisplay();
    });
  });



});
