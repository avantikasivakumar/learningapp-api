require 'rails_helper'

RSpec.describe AttemptResult, type: :model do
  it { should belong_to(:attempt)}
  it {should belong_to(:question)}
end
