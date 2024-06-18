class FriendshipsController < ApplicationController
    def create
        friend=User.find(params[:friend])
        current_user.friendships.build(friend_id: friend.id).save
        redirect_to friends_path
    end

    def destroy
        friend=User.find(params[:id])
        Friendship.where(user_id: current_user.id, friend_id: friend.id).first.destroy
        redirect_to friends_path
    end
end
