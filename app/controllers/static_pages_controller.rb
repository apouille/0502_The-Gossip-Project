class StaticPagesController < ApplicationController
	def team
  end

  def contact
  end

  def index
  	@first_name = params[:id] 
	end
end
