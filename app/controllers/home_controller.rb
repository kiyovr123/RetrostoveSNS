class HomeController < ApplicationController
  def top
    @post=Post.first
    @posts=Post.all
  end
end
