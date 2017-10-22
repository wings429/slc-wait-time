require 'rails_helper'

RSpec.describe StudentQueuesController, type: :controller do
  describe 'wait time' do
    before(:each) do
      @fake_student_request = double('StudentQueue', :id => 2, :waiting? => true)
      @fake_student_request2 = double('StudentQueue', :id => 3, :waiting? => true)
      #allow(StudentQueue).to receive(:where).and_return(@fake_student_request)
    end
    subject { get 'wait_time', :id => @fake_student_request.id}
    it 'retrieves the students waiting in the queue' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:sorted_results)).to eq(@fake_results)
    end
    it 'finds the correct wait position' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:wait_pos)).to eq(1)
    end
    it 'calculates the correct wait time' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:wait_time)).to eq(30)
    end
  end

  describe 'enter line' do
    before :each do
      @params = {:first_name => 'Athina', :last_name => 'kaunda', :student_sid => '1234', :course => 'math'}
    end
    it 'checks the Student model if the student exists.' do
      expect(Student).to receive(:where).with(:id => '1').and_return([])
      post :create, @params
    end
    it 'creates the student if the student does not exists in the database'
    it 'adds the student to the queue'
  end
end
