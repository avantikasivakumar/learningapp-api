require 'rails_helper'

RSpec.describe Materialstat, type: :model do
 # it { should validate_presence_of(:status) }
  it { should belong_to(:user) }
  it { should belong_to(:material) }
end
