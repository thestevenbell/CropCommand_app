class StrainsController < ApplicationController

  # GET /todos
  # GET /todos.json
  def index
  # @strains = current_user.strains.order(created_at: :desc)
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

def toggle_completed
  @stain.completed = !@todo.completed
  respond_to do |format|
    if @strain.save
      format.html { redirect_to strains_path }
      format.json { render :show, status: :ok, location: @strain }
    else
      # show some error message
    end
  end
end




end
