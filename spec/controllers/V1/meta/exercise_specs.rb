require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta exercise', type: :request do
  # initialize test data
  let!(:subject) {Subject.create!(title:'Chemistry',image:'\chem')}
  let!(:board) {Board.create("title": "ICSE","name": "Indian Certificate of Secondary Education","image":"/icse")}
  let!(:classn) {Classn.create(title:1)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topic) {Topic.create!(name:'Trig',course_id:'1')}
  let!(:ex) {Exercise.create!(topic_id:1,name:'\mat1.pdf',duration:15)}
  let!(:ex2) {Exercise.create!(topic_id:1,name:'\mat2.mp4',duration:4)}

  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }
  
  describe 'Valid GET /v1/meta/exercise/:id' do
    # make HTTP get request before each example
    before { get '/v1/course_management/courseselection', params:{board_id:board.id,classn_id:classn.id},headers: valid_headers[:auth]}
    before { get '/v1/meta/exercise/1', headers: valid_headers[:auth]}

    it 'returns exercises' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
      expect(response).to have_http_status(200)
    end
  end
end