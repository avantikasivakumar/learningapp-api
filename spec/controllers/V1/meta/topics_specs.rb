require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta topics', type: :request do
  # initialize test data
  let!(:subject) {Subject.create!(title:'Chemistry',image:'\chem')}
  let!(:board) {Board.create("title": "ICSE","name": "Indian Certificate of Secondary Education","image":"/icse")}
  let!(:classn) {Classn.create(title:1)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topics) { create_list(:topic, 10) }

  
  describe 'GET /v1/meta/topics/:id' do
    # make HTTP get request before each example
    before { get '/v1/meta/topics/1' }

    it 'returns topics' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end
end