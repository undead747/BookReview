class HomePagesController < ApplicationController
before_action :require_login, only:[:index]
  def index
    @book = Book.all
  end
end
