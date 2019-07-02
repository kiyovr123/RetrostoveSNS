class PostsController < ApplicationController
  before_action:authenticate_user,{only: [:new,:edit]}

  def index
    @post_list=@current_user.get_posts.order(id: :desc)
  end

  def edit
    @edit_post=Post.find_by(id: params[:id])
  end

  def destroy
    @dest_post=Post.find_by(id: params[:id])
    if @dest_post.destroy
      flash[:notice]="投稿を削除しました"
      redirect_to("/users/show/#{@current_user.id}")
    end
  end

  def new
    if params[:image] && params[:thumbnail]
      image=params[:image]
      thumbnail=params[:thumbnail]
      @post=Post.new(user_id: @current_user.id)
      if @post.save
        @temp_id=@post.id.to_s
        File.binwrite("public/photo/image/#{@temp_id}.jpg",image.read)
        File.binwrite("public/photo/thumbnail/#{@temp_id}.jpg",thumbnail.read)
        flash[:notice]="画像を投稿しました"
        redirect_to("/users/show/#{@current_user.id}")  
        end    
    else
      @error_message="画像を設定してください"
      render("/users/login")
    end
  end

end
