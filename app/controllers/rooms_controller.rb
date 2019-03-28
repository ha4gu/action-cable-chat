class RoomsController < ApplicationController
  before_action :must_be_logged_in, except: [:index]

  include Pagy::Backend

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @pagy, @posts = pagy(@room.posts.order(created_at: :desc), items: 15)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      flash.now.alert = "ルーム作成に失敗しました。"
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      redirect_to room_path(@room)
    else
      flash.now.alert = "ルーム更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def must_be_logged_in
    unless user_signed_in?
      flash.alert = "ログインしてください。"
      redirect_to new_user_session_path
    end
  end
end
