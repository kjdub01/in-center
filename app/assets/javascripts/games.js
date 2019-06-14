$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.unassigned').on('click', e => {
    e.preventDefault()
    fetch('/games/unassigned.json')
      .then(res => res.json())
      .then(data => {
        $('#maincontent').html('')
        data.forEach(game => {
          console.log(game)
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
