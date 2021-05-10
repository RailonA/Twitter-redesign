require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
  before :each do
    @user = User.create(username: 'user1', name: 'railon')
    @user2 = User.create(username: 'user2', name: 'ray')
    Opinion.create(author_id: @user2.id, text: 'This is my first post')
  end

  it 'user should not see the opinions of another user he does not follow' do
    visit login_path
    fill_in 'session[username]', with: 'user1'
    click_button 'Log in'
    expect(page).to have_no_content('This is my first post')
  end

  it 'should not let you create a new account with the an existing username' do
    visit signup_path
    fill_in 'user[username]', with: 'user1'
    fill_in 'user[name]', with: 'pepe'
    click_button 'Create my account'
    expect(page).to have_content('Username has already been taken')
  end
end
