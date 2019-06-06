class Document < ApplicationRecord
  belongs_to :list
  validates :file_example, :name, :file_path, presence: true
end