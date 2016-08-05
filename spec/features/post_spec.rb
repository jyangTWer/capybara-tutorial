require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    click_button('Create Post')
    expect(page).to have_content('my first post')
    click_link 'Back'
    expect(page).not_to have_content('initialize')
    expect(page).to have_content('start loading...')
    expect(page.find('#content')).to have_content('my first post')
    expect(page.find('.top-10-container')).to have_content('my first post')
  end
end
