class HomeController < ApplicationController
  require 'mandrill'
  def index
  end
  def test_email_code
    m = Mandrill::API.new
    message = {
      :subject => "Hi there",
      :from_name => "Ninja", 
      :text=>"Hi man how are you?",
      :to => [
        {
        :email => "nedzadk@gmail.com",
        :name => "Nedzad Kulelija"
        }
      ],
      :html => "Hi man how are you?",
      :from_email =>"ninja@watchit4.me"
    }

    sending = m.messages.send message
  end
end
