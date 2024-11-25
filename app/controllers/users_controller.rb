class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @stocks=current_user.stocks
  end

  def my_friends
    @friends=current_user.friends
  end
  def show
    @user=User.find(params[:id])
    @stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @friends_list=User.search(params[:friend])
      @friends_list=current_user.except_current_user(@friends_list)
      if @friends_list.present?
         respond_to do |format|            
          format.js { render partial: 'friends_js' }
         end
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

