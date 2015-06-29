class IncomingController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  def index
    if params['mandrill_events']
      JSON.parse(params['mandrill_events']).each do |bod|
        mess = Mandrill::WebHook::EventDecorator[bod]
        text = mess['msg']['text'].to_s
        mail_to = mess['msg']['email'].to_s
        subject = mess['msg']['subject'].to_s
        from = mess['msg']['from_email'].to_s
       
        #    prof = Profile.find_by_email(:mail_to)
        #    @message = Message.new
        #    @message.user_id = prof.user_id
        #    @message.mail_from = from
        #     @message.mail_to = mail_to
        #    @message.mail_txt = text
        #    @message.subject = subject
        #    @message.save
      end

    end

  end 
end
