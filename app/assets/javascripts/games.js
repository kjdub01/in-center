$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.user-games').on('click', (e) => {
    e.preventDefault()
    console.log('hello')
  })
}
