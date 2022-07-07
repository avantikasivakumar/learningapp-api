require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Attempt management', type: :request do
  # initialize test data
  let!(:subject) {create(:subject)}
  let!(:board) {create(:board)}
  let!(:classn) {create(:class)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topic) {Topic.create!(name:'Trig',course_id:'1')}
  let!(:ex) {Exercise.create!(topic_id:1,name:'basics',duration:15)}
  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }
  let!(:attempt) {Attempt.create!(user_id: user.id, exercise_id: ex.id)}
  let!(:attemptres) {create_list(:attemptresult, 10)}
  
  
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

end