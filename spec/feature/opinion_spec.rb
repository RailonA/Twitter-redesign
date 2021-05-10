require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
  before :each do
    @user = User.create(username: 'user1', name: 'railon')
    @user2 = User.create(username: 'user2', name: 'ray')
    Opinion.create(author_id: @user2.id, text: 'This is my first post')
  end

  it 'Should create an opinion' do
    visit login_path
    fill_in 'session[username]', with: 'user1'
    click_button 'Log in'
    fill_in 'text', with: 'hello'
    click_button 'Submit new opinion'
    expect(page).to have_content('hello')
  end

  it 'user should see the opinions of another user he follows' do
    visit login_path
    fill_in 'session[username]', with: 'user1'
    click_button 'Log in'
    click_button 'Follow'
    expect(page).to have_content('This is my first post')
  end

  it 'Vote up an opinion' do
    visit login_path
    fill_in 'session[username]', with: 'user2'
    click_button 'Log in'
    click_link 'vote up'
    expect(page).to have_content('Votes:1')
  end
end
