class IncomingController < ApplicationController
  #Mandrill Rails gem for parsing mandrill webhooks, easy way
  include Mandrill::Rails::WebHookProcessor

  def index
    #If parameter mandrill event we start processing post params
    if params['mandrill_events']
      JSON.parse(params['mandrill_events']).each do |bod|
        mess = Mandrill::WebHook::EventDecorator[bod]
        text = mess['msg']['text'].to_s
        mail_to = mess['msg']['email'].to_s
        subject = mess['msg']['subject'].to_s
        from = mess['msg']['from_email'].to_s

        #Find user in our database that this message is meant for 
        prof = Profile.find_by_email(mail_to)

        #If found create message with status 1 (meaning unread)
        if prof
          @message = Message.new
          @message.user_id = prof.user_id
          @message.email_from = from
          @message.email_to = mail_to
          @message.email_text = text
          @message.email_subject = subject
          @message.message_status = 1
          @message.message_type = 1
          @message.save
        end
      end

    end

  end 
end
