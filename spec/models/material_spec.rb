require 'rails_helper'

RSpec.describe Material, type: :model do
  it { should validate_presence_of(:file) }
  it { should have_many(:materialstat).dependent(:destroy) }
  it { should belong_to(:topic)}
end
