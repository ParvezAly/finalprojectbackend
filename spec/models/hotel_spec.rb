require 'rails_helper'

RSpec.describe Hotel, :type => :model do
  subject { described_class.new }
  let(:country) { Country.create(:title => "Pakistan") }
  let(:attraction_area) { 
    AttractionArea.create(:title => "test", :country => country, :area_site => "Hunza", :thumbnail_img_url => ".png")
  }

  it "is not valid without attributes" do
    #expect(subject).to_not be_valid
    expect(subject.save).to eq false
  end

  it "is not valid without name attribute" do
    subject.video_url = "test"
    subject.adult_price = "500"
    subject.child_price = "250"
    subject.attraction_area = attraction_area
    expect(subject.save).to eq false
  end

  it "is not valid without video url attribute" do
    subject.name = "test"
    subject.adult_price = "500"
    subject.child_price = "250"
    subject.attraction_area = attraction_area
    expect(subject.save).to eq false
  end

  it "is not valid without adult price attribute" do
    subject.name = "test"
    subject.video_url = "test"
    subject.child_price = "250"
    subject.attraction_area = attraction_area
    expect(subject.save).to eq false
  end

  it "is valid without child price attribute" do
    subject.name = "test"
    subject.video_url = "test"
    subject.adult_price = "500"
    subject.attraction_area = attraction_area
    expect(subject.save).to eq true
  end

  it "is not valid without attraction area id attribute" do
    subject.name = "test"
    subject.video_url = "test"
    subject.adult_price = "500"
    subject.child_price = "250"
    expect(subject.save).to eq false
  end

  it "ensure valid with all attributes" do
    subject.name = "test"
    subject.video_url = "test"
    subject.adult_price = "500"
    subject.child_price = "250"
    subject.attraction_area = attraction_area
    expect(subject.save).to eq true
  end

  it "ensure valid Hotel count" do
    (1..10).to_a.each do |i|
      tmp_sub = subject.dup
      tmp_sub.name = "test"
      tmp_sub.video_url = "test"
      tmp_sub.adult_price = "500"
      tmp_sub.child_price = "250"
      tmp_sub.attraction_area = attraction_area
      expect(tmp_sub.save).to eq true
    end
    expect(Hotel.count).to eq 10
  end

  it "has many booking_masters" do
    #should respond_to(:hotels)
    t = Hotel.reflect_on_association(:booking_masters)
    expect(t.macro).to eq(:has_many)
  end

  it "belongs to attraction_area" do
    t = Hotel.reflect_on_association(:attraction_area)
    expect(t.macro).to eq(:belongs_to)
  end
end
