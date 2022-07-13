class DestroyOtpJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "hi job startinggg"
    puts args
    @user=User.find_by(id:args)
    @user.otp=nil
    @user.otp_generated_at=nil
    @user.save(:validate => false)
  end
end
