$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.unassigned').on('click', e => {
    e.preventDefault()
    history.pushState(null, null, "games/unassigned")
    getGames ()
  })

  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()
    $('#maincontent').html('')
    let id = ($(this).attr('data-id'))
    fetch(`/games/${id}.json`)
      .then(res => res.json())
      .then(game => {
        let newGame = new Game(game)
        let gameHTML = newGame.formatShow()
        $('#maincontent').append(gameHTML)
      })
  })

  $('#new_game').on('submit', function(e) {
    e.preventDefault()

    const values = $(this).serialize()

    $.post("/games", values).done(function(data) {
      $('#maincontent').html('')
      const newGame = new Game(data)
      const htmlToAdd = newGame.formatShow()
      $('#maincontent').html(htmlToAdd)
    })
  })
}

const getGames = () => {
  fetch('/games/unassigned.json')
    .then(res => res.json())
    .then(games => {
      $('#maincontent').html('')
      games.forEach(game => {
        let newGame = new Game(game)
        let gameHTML = newGame.formatIndex()
        $('#maincontent').append(gameHTML)
      })
    })
}

function Game(game) {
  this.id = game.id
  this.starts_at = game.starts_at
  this.teams = game.teams
  this.user = game.user
}

Game.prototype.formatIndex = function() {
  let gameHTML = `
    <a href="/games/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.starts_at}</h1>
  `
  return gameHTML
}

Game.prototype.formatShow = function() {
  let gameHTML = `
    <h1>${this.id}</h1>
  `
  return gameHTML
}
