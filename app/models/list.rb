class List < ApplicationRecord
  has_many :documents, dependent: :destroy
  belongs_to :user
end