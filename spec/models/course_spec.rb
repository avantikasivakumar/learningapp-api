require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to(:subject) }
  it { should belong_to(:classn) }
  it { should belong_to(:board) }
  it { should have_and_belong_to_many :user }
end
