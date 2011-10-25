# encoding: utf-8
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  def get_error_text(field)
    self.object && self.object.errors[field].first
  end

  def content_tag(*args)
    @template.content_tag(*args).html_safe
  end

  def render_label(field, title)
    label(title.blank? ? self.object.class.human_attribute_name(field) : title)
  end

  basic_helpers = %w{text_field text_area select password_field file_field}

  basic_helpers.each do |name|

    define_method(name) do |field, *args|
      options = args.last.is_a?(Hash) ? args.last : {}

      label      = render_label(field, options[:label])
      error_text = get_error_text(field)

      wrap_field(label, super(field, *args), error_text, options)
    end

  end

  multipart_helpers = %w{date_select datetime_select}

  multipart_helpers.each do |name|
    define_method(name) do |field, *args|
      options = args.last.is_a?(Hash) ? args.last : {}

      label = render_label(field, options[:label])

      error_text = get_error_text(object, field)

      wrap_multipart_field(label, super(field, *args), error_text)
    end
  end

  def wrap_field(label, content, error_text)

    wrapper_class = ['clearfix']
    unless error_text.blank?
      wrapper_class << 'error'
    end

    result = [content]

    unless error_text.blank?
      result << content_tag(:span, error_text, :class => 'help-inline')
    end

    result = result.join(' ').html_safe

    @template.content_tag(:div, label + content_tag(:div, result, :class => 'input'), :class => wrapper_class.join(' '))
  end

  def wrap_multipart_field(label, content, error_text)

    wrapper_class = ['clearfix']
    unless error_text.blank?
      wrapper_class << 'error'
    end

    result = [content]

    unless error_text.blank?
      result << content_tag(:span, error_text, :class => 'help-inline')
    end

    result = content_tag(:div, result.join(' ').html_safe, :class => 'inline-inputs')

    @template.content_tag(:div, label + content_tag(:div, result, :class => 'input'), :class => wrapper_class.join(' '))
  end

  def primary_submit(label)
    self.submit(label, :class => 'btn large primary')
  end

end