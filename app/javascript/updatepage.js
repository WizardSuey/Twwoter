// Получаем кнопку лайка и счётчик лайков
const likeButton = document.querySelector('.like-button')
const likeCount = document.querySelector('.like_count')

// Добавляем обработчик события
likeButton.addEventListener('click', (event) => {
  // Останавливаем действие кнопки по умолчанию (перезагрузка страницы)
  event.preventDefault()

  // Выполняем AJAX-запрос на сервер для обновления лайка
  fetch(likeButton.href, { method: 'POST', headers: { 'X-CSRF-Token': '<%= form_authenticity_token %>' } })
    .then(response => response.json()) // Преобразуем ответ в JSON

    .then(data => {
      // Обновляем счётчик лайков
      likeCount.textContent = data.likes_count
    })

    .catch(error => console.error(`Ошибка: ${error}`))
})
