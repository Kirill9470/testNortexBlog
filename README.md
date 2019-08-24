# README

Конфигурация

* Ruby version = 2.4.1

* Rails version = 5.3.2

* PostgreSql = 11.3

Экшены

1. /users/#{user_id}/posts/new - форма создания поста
2. /users/#{user_id}/posts/#{post_id} - просмотр поста, оттуда производиться оценка
3. /users/#{user_id}/posts/#{post_id}/evaluations(method: :post, params[:evaluation][:value]) - оценка поста
4. /users - список пользователей, присутсвуют кнопки для получения адресов и списка постов со средней оценкой
5. /users/get_posts_top(method: :get, params[:evaluation], params[:limit]) - список N постов со средней оценкой
6. /users/get_ip(method: :post) - получить список апи + массив юзеров

Спеки

По спекам немного не доделал, там просто проверка досутупности url и просто то что экшены возвращают статус 200

Запуск тестов 


* bundle exec rspec


