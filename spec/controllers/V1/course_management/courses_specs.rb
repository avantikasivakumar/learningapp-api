require 'rails_helper'
include RequestSpecHelper
RSpec.describe 'Course Management' , type: :request do
  # initialize test data
  let!(:board) {Board.create("title": "ICSE","name": "Indian Certificate of Secondary Education","image":"/icse")}
  let!(:classn) {Classn.create(title:1)}

  let!(:subject) {Subject.create!(title:'Chemistry',image:'\chem')}
  let!(:subject2) {Subject.create!(title:'Biology',image:'\b')}
  let!(:subject3) {Subject.create!(title:'Physics',image:'\p')}
  let!(:subject4) {Subject.create!(title:'Math',image:'\math')}
  let!(:subject5) {Subject.create!(title:'Geo',image:'\g')}
  
  let!(:course) {Course.create!(subject_id:subject.id,board_id:board.id,classn_id:classn.id)}
  let!(:course2) {Course.create!(subject_id:subject2.id,board_id:board.id,classn_id:classn.id)}
  let!(:course3) {Course.create!(subject_id:subject3.id,board_id:board.id,classn_id:classn.id)}
  let!(:course4) {Course.create!(subject_id:subject4.id,board_id:board.id,classn_id:classn.id)}
  let!(:course5) {Course.create!(subject_id:subject5.id,board_id:board.id,classn_id:classn.id)}

  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }

  describe 'GET /v1/course_management/courseselection' do
    # make HTTP get request before each example
    before { get '/v1/course_management/courseselection', params:{board_id:board.id,classn_id:classn.id},headers: valid_headers[:auth]}

    it 'enrolls user' do
      cnt=CoursesUser.where("user_id = ?", user.id).count
      expect(cnt).to eq(5)
      expect(response).to have_http_status(204)
    end

  end
end