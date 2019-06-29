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

    posting.done(function(data) {
      let id = data.id
      history.pushState(null, null, `/games/${id}`)
      const newGame = new Game(data)
      const htmlToAdd = newGame.formatShow()

      $("#maincontent").html(htmlToAdd)
    })
  })

  $(document).on("click", "#tab_div_games", function(e) {
    $(this).addClass('gamesClicked').removeAttr('id')
    $('#tab_div_user').addClass('userUnclicked').removeAttr('id')
    e.preventDefault()

    getUserGames()
  })

  $(document).on('click', ".date-link", function(e) {
    e.preventDefault()
    //orderDate()
    orderHomeTeam()

  })
}

const orderHomeTeam = () => {
  fetch('/games/unassigned.json')
    .then(res => res.json())
    .then(games => {
      $('#maincontent').html('')
      games.sort(function (a, b) {
        let nameA = a.teams[0].team_name
        let nameB = b.teams[0].team_name
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }

        // names must be equal
        return 0;
      })
      games.forEach(game => {
        let newGame = new Game(game)
        let gameHTML = newGame.formatIndex()
        $('#maincontent').append(gameHTML)
      })
    })
  }

const orderDate = () => {
  fetch('/games/unassigned.json')
    .then(res => res.json())
    .then(games => {
      $('#maincontent').html('')
      games.sort((a, b) => new Date(a.starts_at) - new Date(b.starts_at))
      games.forEach(game => {
        let newGame = new Game(game)
        let gameHTML = newGame.formatIndex()
        $('#maincontent').append(gameHTML)
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
      $('#data_area').html('')
      history.pushState(null, null, `${baseUrl}/games`)
      games.forEach(game => {
        let newGame = new Game(game)
        let newHTML = newGame.formatUserIndex()
        $('#data_area').append(newHTML)
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
  <table class="tableview">
    <tbody>
      <tr>
      <td class="tableheader">Date</td>
      <td class="tableheader">Time</td>
      <td class="tableheader">Home Team</td>
      <td class="tableheader">Away Team</td>
      <td class="tableheader">Appointment</td>
      </tr>
      <tr>
      <td class="listview"><a href="/games/${this.id}" data-id="${this.id}" class="show_link">${this.starts_at.toLocaleDateString()}</td>
      <td class="listview">${this.starts_at.toTimeString().slice(0, 5)}</td>
      <td class="listview">${this.teams[0].team_name}</td>
      <td class="listview">${this.teams[1].team_name}</td>
      <td class="listview">${this.user}</td>
      </tr>
    </tbody>
  </table>

  <h3><a href="/games/unassigned" class="date-link">Date</a></h3>
  `
  return gameHTML
}

Game.prototype.formatShow = function() {
  let gameHTML = `
  <table>
    <tbody>
      <tr>
        <td class="viewtitle">Game:</td>
        <td>${this.starts_at.toLocaleDateString()} ${this.starts_at.toTimeString().slice(0, 5)}</td>
      </tr>
      <tr>
        <td class="viewtitle">Game:</td>
        <td>${this.teams[0].team_name} vs ${this.teams[1].team_name}</td>
      </tr>
      <tr>
        <td class="viewtitle">Venue:</td>
        <td>${this.teams[0].address1}</td>
      </tr>
      <tr>
        <td class="viewtitle">Offical:</td>
        <td>?</td>
      </tr>
    </tbody>
  </table>
    <a href="${this.id}/edit">Edit Game
  `
  //<h3>${this.teams[0].team_name} vs ${this.teams[1].team_name}</h3>
  //<h3>${this.starts_at.toLocaleDateString()} ${this.starts_at.toTimeString().slice(0, 5)}</h3>
  //<h3>Venue: ${this.teams[0].address1}</h3>
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
