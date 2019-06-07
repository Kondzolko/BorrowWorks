class State < ApplicationRecord

  def self.humanize_attr
    fields_for_select = []
    columns.map { |column| fields_for_select << {"#{column.name}": column.name.humanize} unless ['id'].include?(column.name)}
    fields_for_select
  end
end