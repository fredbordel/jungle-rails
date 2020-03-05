class Admin::CategoriesController < ApplicationController
  puts ENV["HTTP_ADMIN_USERNAME"]
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USERNAME"], 
                               password: ENV["HTTP_ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
  end
end
