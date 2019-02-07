class GossipsController < ApplicationController

  def index
    @gossip_all= Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end
#/ exo 2.2.1 Hot Gossip 
#/ on attribue un numéro à chaque instance de Gossip

  def new 
  	@gossip = Gossip.new
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.all.sample.id)
    if @gossip.save
      flash[:notice] = "Vous avez crée un potin avec succès"
      redirect_to root_path
    else
      render "new"
    end

    @gossip = Gossip.create(params[:id])
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
      render new
    end
end

	def update
	  @gossip = Gossip.find(params[:id])
	  gossip_params = params.permit(:title, :content)
	  if @gossip.update(gossip_params)
	    redirect_to @gossip
	  else
	    render :edit
	  end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
    puts "*"*50
    puts @gossip.id
    puts "*"*50   
		@gossip.destroy


		# if gossip.destroy
      flash[:notice] = "Vous avez supprimé un potin avec succès"
    # else
		redirect_to root_path
	end

end