module ApplicationHelper

  def error_messages_for( object, title = 'Foram encontrados erros nos seus dados' )
    if object && !object.errors.blank?
      render 'compartilhados/erros',
             :title => title,
             :errors => object.errors.full_messages
    end
  end

  def cabecalho_de_tabela( *nomes )

     colunas = nomes.map { |nome| "<th>#{nome}</th>" }

     linha = content_tag( :tr, colunas.join("\n").html_safe )

     content_tag( :thead, linha ).html_safe

   end


end
