class MessagesController < ApplicationController
  #We require mandrill gem for sending email through their system
  require 'mandrill'

  #Get all messages for user
  def inbox
    @messages = current_user.messages.find(:all, :order=>"created_at DESC")
  end

  #Get all message like for inbox, filtering is done in view
  def sent
    @messages = current_user.messages.find(:all, :order=>"created_at DESC")
  end
  
  #Create new message
  def new
    @message = current_user.messages.new
  end

  #Manually create new message and send 
  def send_message
    m = Mandrill::API.new
    #Prepare message object from params
    message = {
      :subject => params[:message][:email_subject],
      :from_name => current_user.profile.full_name, 
      :text=>params[:message][:email_text],
      :to => [
        {
        :email => params[:message][:email_to],
        :name => params[:message][:email_to]
        }
      ],
      :html => params[:message][:email_text],
      :from_email =>current_user.profile.email
    }
    #Set message form data 
    @mess = current_user.messages.new(params[:message])
    @mess.user_id = current_user.id
    @mess.message_type = 1
    @mess.message_status = 2;
    @mess.save
    #Send message using mandril after saving it
    sending = m.messages.send message
    redirect_to '/messages/inbox'
  end

  def reply
    message_id = params[:mid]
    @message = Message.find_by_id(message_id)
    @message.message_status = 2
    @message.save
  end

  def view
  end


end
