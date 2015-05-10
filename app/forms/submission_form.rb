class SubmissionForm
  include Virtus
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attribute :user, User
  attribute :documents_attributes, Hash
  attribute :card, String

  def assign_documents
    documents = user.documents.where(id: documents_attributes.keys)
    documents_attributes.each do |attributes|
      document = documents.detect{|document| document.id == attributes.first.to_i}
      document.update(attributes.last.merge('submitted' => true))
    end
    submission.documents = documents
  end

  def total_cost
    cover_letters_cost + resumes_cost + essays_cost
  end

  def formatted_cost
    total_cost * 100
  end

  def submission
    @submission ||= user.submissions.build
  end

  def create_submission
    assign_documents
    submission.save      
  end

  def customer
    Stripe::Customer.create(
      email: user.email,
      card: card
    )
  end

  def charge
    Stripe::Charge.create(
      customer: customer.id,
      amount: submission.amount,
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
      create_submission
      charge
      SubmissionMailer.submit_documents(self).deliver!
    end
  end
end        
