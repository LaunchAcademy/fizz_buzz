class BreweryMailer < ActionMailer::Base
  default from: 'from@example.com'

  def review_notification(user, review_details)
    @review_details = review_details
    
    mail to: user.email, 
         subject: 'New review posted about your brewery'
  end
end
