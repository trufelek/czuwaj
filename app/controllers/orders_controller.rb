class OrdersController < ApplicationController
	def index
		@finished_orders = Order.where(iscart: 1, user_id: current_user.id)
		@status = OrderStatus.all
	end
	def show
		@order = Order.find_by(id: request.original_url.split("/").last)
		@user = User.find_by(id: @order.user_id)
		@status = OrderStatus.all
		@order_items = OrderItem.where(order_id: request.original_url.split("/").last)
	end
	def update
		@order = Order.find_by(id: params[:id])
		@order.update_attribute(:order_status_id, params[:order][:order_status_id])

	    redirect_to @order
	end
end