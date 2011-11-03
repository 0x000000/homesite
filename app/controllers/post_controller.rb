class PostController < ApplicationController
  def show
    @post = Entry.find_by_url!('/post/' + params[:name])
  end

end
