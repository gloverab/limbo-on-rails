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
  $('#decision_title_submit').on('click', function(event) {
    newPostDropdown(event)
  })
  $('#show-more-index').on('click', function(event) {
    showMore(event)
  })
  $('.discussion-details').on('click', function(event) {
    if($(event.target).attr('class').includes('vote-btn')) {
      doVote(event)
    }
  })
  $('.delete-decision-btn').on('click', function(event) {
    deleteDecision(event)
  })
  $("#edit-user-avatar").dropzone({ url: "/file/post" })
  $("#photo-upload-form").on('change', function(event) {
    event.currentTarget.submit()
  })
}

var scrollingCommands = function() {
  var leftCards = $(".left-cards")
  if ($(this).scrollTop() > 71) {
    leftCards.addClass("left-cards-fix")
  } else {
    leftCards.removeClass("left-cards-fix")
  }
  if($(this).scrollTop() == $(document).height() - $(this).height()) {
    showMore(event)
  }
}



function doVote(event) {
  var decisionId = event.target.parentElement.dataset.parent
  var persuasion = event.target.id
  var persuasionNum = persuasion.replace(`decision-${decisionId}-option-`,'')
  var otherPersuasion = persuasionNum === '1' ? '2' : '1'
  var divFlashMessage = $(`#decision-wrapper-${decisionId} .flash-message`)
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
    $(`#decision-wrapper-${decisionId} #${persuasion}`).velocity({
      width: '93%',
      height: 54
    }, 400, 'spring')
    $(`#decision-wrapper-${decisionId} #decision-${decisionId}-option-${otherPersuasion}`).velocity({
      width: '89%',
      height: 48
    }, 400, 'spring')

    divFlashMessage.html("You just switched your vote!").delay(500).fadeOut(1000, function() {
      $(this).empty().show()
    })

  } else if (canVote && notVotedYet) {
    // Switching the way the vote count looks
    $(optionSelected).addClass("option-selected-votes")
    $(optionNotSelected).addClass("option-rejected-votes")

    // Animating in or out!
    $(`#decision-wrapper-${decisionId} #${persuasion}`).addClass("vote-selected-btn").velocity({
      width: '93%',
      height: 54
    }, 400, 'spring')
    $(`#decision-wrapper-${decisionId} #decision-${decisionId}-option-${otherPersuasion}`).addClass("vote-rejected-btn").velocity({
      width: '89%',
      height: 48
    }, 400, 'spring')
    $('li#flash-li')[0].innerHTML = "Ay! Good choice!"

  } else if (hasSelected) {
    divFlashMessage.html("AY! You already voted for this!").delay(500).fadeOut(1000, function() {
      $(this).empty().show()
    })
    flashPage()
  } else if (!canVote) {
    divFlashMessage.html("You can't vote on your own post!").delay(500).fadeOut(1000, function() {
      $(this).empty().show()
    })
    flashPage()
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
        $('#limit').velocity({
          height: $(`#show-history`).height()
        },[350,20])
      }
    })
  }
}

function newPostDropdown(event) {
  event.preventDefault()

  if ($('#append-form').html() == "") {

    var titleText = $('#new_from_index')[0].value

    $.ajax({
      url: '/decisions/new',
      type: "GET",
      data: {
        title: titleText
      },
      success: function() {
        $('#limit').velocity({
          height: $(`#append-form`).height()
        },300, 'linear')
      }
    }).done(addSubmit).done(addShading)

    $('#decision_title_submit').animate({  borderSpacing: 90 }, {
      step: function(now,fx) {
        $(this).css('-webkit-transform','rotate('+now+'deg)');
        $(this).css('-moz-transform','rotate('+now+'deg)');
        $(this).css('transform','rotate('+now+'deg)');
        },
        duration: 400
    },'linear')

  } else {
    clearFields()
    removeShading()
  }
}

function createDilemma(event) {
  event.preventDefault()

  var values = $('#new_decision').serialize()

  $.ajax({
    url: '/decisions',
    method: "POST",
    data: values,
    dataType: "script",
    success: function(){
      clearFields()
    }
  }).done(flashNew).done(removeShading)
}

function deleteDecision(event) {
  event.preventDefault()

  var href = event.target.href
  $.ajax({
    url: href,
    method: "DELETE",
    success: removeDecision
  })

}

function removeDecision() {
  debugger
}

function showMore(event) {

  event.preventDefault()

  var lastId = $('article').last()[0].id.replace('decision-','')

  $.ajax({
    url: '/decisions',
    method: "GET",
    data: {
      id: lastId
    },
    dataType: "script"
  })
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

function addSubmit() {
  $("#submit-from-index").on("click", function(event) {
    createDilemma(event)
  })
}

function addShading() {
  $("#new-decision-from-index").addClass("light-shadow")
}

function removeShading() {
  $("#new-decision-from-index").removeClass("light-shadow")
}

function flashNew() {
  $('article').first().velocity({
    backgroundColor: ['#ffffff', '#FFCA90'],
    opacity: 1
  },900, 'ease-in-out')
}

function flashPage() {
  $('body').velocity({
    backgroundColor: ['#F5F8FA', '#ffffff'],
    opacity: [1, 0.8]
  }, 350, 'ease-in-out')
}

function clearFields() {
  $('li#flash-li')[0].innerHTML = ''
  $('#new_from_index')[0].value = ''
  $('#limit').velocity({
    height: 0
  },5)

  $('#append-form')[0].innerHTML = ''

  $('#decision_title_submit').animate({  borderSpacing: -90 }, {
    step: function(now,fx) {
      $(this).css('-webkit-transform','rotate('+now+'deg)');
      $(this).css('-moz-transform','rotate('+now+'deg)');
      $(this).css('transform','rotate('+now+'deg)');
      },
      duration: 480
  },'linear')
}
