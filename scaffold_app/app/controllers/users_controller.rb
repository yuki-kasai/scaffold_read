class UsersController < ApplicationController
    # 登録IDのあるユーザーのみ4つのアクションを実行することができる
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # 全てのユーザーの一覧情報
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # １ユーザーの情報一覧
  def show
  end

  # GET /users/new
  # 新規登録
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # 編集
  def edit
  end

  # POST /users
  # POST /users.json
  # １ユーザーの情報一覧を編集
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # 登録IDのあるユーザかどうかを調べる
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :address, :age)
    end
end
