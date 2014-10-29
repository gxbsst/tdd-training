describe Course do
  it { should validate_presence_of(:name) }
  let(:course) { Course.new }
  it { expect(course.valid?).to_not be_truthy }
  it 'be have 1 error on name' do
    # expect(Course.new).to have(1).error_on(:name)
   # expect{Course.create(:name => 'name')}.to change(Course, :count).by(1)
  end
end