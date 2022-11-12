# frozen_string_literal: true

class SessionsView
  def ask_for_username
    puts 'username?'
    gets.chomp
  end

  def ask_for_password
    puts 'password?'
    gets.chomp
  end

  def wrong_credentials
    puts 'Wrong credentials... Try again!'
  end

  def successfull_sign_in(employee)
    puts "Welcome #{employee.username}!"
  end
end
