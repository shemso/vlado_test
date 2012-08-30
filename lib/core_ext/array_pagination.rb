class Array

	@@per = 10

	def per_page(per)
		if !per.nil?
			@@per = per
		end
	end

	def total_pages(per=nil)
		self.per_page(per)
		self.count % @@per > 0 ? ( self.count / @@per ) + 1 : self.count / @@per
	end

	def paginate(page=1,per=nil)
		self.per_page(per)
		offset = ( page.to_i - 1 ) * @@per
		self.slice offset, @@per
	end

end
