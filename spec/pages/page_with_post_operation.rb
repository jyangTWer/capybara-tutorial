module PageWithPostOperation
	include Gizmo::PageMixin

	def valid?
		has_css?('.operation')
	end

	def edit_link
		find('#content').find('tbody').all('tr')[0].find('.operation').find('span:nth-child(2)')
	end

	def get_title
		find('.title').text
	end

	def get_description
		find('.description').text
	end

	def save_edit
		find('.actions').find('input')
	end

	def notice_message
		find('#notice').text
	end

	def back_link
		find('a[href="/posts"]')
	end

	define_action :edit do |new_title, new_content|
		edit_link.click
		fill_in('post_title', with: new_title)
		fill_in('post_content', with: new_content)
		save_edit.click
	end
end