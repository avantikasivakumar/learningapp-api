require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Question management', type: :request do
  # initialize test data
  let!(:subject) {Subject.create!(title:'Chemistry',image:'\chem')}
  let!(:board) {Board.create("title": "ICSE","name": "Indian Certificate of Secondary Education","image":"/icse")}
  let!(:classn) {Classn.create(title:1)}
  let!(:course) {Course.create!(subject_id:1,board_id:1,classn_id:1)}
  let!(:topic) {Topic.create!(name:'Trig',course_id:'1')}
  let!(:ex) {Exercise.create!(topic_id:1,name:'trig basics',duration:15)}
  let!(:questions) {create_list(:question,10)}
  #let!(:q) {Question.create!(exercise_id:1,q:'what comes after a?',opt1:'b',opt2:'c',opt3:'d',opt4:'z',correctoption:1,solution:'a b c...')}

  let!(:user) {create(:user)}
  let!(:valid_headers) { auth_headers(user) }
  
  
  describe 'startex POST v1/course_management/exercise/:id' do

    let!(:cnt) {((Attempt.where(user_id: user.id).where(exercise_id: 1).count)+1)}
    let!(:cnt2) {(AttemptResult.all.count) +10}
    # make HTTP get request before each example
    before { get '/v1/course_management/courseselection', params:{board_id:board.id,classn_id:classn.id},headers: valid_headers[:auth]}
    before { post '/v1/course_management/exercise/1', headers: valid_headers[:auth]}

    it 'creates attempt' do
    #  puts json
      expect(cnt).to eq(Attempt.where(user_id: user.id).where(exercise_id: 1).count)
      expect(cnt2).to eq(AttemptResult.all.count)
      expect(response).to have_http_status(204)
    end
  end


  describe 'Valid GET v1/course_management/exercise/:id/questions' do
    
    # make HTTP get request before each example
    before { get '/v1/course_management/courseselection', params:{board_id:board.id,classn_id:classn.id},headers: valid_headers[:auth]}
    before { get '/v1/course_management/exercise/1/questions', params:{page:1}, headers: valid_headers[:auth]}

    it 'returns question 1' do
   #   puts json
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(json[1].size).to eq(6)
      expect(json[1]["q"]).to eq("what comes after a?")
      expect(json[1]["opt1"]).to eq("b")
      expect(json[1]["opt2"]).to eq("c")
      expect(json[1]["opt3"]).to eq("d")
      expect(json[1]["opt4"]).to eq("z")
      # expect(json["question"]["correctoption"]).to eq(1)
      # expect(json["question"]["solution"]).to eq("a b c...")
      expect(response).to have_http_status(200)
    end
  end

  describe 'Choose option POST v1/course_management/question/:id' do
    before { get '/v1/course_management/courseselection', params:{board_id:board.id,classn_id:classn.id}, headers: valid_headers[:auth]}
    before { post '/v1/course_management/exercise/1', headers: valid_headers[:auth]}
    before { post '/v1/course_management/question/1', params:{opt:1,timetaken:29,markedforreview:false}, headers: valid_headers[:auth], as: :json}

    it 'updates attempt result' do
        puts json
        expect(json["result"]).to eq(true)
        expect(json["timetaken"]).to eq(29)
        expect(json["markedforreview"]).to eq(false)
    end
  end

end