class ProdutosController < ApplicationController

  def index
    @produtos = Produto.all
    respond_to do |format|
      format.html
      format.json do
        render :json => @produtos
      end
    end
  end

  def show
    @produto = Produto.find( params[:id] )
  end

end
