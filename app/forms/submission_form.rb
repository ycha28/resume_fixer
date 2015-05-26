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
      document.update(attributes.last.merge(:submitted => true))
    end
    submission.documents = documents
  end

  def formatted_amount
    submission.amount * 100
  end

  def submission
    @submission ||= user.submissions.build
  end

  def create_submission
    assign_documents
    submission.save      
  end

  def customer
    @customer ||= if user.customer_id.present?
      Stripe::Customer.retrieve(user.customer_id)
    else
      Stripe::Customer.create(email: user.email, card: card)
    end
  end

  def charge
    Stripe::Charge.create(
      customer: customer.id,
      amount: formatted_amount,
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

  def update_customer
    user.update(customer_id: customer.id)
  end

  private

  def persist!
    ActiveRecord::Base.transaction do
      create_submission
      charge
      update_customer unless user.is_customer?
      SubmissionMailer.submit_documents(self).deliver!
    end
  end
end        
