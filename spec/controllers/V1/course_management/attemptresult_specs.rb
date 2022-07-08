require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Attempt management', type: :request do
  # initialize test data
  let!(:subject) {create(:subject)}
  let!(:board) {create(:board)}
  let!(:classn) {create(:classn)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topic) {Topic.create!(name:'Trig',course_id:'1')}
  let!(:ex) {Exercise.create!(topic_id:1,name:'basics',duration:15)}
  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }
  let!(:attempt) {Attempt.create!(user_id: user.id, exercise_id: ex.id)}
  let!(:questions) {create_list(:question,10)}


  let!(:attemptres1) {create(:attempt_result, question_id:1, result:true, timetaken:10)}
  let!(:attemptres2) {create(:attempt_result, question_id:2, result:false, timetaken:20)}
  let!(:attemptres3) {create(:attempt_result, question_id:3, result:true, timetaken:20)}
  let!(:attemptres4) {create(:attempt_result, question_id:4, result:true, timetaken:10)}
  let!(:attemptres5) {create(:attempt_result, question_id:5, result:true, timetaken:20)}
  let!(:attemptres6) {create(:attempt_result, question_id:6, result:false, timetaken:10)}
  let!(:attemptres7) {create(:attempt_result, question_id:7, result:true, timetaken:20)}
  let!(:attemptres8) {create(:attempt_result, question_id:8, result:true, timetaken:10)}
  let!(:attemptres9) {create(:attempt_result, question_id:9, result:true, timetaken:10)}
  let!(:attemptres10) {create(:attempt_result, question_id:10, result:false, timetaken:20)}
  
  describe 'summary' do
    before { post "/v1/course_management/exercise/summary/#{attempt.id}", headers: valid_headers[:auth], as: :json}

    it 'returns summary of all questions' do
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe 'results' do
    before { post "/v1/course_management/exercise/results/#{attempt.id}", headers: valid_headers[:auth], as: :json}

    it 'returns results' do
      expect(json.size).to eq(4)
      expect(json["score"]).to eq(7)
      expect(json["accuracy"]).to eq(70)
      expect(json["speed"]).to eq("15.0")
      expect(json["duration"]).to eq(150)
      expect(response).to have_http_status(200)
    end
  end

end