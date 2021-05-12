require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:opinions) }
  it { should have_many(:likes) }
  it { should have_many(:followerships) }
  it { should have_many(:inverse_followerships) }
  it { should have_many(:followed_users) }
  it { should have_many(:followers) }
  it { should have_one_attached(:photo) }
  it { should have_one_attached(:cover_image) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:username) }
  it do
    should validate_length_of(:username).is_at_least(1).on(:create)
  end
  it { should validate_presence_of(:name) }
  it do
    should validate_length_of(:name).is_at_least(1).on(:create)
  end
end
