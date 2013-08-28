require 'mail'

class UserMailer < ActionMailer::Base
  def sending(mail) 
  	address = Mail::Address.new 'mafik_94@ukr.net'
		address.display_name = "Naumenko Sergiy"
		address.format 
   	mail(:to => mail[:res], :subject => mail[:subject], :body => mail[:body], from: address)  
  end  
end
