class TextDateInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:pattern] = '[0-9]*'
    @value = @builder.object.send(attribute_name)
    @merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    "#{date_field} #{month_field} #{year_field}".html_safe
  end
  
  def date_field
    @builder.label(attribute_name, class: 'grouped-date date') do
      output = template.content_tag(:span, 'Date')
      output += @builder.text_field(attribute_name,
                                    @merged_input_options.merge(
                                      name: "#{@builder.object_name}[#{attribute_name}(3i)]",
                                      maxlength: 2,
                                      value: @value&.day
                                    ))
      output
    end
  end
  
  def month_field
    @builder.label(attribute_name, class: 'grouped-date month') do
      output = template.content_tag(:span, 'Month')
      output += @builder.text_field(attribute_name,
                                    @merged_input_options.merge(
                                      name: "#{@builder.object_name}[#{attribute_name}(2i)]",
                                      maxlength: 2,
                                      value: @value&.month
                                    ))
      output
    end
  end
  
  def year_field
    @builder.label(attribute_name, class: 'grouped-date year') do
      output = template.content_tag(:span, 'Year')
      output += @builder.text_field(attribute_name,
                                    @merged_input_options.merge(
                                      name: "#{@builder.object_name}[#{attribute_name}(1i)]",
                                      maxlength: 4,
                                      value: @value&.year
                                    ))
      output
    end
  end
end
