class V3UsersController < ApplicationController
  before_action :set_v3_user, only: %i[ show edit update destroy ]

  # GET /v3_users or /v3_users.json
  def index
    @v3_users = V3User.all
  end

  # GET /v3_users/1 or /v3_users/1.json
  def show
  end

  # GET /v3_users/new
  def new
    @v3_user = V3User.new
  end

  # GET /v3_users/1/edit
  def edit
  end

  # POST /v3_users or /v3_users.json
  def create
    @v3_user = V3User.new(v3_user_params)

    respond_to do |format|
      if @v3_user.save
        format.html { redirect_to @v3_user, notice: "V3 user was successfully created." }
        format.json { render :show, status: :created, location: @v3_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @v3_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v3_users/1 or /v3_users/1.json
  def update
    respond_to do |format|
      if @v3_user.update(v3_user_params)
        format.html { redirect_to @v3_user, notice: "V3 user was successfully updated." }
        format.json { render :show, status: :ok, location: @v3_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @v3_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v3_users/1 or /v3_users/1.json
  def destroy
    @v3_user.destroy
    respond_to do |format|
      format.html { redirect_to v3_users_url, notice: "V3 user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v3_user
      @v3_user = V3User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def v3_user_params
      params.require(:v3_user).permit(:name, :email, :age, :password)
    end
end
