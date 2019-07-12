class Follow1sController < ApplicationController
  include SessionsHelper
  before_action :require_login
  before_action :find_user
  def new
     @relationship = Follow1.new
  end

  def create
       logic = true
       if current_user.id == @user.id
        flash[:danger] = "Bạn không thể follow chính mình được :(( !"
        redirect_to user_path(@user)
      else
      @relationship = Follow1.new
      @relationship.user_id = current_user.id
      @relationship.follow_user_id = @user.id
      @same = Follow1.where(:user_id => current_user.id).order("created_at DESC")
      @same.all.each do |same1|
         if same1.follow_user_id == @user.id
           logic = false
         end
      end

       if logic == false
         flash[:danger] = "Bạn đã follow bạn này rồi :) !"
         redirect_to user_path(@user)
      else
          @relationship.save
         flash[:success] = "Thêm follow thành công !"
        redirect_to user_path(@user)
      end
    end
  end
 def destroy
   @same = Follow1.find(params[:id])
   @same.destroy
  redirect_to user_path(current_user)
 end

 end
  private

  def find_user
       @user = User.find(params[:user_id])
  end
