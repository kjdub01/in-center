$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.unassigned').on('click', e => {
    e.preventDefault()
    history.pushState(null, null, "games/unassigned")
    fetch('/games/unassigned.json')
      .then(res => res.json())
      .then(data => {
        $('#maincontent').html('')
        data.forEach(game => {
          let newGame = new Game(game)
          let gameHTML = newGame.formatIndex()
          $('#maincontent').append(gameHTML)
        })
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
    <h1>${this.user}</h1>
  `
  return gameHTML
}
