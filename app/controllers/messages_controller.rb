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
      :subject => params[:messages][:subject],
      :from_name => current_user.profile.full_name, 
      :text=>params[:messages][:txt],
      :to => [
        {
        :email => params[:messages][:to],
        :name => params[:messages][:to]
        }
      ],
      :html => params[:messages][:txt],
      :from_email =>current_user.profile.email
    }
    sending = m.messages.send message
    @mess = current_user.messages.new(params[:messages])
    @mess.message_type = 1
    @mess.status = 2;
    @mess.save
    redirect_to :controller=>'messages', :action=>'index'
  
  end

  def reply
  end

  def view
  end


end
