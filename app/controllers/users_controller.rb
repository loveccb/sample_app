class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def new
    if signed_in? #signed in users should be redirected to user
      redirect_to root_url    
    else
  	 @user = User.new
    end
  end
  def create
    if signed_in? #signed in users should be redirected to user
      redirect_to root_url    
    else
    	@user = User.new(params[:user])
    	if @user.save
        sign_in @user
    		flash[:success] = "Welcome to the Sample App"
    		redirect_to @user
    	else 
    		render "new"
    	end	 
    end
  end

  def edit    
  end

  def update   
    if @user.update_attributes(params[:user])
     flash[:success] = "Profile updated"
     sign_in @user
     redirect_to @user
    else 
      render 'edit'
    end
  end

  def destroy
<<<<<<< HEAD
    if !current_user.admin?
      User.find(params[:id]).destroy   
      flash[:success] = "User destroyed."
      redirect_to users_url
    else 
      redirect_to users_url, notice: "Can't delete an admin."
    end
=======
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
>>>>>>> user-microposts
  end

  private   

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end