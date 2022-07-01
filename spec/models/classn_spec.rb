require 'rails_helper'

RSpec.describe Classn, type: :model do
  it { should validate_presence_of(:title) }
end
