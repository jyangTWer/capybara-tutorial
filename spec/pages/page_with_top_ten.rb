module PageWithTopTen
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .right')
	end

	def first_top
		find('.top-10-list').find('li:first-child').text
	end

	def posts_in_top_10
		find('.parent').find('.right').find('.top-10-container').find('.top-10-list').all('li')
	end
end