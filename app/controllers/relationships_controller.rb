class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :require_login
  before_action :find_user
  def new
     @relationship = Relationship.new
  end

  def create
      @relationship = Relationship.new
      @relationship.follower_id = current_user.id
      @relationship.followed_id = @user.id
       if @relationship.save
         flash[:success] = "Thêm follow thành công !"
        redirect_to user_path(@user)
      end
  end

  private

  def find_user
       @user = User.find(params[:user_id])
  end
end
