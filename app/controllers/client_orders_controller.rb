class ClientOrdersController < ApplicationController
  before_action :set_client_order, only: [:show, :edit, :update, :destroy]

  def index
    @client_orders = Order.where(iscart: 1)
  end

  def show
  end

  def new

  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
    def set_client_order
      @client_order = Order.find(params[:id])
    end

    def client_order_params
      params[:client_order]
    end
end
