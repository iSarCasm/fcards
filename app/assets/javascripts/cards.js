$(document).on('turbolinks:load', function() {
  $('#card_question').on('keydown', function(event) { updateCard() });
  $('#card_question').on('keyup', function(event) { updateCard() });
  $('#card_answer').on('keydown', function(event) { updateCard() });
  $('#card_answer').on('keyup', function(event) { updateCard() });
  updateCard();
})

var question, answer;

function updateCard() {
  if($('#card_question').val() !== question || $('#card_answer').val() !== answer) {
    question = $('#card_question').val();
    answer = $('#card_answer').val();
    $('#card-question').html(question);
    $('#card-text').html(answer);
    refreshMath();
  }
}

function refreshMath() {
  MathJax.Hub.Queue(["Typeset", MathJax.Hub, $('#card-question')[0]]);
  MathJax.Hub.Queue(["Typeset", MathJax.Hub, $('#card-text')[0]]);
}