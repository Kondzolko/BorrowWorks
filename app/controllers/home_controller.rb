class HomeController < ApplicationController
  # TODO: Need refactoring before the merge with master
  before_action :get_list, only: [:index, :import_list, :import_list_to_db, :create_list]

  def index
  end

  def import_list
    import(params[:document][:file_example])
    flash.now[:success] = "You are added file to List"
    @created_list = List.find(params[:document][:list_id])
  end

  def create_list
    params[:list][:user_id] = current_user.id
    @created_list = List.new(list_params)
    @created_list.save
    flash.now[:success] = 'List was Created'
  end

  def import_list_to_db

  end

  private

  def get_list
    @list = List.all
    @new_list = List.new
  end

  def list_params
    params.require(:list).permit(
        :list_name, :comments, :user_id
    )
  end

  def import(file)
    File.open("#{Rails.root}/public/documents/#{file.original_filename}", "wb") { |f| f.write(params[:document][:file_example].read) }
    spreadsheet = open_spreadsheet(file)
    count_row = 0
    spreadsheet.each do |row|
      count_row += row.count
    end

    body = []
    30.times() do |index|
      body << spreadsheet.row(index) if index > 1
    end
    spreadsheet = { header: spreadsheet.row(1), body: body }
    List.find_by(id: params[:document][:list_id]).documents.new(file_example: [spreadsheet].collect {|x| OpenStruct.new(x).marshal_dump }.to_json, name: file.original_filename,
                                                                               row_count: count_row, file_path: "/public/documents/#{file.original_filename}", updated_at: Time.now, created_at:Time.now).save
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
