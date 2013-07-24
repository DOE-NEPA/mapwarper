class UserObserver < ActiveRecord::Observer

  def after_save(user)
    UserMailer.deliver_reset_password(user) if user.recently_reset_password?
    if user.recently_forgot_password?
      if !user.enabled?
        UserMailer.deliver_disabled_change_password(user)
      else
        UserMailer.deliver_forgot_password(user)
      end
    end
  end
end
