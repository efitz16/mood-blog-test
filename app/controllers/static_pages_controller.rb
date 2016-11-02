class StaticPagesController < ApplicationController

  def home
  	#if logged_in?

  	 # @post = @current_user.posts.build


  	#end

    current_user

    binding.pry

  end

end