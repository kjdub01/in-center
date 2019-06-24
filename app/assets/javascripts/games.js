$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $(document).on('click', "#unassigned", function(e) {
    e.preventDefault()
    history.pushState(null, null, "games/unassigned")
    getGames()
  })

  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()

    let id = ($(this).attr('data-id'))
    history.pushState(null, null, `/games/${id}`)
    $('#maincontent').html('')
    getGameShow(id)
  })

  $(document).on("submit", "#new_game.new_game", function(e) {
    e.preventDefault()

    const values = $(this).serialize()
    const posting = $.post("/games", values)
  //$.post("/games", values).done(function(data) {
    //$('#maincontent').html('')
    posting.done(function(data) {
      let id = data.id
      history.pushState(null, null, `/games/${id}`)
      const newGame = new Game(data)
      const htmlToAdd = newGame.formatShow()
      

      $("#maincontent").html(htmlToAdd)
    })

     //const newGame = new Game(data)
     //const htmlToAdd = newGame.formatShow()

    //$("#maincontent").append(htmlToAdd)
    })
  //})

  $(document).on("click", ".user-games", function(e) {
    e.preventDefault()
    getUserGames()
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

const getGameShow = function(id) {
  fetch(`/games/${id}.json`)
    .then(res => res.json())
    .then(game => {
      let newGame = new Game(game)
      let gameHTML = newGame.formatShow()
      $('#maincontent').append(gameHTML)
    })
}

const getUserGames = () => {
  let baseUrl = window.location
  fetch(`${baseUrl}/games.json`)
    .then(res => res.json())
    .then(games =>  {
      $('#maincontent').html('')
      history.pushState(null, null, `${baseUrl}/games`)
      games.forEach(game => {
        let newGame = new Game(game)
        let newHTML = newGame.formatUserIndex()
        $('#maincontent').append(newHTML)
      })
    })
}

function Game(game) {
  this.id = game.id
  this.starts_at = new Date(game.starts_at)
  this.teams = game.teams
  //this.team1 = game.teams[0].team_name
  //this.team2 = game.teams[1].team_name
  //this.venue = game.teams[0].address1
  this.user = game.user
}

Game.prototype.formatIndex = function() {

  let gameHTML = `
  <h3>Unassigned Matches</h3>
  <table>
    <tbody>
      <tr>
      <td>Date</td>
      <td>Time</td>
      <td>Home Team</td>
      <td>Away Team</td>
      <td>Appointment</td>
      </tr>
      <tr>
      <td><a href="/games/${this.id}" data-id="${this.id}" class="show_link">${this.starts_at.toLocaleDateString()}</td>
      <td>${this.starts_at.toTimeString().slice(0, 5)}</td>
      <td>${this.teams[0].team_name}</td>
      <td>${this.teams[1].team_name}</td>
      <td>${this.user}</td>
      </tr>
    </tbody>
  </table>
  `
//  <h4><a href="/games/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.starts_at}</a></h4>
//  <h4>${this.team1} vs. ${this.team2}</h4>
  //<h4>Venue: ${this.venue}</h4>
  return gameHTML
}

Game.prototype.formatShow = function() {
  let gameHTML = `
    <h3>${this.teams[0].team_name} vs ${this.teams[1].team_name}</h3>
    <h3>${this.starts_at.toLocaleDateString()} ${this.starts_at.toTimeString().slice(0, 5)}</h3>
    <h3>Venue: ${this.teams[0].address1}</h3>
    <h3><a href="${this.id}/edit">Edit Game</h3>
  `
  return gameHTML
}

Game.prototype.formatUserIndex = function() {

  let gameHTML = `
    <table>
      <tbody>
      <tr>
        <td>Date</td>
        <td>Time</td>
        <td>Home Team</td>
        <td>Away Team</td>
        <td>Appointment</td>
      </tr>
      <tr>
        <td>${this.starts_at.toLocaleDateString()}</td>
        <td>${this.starts_at.toTimeString().slice(0, 5)}</td>
        <td>${this.teams[0].team_name}<br>${this.teams[0].address1}</td>
        <td>${this.teams[1].team_name}</td>
        <td>${this.user.name}</td>
      </tr>
      </tbody>
    </table>
  `
  return gameHTML
}
