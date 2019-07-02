class UsersController < ApplicationController
  before_action:authenticate_user,{only: [:show,:index]}
  before_action:forbid_login_user,{only: [:new]}

  def new
     @user=User.new
  end

  def create
    @user=User.new(name: params[:name],email: params[:email],password: params[:password])
    if @user.save
      session[:user_id]=@user.id
      redirect_to("/users/show/#{@user.id}")
      flash[:notice]="アカウントを作成しました"
    else
      @email=params[:email]
      @name=params[:name]
      @error_message="情報を正しく入力してください"
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def login_form
  end

  def login
    @user=User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/users/show/#{@user.id}")
    else
      @error_message="emailまたはパスワードが間違っています"
      redirect_to("/login")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end

  def index
    @user_list=User.all
  end

end
