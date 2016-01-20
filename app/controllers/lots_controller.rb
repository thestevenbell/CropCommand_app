class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]



  # GET /lots
  # GET /lots.json
  def index
    @code = Strain.find_by(params[:strain_code_id]).strain_code
    @lots = current_user.lots.order(created_at: :desc)
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
    @code = Strain.find_by(params[:strain_code_id]).strain_code
  end


  # GET /lots/new
  def new
    @lot = Lot.new
  end

  # GET /lots/1/edit
  def edit

  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)

    @lot.user = current_user

    respond_to do |format|
      if @lot.save
        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render :show, status: :created, location: @lot }
      else
        format.html { render :new }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url, notice: 'Lot was successfully deleted.' }
      format.json { head :no_content }
    end
  end


def toggle_active
  @lot.active = !@lot.active
  respond_to do |format|
    if @strain.save
      format.html { redirect_to lots_path }
      format.json { render :show, status: :ok, location: @lot }
    else
      # show some error message
    end
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:lot_code, :event_made, :event_shake, :event_chill, :event_remove, :cycle_weeks, :units_type, :units_number, :active, :strain_id, :strain_code_id, :user_id)
    end

    def verify_correct_user
      @lot = current_user.lots.find_by(id: params[:id])
      redirect_to root_url, notice: 'Access Denied!' if @lot.nil?
    end

end



