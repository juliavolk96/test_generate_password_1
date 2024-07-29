class PasswordsController < ApplicationController
  def new
    @password = session[:password]
  end

  def generate
    options = {
      case: params[:case_option].to_sym,
      add_non_letter: params[:add_non_letter] == '1',
      password_length: params[:password_length].to_i,
      non_letter_count: params[:non_letter_count].to_i
    }

    generator = PronouncablePasswordGenerator.new(options)
    password = generator.generate

    session[:password] = password
    redirect_to new_password_path
  end
end