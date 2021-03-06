class StrainsController < ApplicationController
  before_action :signed_in_user
  before_action :set_strain, only: [:toggle_completed, :show, :edit, :update, :destroy]
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /strains
  # GET /strains.json
  def index
  @strains = current_user.strains.order(created_at: :desc)
  end

  # GET /strains/1
  # GET /strains/1.json
  def show
  end

  # GET /strains/new
  def new
    @strain = Strain.new
  end

  # GET /strains/1/edit
  def edit
  end

  # POST /strains
  # POST /strains.json
  def create
    @strain = Strain.new(strain_params)
    @strain.user = current_user       # associate the new strain to the current_user
    respond_to do |format|
      if @strain.save
        format.html { redirect_to strains_path, notice: 'Strain was successfully created.' }
        format.json { render :show, status: :created, location: @strain }
      else
        format.html { render :new }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strains/1
  # PATCH/PUT /strains/1.json
  def update
    respond_to do |format|
      if @strain.update(strain_params)
        format.html { redirect_to strains_path, notice: 'Strain was successfully updated.' }
        format.json { render :show, status: :ok, location: @strain }
      else
        format.html { render :edit }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strains/1
  # DELETE /strains/1.json
  def destroy
    @strain.destroy
    respond_to do |format|
      format.html { redirect_to strains_path, notice: 'Strain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def toggle_completed
  @stain.completed = !@strain.completed
  respond_to do |format|
    if @strain.save
      format.html { redirect_to strains_path }
      format.json { render :show, status: :ok, location: @strain }
    else
      # show some error message
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strain
      @strain = Strain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strain_params
      params.require(:strain).permit(:strain_code, :source_original, :commercial_name, :common_name, :latin_name, :form_received, :date_acquired, :photo_url, :notes, :completed)
    end

    def verify_correct_user
      @strain = current_user.strains.find_by(id: params[:id])
      redirect_to root_url, notice: 'Access Denied!' if @strain.nil?
    end
end
