$(document).on('turbolinks:load', function() {
  attachListeners()
}).on("scroll", function() {
  scrollingCommands()
})


var attachListeners = function() {
  $('#just-decisions').on('click', function(event) {
    if($(event.target).attr('class').includes('vote-btn')) {
      doVote(event)
    }
  })
  $('#user-strip').on('click', function(event) {
    showHistory(event)
  })
}

var scrollingCommands = function() {
  var leftCards = $(".left-cards")
  if ($(this).scrollTop() > 71) {
    leftCards.addClass("left-cards-fix")
  } else {
    leftCards.removeClass("left-cards-fix")
  }
}

function doVote(event) {
  var decisionId = event.target.parentElement.dataset.parent
  var persuasion = event.target.id
  var persuasionNum = persuasion.replace(`decision-${decisionId}-option-`,'')
  var otherPersuasion = persuasionNum === '1' ? '2' : '1'
  var canVote = $(`#decision-wrapper-${decisionId} .vote-btn`).hasClass("can-vote")
  var hasRejected = $(`#decision-wrapper-${decisionId} #${persuasion}`).hasClass("vote-rejected-btn")
  var hasSelected = $(`#decision-wrapper-${decisionId} #${persuasion}`).hasClass("vote-selected-btn")
  var notVotedYet = !($(`#decision-wrapper-${decisionId} .vote-btn`).hasClass("vote-rejected-btn"))
  var optionSelected = `#decision-${decisionId}-option-${persuasionNum}-votes`
  var optionNotSelected = `#decision-${decisionId}-option-${otherPersuasion}-votes`

  if (canVote && hasRejected) {
    // Switching the way the vote count looks
    $(optionSelected).removeClass("option-rejected-votes").addClass("option-selected-votes")
    $(optionNotSelected).addClass("option-rejected-votes")

    // Toggling the class of the option display
    $(`#decision-wrapper-${decisionId} .vote-btn`).toggleClass("vote-selected-btn vote-rejected-btn")

    // Animating in or out!
    $(`#decision-wrapper-${decisionId} #${persuasion}`).animate({
      width: '93%',
      height: 54
    }, 50)
    $(`#decision-wrapper-${decisionId} #decision-${decisionId}-option-${otherPersuasion}`).animate({
      width: '89%',
      height: 48
    }, 50)

    $('li#flash-li')[0].innerHTML = "You just switched your vote!"

  } else if (canVote && notVotedYet) {
    // Switching the way the vote count looks
    $(optionSelected).addClass("option-selected-votes")
    $(optionNotSelected).addClass("option-rejected-votes")

    // Animating in or out!
    $(`#decision-wrapper-${decisionId} #${persuasion}`).addClass("vote-selected-btn").animate({
      width: '93%',
      height: 54
    }, 50)
    $(`#decision-wrapper-${decisionId} #decision-${decisionId}-option-${otherPersuasion}`).addClass("vote-rejected-btn").animate({
      width: '89%',
      height: 48
    }, 50)
    $('li#flash-li')[0].innerHTML = "Ay! Good choice!"

  } else if (hasSelected) {
    $('li#flash-li')[0].innerHTML = " AY! You already voted for this! "
  } else if (!canVote) {
    $('li#flash-li')[0].innerHTML = "You can't vote on your own post!"
  }

  event.preventDefault()

  $.ajax({
    url: `/decisions/${decisionId}/vote?persuasion=${persuasionNum}`,
    type: "POST",
    success: function(data) {
      $('#decision-wrapper-' + data.id + ' .vote-count')[0].innerText = data.votes_for_option_1
      $('#decision-wrapper-' + data.id + ' .vote-count')[1].innerText = data.votes_for_option_2
    }
  })
}

function showHistory(event) {
  event.preventDefault()

  var userId = event.target.parentElement.id.replace('user-box-user-','')

  if ($(`#user-${userId}-show-history`)[0].innerHTML != "") {
    $(`#user-${userId}-show-history`)[0].innerHTML = ""
  } else {

    $(`.user-show-history`).each(function() {
      this.innerHTML = ''
    })

    $.ajax({
      url: `/users/${userId}.json`,
      type: "GET",
      success: function(data) {
        $(`#user-${userId}-show-history`)[0].innerHTML = makeDecisionsList(data.decisions) + makeVotedList(data.voted_decisions)
        $('#limit').animate({
          height: $(`#show-history`).height()
        },110)
      }
    })
  }
}

function makeDecisionsList(decisions) {
  var decisionsList = "<div id='limit'><div id='show-history'><br><h3>Asked:</h3><ul>"
  $.each(decisions, function(index, item){
    decisionsList += `<li>${item.title}</li>`
  })
  return decisionsList += "</ul>"
}

function makeVotedList(votedDecisions) {
  var votedList = "<br><h3>Voted on:</h3><ul>"
  $.each(votedDecisions, function(index, item){
    votedList += `<li>${item.title}</li>`
  })
  return votedList += "</ul></div></div>"
}

function hide(thingToHide) {

}
