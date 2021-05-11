require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:author_id) }
  it { should validate_presence_of(:text) }
  it do
    should validate_length_of(:text).is_at_least(1).on(:create)
  end
end
