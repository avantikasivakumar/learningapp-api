require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of(:q) }
  it { should validate_presence_of(:opt1) }
  it { should validate_presence_of(:opt2) }
  it { should validate_presence_of(:opt3) }
  it { should validate_presence_of(:opt4) }
  it { should validate_presence_of(:correctoption) }
  it { should validate_presence_of(:solution) }
  it { should belong_to(:exercise)}
  it { should have_many(:attempt_result).dependent(:destroy) }
end
