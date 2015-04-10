class SubmissionForm
  include Virtus
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attribute :name, String
  attribute :email, String
  attribute :amount, Integer
  attribute :cover_letter_attributes, Array

  def build_cover_letters
  end

  def build_resumes
  end

  def build_essays
  end

  def save
    binding.pry
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    
  end
end
