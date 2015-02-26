class MagazinesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  def index
    @magazines = Magazine.all
    if user_signed_in?
      @order_item = current_order.order_items.new 
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Magazine was successfully created.' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Magazine was successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine }
      else
        format.html { render :edit }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to magazines_url, notice: 'Magazine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def magazine_params
      params.require(:magazine).permit(:name, :description, :picture, :price, :user_id)
    end
end
