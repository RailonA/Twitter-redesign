require 'rails_helper'
RSpec.describe Following, type: :model do
  it { should belong_to(:follower) }
  it { should belong_to(:followed) }
  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followed_id) }
end
