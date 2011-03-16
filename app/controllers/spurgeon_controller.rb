class SpurgeonController < ApplicationController

  def show
    s = Spurgeon.new( params[:type] )
    @content = s.fetch
  end

end
