class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, @user], notice: t(:create_success)
    else
      render action: 'new'
    end
  end

 # PATCH/PUT /admin/users/1
  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: t(:update_success)
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: t(:delete_success)
  end

  protected
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :phone, :role, :last_sign_in_at, :last_sign_in_ip, :auth_token_expired_at)
    end
end
