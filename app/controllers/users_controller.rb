class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks=current_user.stocks
  end

  def my_friends
    @friends=current_user.friends
  end
  def show
    @user=User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @friends_list=User.search(params[:friend])
      @friends_list=current_user.except_current_user(@friends_list)
      if @friends_list.present?
        render 'users/my_friends'
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to friends_path
      end    
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to friends_path
    end
  end
end

