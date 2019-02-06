class UsersController < ApplicationController
	  def page
  	@user = User.find(params["id"])
  end
end
