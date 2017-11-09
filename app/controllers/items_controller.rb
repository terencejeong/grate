class ItemsController < ApplicationController
  before_action :set_item, only: [:charge, :show, :edit, :update,  :destroy]

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    if params[:search]
  @items = Item.search(params[:search]).order("created_at DESC")
    else
  @items = Item.all.order("created_at DESC")
    end

    session[:conversations] ||= []

  @users = User.all.where.not(id: current_user)
  @conversations = Conversation.includes(:recipient, :messages)
                               .find(session[:conversations])
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @conversations = Conversation.includes(:recipient, :messages)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  #GET /items for user
  def equipment
    @items = Item.where(user_id: params[:user_id])
  end


  def charge

    #amount of item.
    @amount = @item.price*100
    #description of item.
    @description = @item.description

    #situation when the user makes their first purchase.
    if current_user.stripe_id == nil
    customer = StripeTool.create_customer(
    email: params[:stripeEmail],
    stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
    customer_id: customer.id,
    amount: @amount.to_i,
    description: @description
    )
    current_user.stripe_id = customer.id
    current_user.save!()

    @transaction = Transaction.create(user_id: current_user.id, charge_id: charge.id)
    @transaction.save
    email = current_user.email
    contact_name = current_user.profile.first_name
    message = @transaction.charge_id
    # ContactMailer.send_contact_email(email,contact_name, message,).deliver_now
    redirect_to root_path
  else

    #sitiuation when returning user buys an item.

    charge = StripeTool.create_charge(
    customer_id: current_user.stripe_id,
    amount: @amount,
    description: @description
    )

    @transaction = Transaction.create(user_id: current_user.id, charge_id: charge.id)
    @transaction.save
    email = current_user.email
    contact_name = current_user.profile.first_name
    message = @transaction.charge_id
    # ContactMailer.send_contact_email(email,contact_name, message,).deliver_now

    redirect_to root_path
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def add_to_conversations
  session[:conversations] ||= []
  session[:conversations] << @conversation.id
    end

    def conversated?
      session[:conversations].include?(@conversation.id)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :name, :description, :price, :image, :version, :category)
    end
end
