module ApplicationHelper
  def frontend_config
    {
      current_user_email: current_user.email,
      is_customer: current_user.is_customer?
    }
  end
end
