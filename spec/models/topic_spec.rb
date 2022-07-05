require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should belong_to(:course) }
  it { should validate_presence_of(:name) }
end
