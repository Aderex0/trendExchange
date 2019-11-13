class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET PORTFOLIO /users/1
  def portfolio

    @portfolio = User.find(params[:id]).portfolio_valuation

    @test_portfolio = User.find(params[:id]).owned_trends

    render json: @portfolio
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user and @user.authenticate(params[:password])
      render json: { username: @user.username, id: @user.id, account_balance: @user.account_balance, token: issue_token({ id: @user.id })}
    else
      render json: { error: "Username/password combination invalid" }, status: 401
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :account_balance)
    end
end
