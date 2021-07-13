class PersonsController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @email = current_user.email
    @name = current_user.name
    @bio = current_user.bio
  end

end
