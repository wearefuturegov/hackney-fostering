class MainDecorator < Draper::Decorator
  def standard_wrapper(label, value)
    return nil if value.blank?
    h.content_tag(:p, '') do
      h.content_tag(:label, "#{label}: ", class: 'label') <<
        value
    end
  end
  
  def value_from(boolean)
    return if boolean.blank?
    case boolean
    when true
      'Yes'
    when false
      'No'
    else
      'Unknown'
    end
  end
  
  def array_to_list(column)
    column.reject(&:blank?).join(', ')
  end
  
end
