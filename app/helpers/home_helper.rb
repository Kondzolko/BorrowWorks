module HomeHelper

  def document_name(doc)
    doc.present? ? "#{doc.name} (#{doc.row_count})" : doc.name
  end

  def spreadsheet(doc)
    JSON.parse(doc.file_example)[0]
  end

  def mapped_fields(doc)
    JSON.parse(doc.mapped_field)
  end

  def selected_mapped_field(doc, i)
    m_f = mapped_fields(doc)[(i + 1).to_s]
    m_f.present? ? m_f : ''
  end

  def list_imported_to_db(list)
    list.documents.where(list_id: list.id, status: ['Your file is being processed', 'List successfully uploaded to DB']).count > 0
  end

  def csv_table_html_attr
    { disabled: true, include_blank: true, class: 'selectric', style: 'border:none;background:none; width: 100px;' }
  end

  def states_for_selector
    State.humanize_attr.collect{ |u| [u.values[0],  u.keys[0]]}
  end
end
