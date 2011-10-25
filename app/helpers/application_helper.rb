module ApplicationHelper

  def error_messages_for( object, title = 'Foram encontrados erros nos seus dados' )
    if object
      render 'compartilhados/erros',
             :title => title,
             :errors => object.errors.full_messages
    end
  end

end
