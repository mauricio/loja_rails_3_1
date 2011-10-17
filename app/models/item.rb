class Item < ActiveRecord::Base

  belongs_to :produto
  belongs_to :pedido

  validates_presence_of :produto_id, :pedido_id, :quantidade
  validates_numericality_of :quantidade, :greater_than => 0, :allow_nil => true

  def incrementar_quantidade(quantidade)
    self.quantidade += quantidade
  end

  def preco_unitario
    self.produto.preco
  end

  def nome
    self.produto.nome
  end

  def preco_total
    self.produto.preco * self.quantidade
  end

end