class PostObserver < ActiveRecord::Observer #Я не стал убирать наблюдателя так как тут происходит проверка и изменение другой модели
  observe :post

  def after_create(post)
    check_ip_addresses(post)
  end

  private

  def check_ip_addresses(post) #проверка ip адресов
    ip_addresses_array = post.user.ip_addresses.pluck(:value)
    unless ip_addresses_array.include?(post.ip_address) #если ip адрес новый добавляем его в ip_addresses которые принадлежат пользователю
      post.user.ip_addresses.new(value: post.ip_address, login: post.user.login)
      post.user.save
    end
  end
end