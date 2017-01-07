class WelcomeController < ApplicationController
	  before_action :authenticate, except: [:index, :show]
  def index
  end
end
