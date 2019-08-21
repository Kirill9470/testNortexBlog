class PostObserver < ActiveRecord::Observer
  observe :post

  def after_create post
    add_new_ip_address(post)
  end

  private

  def add_new_ip_address post
    UserService.add_ip_address(post.user, post.ip_addreess)
  end
end