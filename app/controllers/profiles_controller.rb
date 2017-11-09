class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    @items = Item.all
    @reviews = Review.all
    session[:conversations] ||= []

  @users = User.all.where.not(id: current_user)
  @conversations = Conversation.includes(:recipient, :messages)
                               .find(session[:conversations])
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    redirect_to edit_profile_url if @profile.nil?
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])
    @conversations = Conversation.includes(:recipient, :messages)
  end


  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_or_initialize_by(user: current_user) if @profile.nil?
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      if params[:id]
      # A particular person’s profile page
      # e.g. /users/5
      @profile = Profile.find_by!(user_id: params[:id])
    else
      # The signed in user’s profile page
      # /profile
      @profile = Profile.find_by(user: current_user)
      end
    end

    def add_to_conversations
  session[:conversations] ||= []
  session[:conversations] << @conversation.id
    end

    def conversated?
      session[:conversations].include?(@conversation.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :about_me, :first_name, :last_name, :username, :user_id, :address, :longitude, :latitude)
    end
end
