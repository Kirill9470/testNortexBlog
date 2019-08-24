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

  it "get posts_list" do
    visit "/users"
    fill_in 'evaluation', with: 3
    fill_in 'limit', with: 1000
    click_button "Получить N по средней оценке постов"
    page.status_code.should be 200
  end

  it "get page new post" do
    visit "/users/2/posts/new"
    expect(page).to have_content "Новый пост"
  end

  it "create_new_post" do
    visit "/users/2/posts/new"
    fill_in 'post[title]', with: 'Новый пост'
    fill_in 'post[description]', with: 'Текст нового поста'
    click_button "Create Post"
    page.status_code.should be 200
  end

  it "check validation create new post" do
    visit "/users/2/posts/new"
    fill_in 'post[title]', with: ''
    fill_in 'post[description]', with: ''
    click_button "Create Post"
    page.status_code.should be 422
  end

end