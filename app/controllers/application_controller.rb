# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def validate_user(obj)
    return if obj.user == current_user
    flash[:alert] = I18n.t('alerts.user_denied', page: obj.model_name.human)
    redirect_to root_path
  end
end
