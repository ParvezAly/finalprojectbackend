require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { described_class.new }

  it "is not valid without attributes" do
    #expect(subject).to_not be_valid
    expect(subject.save).to eq false
  end

  it "is not valid without name attribute" do
    subject.email = "test@test.com"
    subject.password = "testing123"
    expect(subject).to_not be_valid
  end

  it "is not valid without email attribute" do
    subject.name = "Umer"
    subject.password = "testing123"
    expect(subject).to_not be_valid
  end

  it "is not valid without password attribute" do
    subject.name = "Umer"
    subject.email = "test@test.com"
    expect(subject).to_not be_valid
  end

  it "ensure email should be valid" do
    non_valid_emails = ["rex", "test@test", "test user@example.com", "test_user@example server.com"]
    non_valid_emails.each do |email|
      subject.name = "Umer"
      subject.password = User.random_password
      subject.email = email
      expect(subject.save).to eq false
    end
  end

  it "ensure valid object" do
    user = User.new
    user.name = "umer"
    user.email = "omerpucit@gmail.com"
    user.password = "tes"
    expect(user.save).to eq true
  end

  it "ensure valid user's count" do
    (1..10).to_a.each do |i|
      user = User.new
      user.email = "omerpucit+#{i}@gmail.com"
      user.name = "umer #{i}"
      user.password = User.random_password
      user.save
    end
    expect(User.count).to eq 10
  end

end
