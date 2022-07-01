require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:mobile) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:password)}
  it { should have_and_belong_to_many :course }
end
