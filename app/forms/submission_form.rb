class SubmissionForm
  include Virtus
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attribute :name, String
  attribute :email, String
  attribute :amount, Integer
  attribute :cover_letters, Array
  attribute :resumes, Array
  attribute :essays, Array

  def cover_letters_cost
    cover_letters.length * 15
  end

  def resumes_cost
    resumes.length * 10
  end

  def essays_cost
    essays.length * 5
  end

  def total_cost
    cover_letters_cost + resumes_cost + essays_cost
  end

  def save
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
