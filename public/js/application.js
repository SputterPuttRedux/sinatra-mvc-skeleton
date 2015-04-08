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

  $('#back-button').click(function() {
    parent.history.back();
    return false;
  });

  completionIconDisplay();
  // completionRowColor();
  var $completionIcon = $('.current-status').children().children('i');

  $completionIcon.on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax( $target.attr('class', 'fa fa-times'));
  });

// stopped here. trying to write an ajax call that will execute the helper method I wrote that changes the completion status of the individual note.

});
