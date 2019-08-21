require 'rails_helper'

describe "Check get url" do
  it "redirect in new post page" do
    visit "/users"
    expect(page).to have_content "Список пользователей"
  end

  it "redirect in posts page at user" do
    visit "/users/2/posts"
    expect(page).to have_content "Список постов"
  end

  it "redirect in post" do
    visit "/users/2/posts/2001"
    expect(page).to have_content "Просмотр поста"
  end

  it "get ip_addreesses" do
    visit "/users"
    click_button "Получить ip"
    page.status_code.should be 200
  end

end