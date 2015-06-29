class IncomingController < ApplicationController
  def index
    tmp_file = "#{Rails.root}/tmp/incomin_mails.txt"        
    File.open(tmp_file, 'a+') do |f|
      f.write  params[:msg]
    end
  end 
end
