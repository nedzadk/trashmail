class MessagesController < ApplicationController
  require 'mandrill'
  def index
    @messages = current_user.messages.all
  end

  def new
    @message = current_user.messages.new
  end

  def send_message
    m = Mandrill::API.new
    message = {
      :subject => params[:messages][:mail_subject],
      :from_name => current_user.profile.full_name, 
      :text=>params[:messages][:mail_txt],
      :to => [
        {
        :email => params[:messages][:mail_to],
        :name => params[:messages][:mail_to]
        }
      ],
      :html => params[:messages][:mail_txt],
      :from_email =>current_user.profile.email
    }
    @mess = current_user.messages.new(params[:messages])
    @mess.message_type = 1
    @mess.mail_status = 2;
    @mess.save
    sending = m.messages.send message
    redirect_to :controller=>'messages', :action=>'index'
  
  end

  def reply
  end

  def view
  end


end
