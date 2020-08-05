require 'rails_helper'

RSpec.describe AttractionArea, type: :model do
  subject { described_class.new }

  it "is not valid without attributes" do
    #expect(subject).to_not be_valid
    expect(subject.save).to eq false
  end

  it "is not valid without title attribute" do
    subject.area_site = "test"
    subject.thumbnail_img_url = "test/test.png"
    expect(subject.save).to eq false
  end

  it "is not valid without area site attribute" do
    subject.title = "test"
    subject.thumbnail_img_url = "test/test.png"
    expect(subject.save).to eq false
  end

  it "is not valid without thumbnail image url attribute" do
    subject.area_site = "test"
    subject.title = "test/test.png"
    expect(subject.save).to eq false
  end

  it "is not valid without country id attribute" do
    subject.title = "test"
    subject.area_site = "test"
    subject.thumbnail_img_url = "test/test.png"
    expect(subject.save).to eq false
  end

  it "ensure valid with all attributes" do
    country = Country.create(:title => "test")
    subject.title = "test"
    subject.area_site = "test"
    subject.thumbnail_img_url = "test/test.png"
    subject.country = country
    expect(subject.save).to eq true
  end

  it "ensure valid AttractionArea count" do
    country = Country.create(:title => "test")
    (1..10).to_a.each do |i|
      tmp_sub = subject.dup
      tmp_sub.title = "test"
      tmp_sub.area_site = "test"
      tmp_sub.thumbnail_img_url = "test/test.png"
      tmp_sub.country = country
      expect(tmp_sub.save).to eq true
    end
    expect(AttractionArea.count).to eq 10
  end

  it "has many attraction_areas" do
    #should respond_to(:hotels)
    t = AttractionArea.reflect_on_association(:hotels)
    expect(t.macro).to eq(:has_many)
  end

  it "belongs to country" do
    t = AttractionArea.reflect_on_association(:country)
    expect(t.macro).to eq(:belongs_to)
  end

end
