require 'rails_helper'

RSpec.describe Country, type: :model do
  
  subject { described_class.new }
  
  it "is not valid without attributes" do
    #expect(subject).to_not be_valid
    expect(subject.save).to eq false
  end

  it "ensure valid with all attributes" do
    subject.title = "First Hotel"
    expect(subject.save).to eq true
  end

  it "ensure valid countries count" do
    (1..10).to_a.each do |i|
      tmp_sub = subject.dup
      tmp_sub.title = "First Hotel #{i}"
      expect(tmp_sub.save).to eq true
    end
    expect(Country.count).to eq 10
  end

  it { should have_many(:attraction_areas) }

  it "has many attraction_areas" do
    should respond_to(:attraction_areas)
  end

end