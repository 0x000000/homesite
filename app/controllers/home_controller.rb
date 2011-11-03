class HomeController < ApplicationController
  def index
    @stream = Entry.for_stream
  end

end
