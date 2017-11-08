class ReviewsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def index

  @review = @profile.reviews
 end

  def new
  end

  def create
    @profile = Profile.find(params[:user_id])
   @review = @profile.reviews.build(comment_params)
   @review.user_id = current_user.id
   @review.profile_id = @profile.id

   if @review.save
    flash[:success] = "You commented the hell out of that post!"
       redirect_to user_path(params[:user_id])
  else
    flash[:alert] = "Check the comment form, something went horribly wrong."
     redirect_to user_path(params[:user_id])
   end
  end

  def destroy
   @user= User.find(params[:user_id])
   @review = @user.reviews.find(params[:id])
   @review.destroy
   redirect_to user_path(params[:user_id])
  end

 private
   def comment_params
     params.require(:review).permit(:content)
    #  :user_id, :photo_id
   end

   def set_post
     @user = User.find(params[:user_id])
   end
end
