class ClientOrder < ActiveRecord::Base
	def index
		@status = OrderStatus.all
	end
end