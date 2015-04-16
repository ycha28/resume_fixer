class SubmissionForm
  include Virtus
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attribute :name, String
  attribute :phone_number, String
  attribute :email, String
  attribute :amount, Integer
  attribute :cover_letters, Array
  attribute :resumes, Array
  attribute :essays, Array
  attribute :cover_letter_description, String
  attribute :resume_description, String
  attribute :essay_description, String
  attribute :card, String

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

  def formatted_cost
    total_cost * 100
  end

  def customer
    Stripe::Customer.create(
      email: 'example@stripe.com',
      card: card
    )
  end

  def charge
    Stripe::Charge.create(
      customer: customer.id,
      amount: formatted_cost,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
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
    ActiveRecord::Base.transaction do
      charge
      SubmissionMailer.submit_documents(self).deliver!
    end
  end
end        
