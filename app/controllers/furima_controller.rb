class FurimaController < ApplicationController

  def index
    @furima = Furima.all
  end
end
