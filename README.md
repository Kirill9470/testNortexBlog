# README

Конфигурация

* Ruby version = 2.4.1
* Rails version = 5.3.2
* PostgreSql = 11.3
* имя базы данных - nortex_test_db
* имя пользователя - api_db_user
* пароль - P@ssw0rd

Разворачиваем приложение

* db:create - Создаем базу данных
* db:migrate - Миграции
* db:seed - Запускаем сиды
* bundle exec rspec - Запускам тесты
* rails s - если все зелененькое запускам сервер

Экшены

Для создания нового поста или новой оценки нужно отправлять метод пост для этого ты можешь тригерить
эти экшены через postman или еще что нибудь

1. url для создания поста /posts?post[title]=#{значение}&post[description]=#{значение}&post[authors_login]=#{значение}&post[ip_address]=#{значение}
2. url для оценки поста /evaluations?evaluation[value]=#{значение}&evaluation[post_id]=#{значение}
3. url для получения постов со средней оценкой /posts?evaluation=#{значение}&limit=#{значение}
4. url для получения ip адресов /ip_addresses


