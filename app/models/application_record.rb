class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def update_attributes(attrs = {})
    super parse_dates(attrs)
  end
  
  def parse_dates(attrs)
    # First fetch any nested attributes
    attrs.clone.each do |k, v|
      next unless v.is_a?(Hash)
      # If this is a hash, it's a nested attribute, so check for dates
      attrs = parse_nested_dates(k, attrs)
    end
    # Now marshal the rest of the dates
    marshal_dates(self.class, attrs)
  end
  
  def parse_nested_dates(key, attrs)
    klass = Object.const_get key.split('_attributes').first.classify
    attrs[key] = marshal_dates(klass, attrs[key])
    attrs
  end
  
  def marshal_dates(klass, attrs)
    # Get all the columns in the class that have a date type
    date_columns = klass.columns_hash.select { |_k, value| value.type == :date }.keys
    date_columns.each { |c| attrs = parse_date(attrs, c) }
    attrs
  end
  
  def parse_date(attrs, property)
    # Gather up all the date parts
    keys = attrs.keys.select { |k| k =~ /\A#{property}\([1-3]i\)/ }.sort
    return attrs if keys.empty?
    values = []
    keys.each do |k|
      values << attrs[k]
      attrs.delete(k)
    end
    # Set the date as a standard ISO8601 date
    attrs[property] = values.join('-')
    attrs
  end
end
