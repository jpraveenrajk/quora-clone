class User < ActiveRecord::Base
  validates :email, presence: true, format: { with: /\w@\w{1}+[.]\w{2}/}, uniqueness: true
  validates :password, presence: true
	has_secure_password

    
end


# assign them a random one and mail it to them, asking them to change it
  # def forgot_password
  #   @user = User.find_by_email(params[:email])
  #   random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  #   @user.password = random_password
  #   @user.save!
  #   Mailer.create_and_deliver_password_change(@user, random_password)
  # end

#   def match_password(login_password="")
#     encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
#   end
# end