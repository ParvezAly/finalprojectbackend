# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  password_digest        :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  #Validate email and name for login
  validates :name, :presence => true
  validates :email, :presence => true,
    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, :uniqueness => { :case_sensitive => false }
  has_secure_password

  def self.random_password
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    (0...8).map { o[rand(o.length)] }.join
  end

end
