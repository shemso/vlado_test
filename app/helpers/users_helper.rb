module UsersHelper

	def nice_date(timestamp)
		Time.at(timestamp).to_datetime.strftime('%d. %b %Y %H:%M')
	end
end
