class Submission < ActiveRecord::Base
  belongs_to :user
  has_many :documents
  accepts_nested_attributes_for :documents

  before_create :set_total_amount

  private

  def set_total_amount
    self.amount = documents.map(&:price).sum
  end
end