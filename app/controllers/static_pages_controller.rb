class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def home
    # change strains_path to lots_path once lots are enabled
    redirect_to strains_path if signed_in?
  end

end
