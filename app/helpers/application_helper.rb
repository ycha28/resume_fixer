module ApplicationHelper
  def frontend_config
    {
      current_user_email: current_user.email
    }
  end
end
