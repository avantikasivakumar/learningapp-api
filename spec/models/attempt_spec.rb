require 'rails_helper'

RSpec.describe Attempt, type: :model do
  it { should belong_to(:user)}
  it {should belong_to(:exercise)}
  it {should have_many(:attempt_result)}
end
