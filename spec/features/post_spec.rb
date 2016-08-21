require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.new_post_link.click
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        page.create_post_button.click
        expect(page.notice_message).to eq('Post was successfully created.')
        page.back_link.click
        expect(page.posts_in_list.length).to eq(1)
    end

    on_page_with :post_operation do |page|
        page.perform :edit, 'my changed post title', 'my changed post description'
        expect(page.notice_message).to eq('Post was successfully updated.')
        expect(page.get_title).to eq("Title: my changed post title")
        expect(page.get_description).to eq("Content: my changed post description")
        page.back_link.click
    end

    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(1)
    end

    on_page_with :top_ten do |page|
        expect(page).not_to have_content('initialize')
        expect(page).to have_content('start loading...')
        expect(page.posts_in_top_10.length).to eq(1)
        expect(page.first_top).to eq("my changed post title")
    end
  end
end
