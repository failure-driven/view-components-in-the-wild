class V2UsersController < ApplicationController
  before_action :set_v2_user, only: %i[ show edit update destroy ]

  # GET /v2_users or /v2_users.json
  def index
    @v2_users = V2User.all
  end

  # GET /v2_users/1 or /v2_users/1.json
  def show
  end

  # GET /v2_users/new
  def new
    @v2_user = V2User.new
  end

  # GET /v2_users/1/edit
  def edit
  end

  # POST /v2_users or /v2_users.json
  def create
    sleep(2)
    @v2_user = V2User.new(v2_user_params)

    respond_to do |format|
      if @v2_user.save
        format.html { redirect_to @v2_user, notice: "V2 user was successfully created." }
        format.json { render :show, status: :created, location: @v2_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @v2_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v2_users/1 or /v2_users/1.json
  def update
    respond_to do |format|
      if @v2_user.update(v2_user_params)
        format.html { redirect_to @v2_user, notice: "V2 user was successfully updated." }
        format.json { render :show, status: :ok, location: @v2_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @v2_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v2_users/1 or /v2_users/1.json
  def destroy
    @v2_user.destroy
    respond_to do |format|
      format.html { redirect_to v2_users_url, notice: "V2 user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v2_user
      @v2_user = V2User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def v2_user_params
      params.require(:v2_user).permit(:name, :email, :age, :password)
    end
end
