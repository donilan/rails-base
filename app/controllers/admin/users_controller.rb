class Admin::UsersController < AdminController
  before_action :prepare, only: [:edit, :update, :show, :remove_wechat]

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: t(:create_success)}
        format.json { render json: { status: :created } }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: t(:update_success) }
        format.json { render json: { status: :ok } }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_wechat
    wechat = @user.wechats.find(params[:wechat_id])
    wechat.delete
    redirect_to admin_user_path(@user), notice: t(:delete_success)
  end

  protected
  def user_params
    params.require(:user).permit(:username, :phone, :email, :level, :role_id)
  end
  def prepare
    @user = User.find(params[:id])
  end
end
