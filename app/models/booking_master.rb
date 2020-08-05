# == Schema Information
#
# Table name: booking_masters
#
#  id                     :bigint           not null, primary key
#  booking_type           :integer
#  check_in_date          :datetime
#  check_out_date         :datetime
#  num_of_adults          :integer
#  num_of_children        :integer
#  addtional_instructions :text
#  hotel_id               :integer
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class BookingMaster < ApplicationRecord

  #Booking will be have one to many relation with user as well as with hotel
  belongs_to :user, :optional => true
  belongs_to :hotel

  # we will call before_save method in the model to check the user exist or not if user not exist we will create and
  #if user exist that booking will be associated to that user
  before_save :create_or_update_user, :if => Proc.new { |obj| obj.new_record? }

 # after_create :send_email, :if => lambda {
#    |obj|
  #  obj.new_user.present?
  #}

  # These are the virtual members of the class as these members not belong to booking model. These mwmbers are belong to
  # user class.
  attr_accessor :name, :email, :new_user, :manual_password

  private

  #This function will be call whenever new user created. we have to send him email with username(email) and password.
  def send_email
    UserMailer.with(:password => self.manual_password, :user_email => self.email).welcome_email.deliver_now
  end

  def create_or_update_user
    user = User.find_by(:email => self.email)
    if user.blank?
      self.manual_password = User.random_password
      new_user = User.create!(:email => self.email,
                              :password => self.manual_password,
                              :password_confirmation => self.manual_password,
                              :name => self.name)

      self.user_id = new_user.id
      self.new_user = true
      self.save
      send_email
    else
      self.user_id = user.id
      self.new_user = false
    end
    return true
  end
end
