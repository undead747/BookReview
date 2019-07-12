class ReadsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper
    before_action :require_admin, only:[:new,:create,:edit, :update, :destroy]
  	before_action :find_book, only:[:show, :edit, :update, :destroy]
	before_action :require_login

	  def index
		@id = Book.find_by(id: params[:book_id]).id
		puts ">>>>>>>: #{@id}"
		@book = Book.where(:id => @id).first
		puts ">>>>>>>>>>: #{@book.path_read}"
    end
end
