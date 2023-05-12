// Получаем кнопку лайка и счётчик лайков
const likeButton = document.querySelector('.item-button')
console.log(likeButton)

// Добавляем обработчик события
// likeButton.addEventListener('click', (event) => {
//   console.log("1")
  
// })
likeButton.onclick = (event) => {
  console.log(123)
  window.location.reload(true)
}
