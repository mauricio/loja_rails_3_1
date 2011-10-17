class Pedido < ActiveRecord::Base

  has_many :itens
  has_many :produtos, :through => :items

  def adicionar_produto(produto, quantidade)

    if item = self.itens.detect { |elemento| elemento.produto == produto }
      item.incrementar_quantidate(quantidade)
      item.save
    else
      self.itens.create(:produto => produto, :quantidade => quantidade)
    end

  end

  def preco_total
    self.itens.inject( 0 ) do |accumulated, item|
      accumulated + item.preco_total
    end
  end

end