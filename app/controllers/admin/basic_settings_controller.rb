class Admin::BasicSettingsController < AdminController
  before_action :set_admin_basic_setting, only: [:show, :edit, :update]

  # GET /admin/basic_settings
  # GET /admin/basic_settings.json
  def index
    admin_basic_setting = Admin::BasicSetting.first
    if admin_basic_setting.nil?
      @admin_basic_setting = Admin::BasicSetting.new
      render action: :new
      # redirect_to new_admin_basic_setting_path
    else
      @admin_basic_setting = admin_basic_setting
      render action: :show
      # redirect_to edit_admin_basic_setting_path(admin_basic_setting)
    end
  end

  # GET /admin/basic_settings/1
  # GET /admin/basic_settings/1.json
  def show
  end

  # GET /admin/basic_settings/new
  def new
    if Admin::BasicSetting.first.nil?
      @admin_basic_setting = Admin::BasicSetting.new
    else
      flash[:notice] = 'Basic Setting was already created.'
      redirect_to admin_basic_settings_path
    end
  end

  # GET /admin/basic_settings/1/edit
  def edit
  end

  # POST /admin/basic_settings
  # POST /admin/basic_settings.json
  def create
    @admin_basic_setting = Admin::BasicSetting.new(admin_basic_setting_params)

    respond_to do |format|
      if @admin_basic_setting.save
        format.html { redirect_to @admin_basic_setting, notice: 'Basic setting was successfully created.' }
        format.json { render :show, status: :created, location: @admin_basic_setting }
      else
        format.html { render :new }
        format.json { render json: @admin_basic_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/basic_settings/1
  # PATCH/PUT /admin/basic_settings/1.json
  def update
    respond_to do |format|
      if @admin_basic_setting.update(admin_basic_setting_params)
        format.html { redirect_to @admin_basic_setting, notice: 'Basic setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_basic_setting }
      else
        format.html { render :edit }
        format.json { render json: @admin_basic_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/basic_settings/1
  # DELETE /admin/basic_settings/1.json
  # def destroy
  #   @admin_basic_setting.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admin_basic_settings_url, notice: 'Basic setting was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_basic_setting
    @admin_basic_setting = Admin::BasicSetting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_basic_setting_params
    params.require(:admin_basic_setting).permit(:title, :description)
  end
end
