require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Material management', type: :request do
  # initialize test data
  let!(:subject) {Subject.create!(title:'Chemistry',image:'\chem')}
  let!(:board) {Board.create("title": "ICSE","name": "Indian Certificate of Secondary Education","image":"/icse")}
  let!(:classn) {Classn.create(title:1)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topic) {Topic.create!(name:'Trig',course_id:'1')}

  let!(:mat) {create(:material)}
  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }
  let!(:matstat) {Materialstat.create(user_id:user.id,material_id:mat.id)}
  
  
  describe 'vote' do
    before { post "/v1/course_management/material/vote/#{mat.id}", params:{vote:true},headers: valid_headers[:auth], as: :json}

    it 'votes' do
      expect(json["vote"]).to eq(true)
      expect(response).to have_http_status(200)
    end
  end

  describe 'edit' do
    before { post "/v1/course_management/material/edit/#{mat.id}", params:{notes:"these are some notes"},headers: valid_headers[:auth], as: :json}

    it 'votes' do
      expect(json["notes"]).to eq("these are some notes")
      expect(response).to have_http_status(200)
    end
  end

  describe 'completed' do
    before { post "/v1/course_management/material/done/#{mat.id}", params:{status:true},headers: valid_headers[:auth], as: :json}

    it 'votes' do
      expect(json["status"]).to eq(true)
      expect(response).to have_http_status(200)
    end
  end

  describe 'details' do
    before { get "/v1/course_management/material/stat/#{mat.id}",headers: valid_headers[:auth], as: :json}

    it 'votes' do
      expect(json).to_not be_empty
      expect(response).to have_http_status(200)
    end
  end

end