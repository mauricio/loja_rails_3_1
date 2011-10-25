class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pedido_atual

  protected

  def pedido_atual

    if @pedido_atual.nil? && !session[:pedido_id].blank?
      @pedido_atual = Pedido.find_by_id(session[:pedido_id])
    end

    @pedido_atual ||= Pedido.new
  end

  def load_page
    @page     = params[:page] || 1
    @per_page = params[:per_page] || 10
  end

  def paginate(scope)
    load_page
    scope.paginate(
        :page     => @page,
        :per_page => @per_page)
  end


end
