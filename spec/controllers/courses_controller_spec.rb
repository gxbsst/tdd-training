describe CoursesController do
  describe "POST #create" do

    context "with valid params" do
      before(:each) do
        post :create, course: attributes_for(:course)
      end
      it { expect(Course.count).to eq(1)}
    end

    context "with invalid params" do
      before(:each) do
        post :create, course: attributes_for(:course, name: '')
      end
      it { expect(Course.count).to eq(0)}
      it { expect(response).to render_template :new}
    end
  end

  describe "GET #new" do
   before(:each) do
     get :new
   end
   it { expect(response).to render_template :new }
   it { expect(assigns(:course)).to_not be_nil }
  end

  describe "GET #index" do
    let(:course_1) { create :course }
    let(:course_2) { create :course }
    before(:each) do
      get :index
    end
    it { expect(response).to render_template :index}
    it { expect(assigns(:courses)).to match_array([course_1, course_2])}
  end

  describe "GET #show" do
    let(:course) { create :course }

    context "course is exist" do
      before(:each) do
        get :show, id: course
      end
      it { expect(response).to render_template :show}
      it { expect(assigns(:course)).to eq(course) }
    end

    context "course is not exist" do
      before(:each) do
        get :show, id: 'abc'
      end
      it { expect(response).to  redirect_to courses_path }
      # it { expect(assigns(:course)).to eq(course) }
    end
  end

  describe 'PUT #update' do
    context "with valid params " do
      let(:course) { create :course }
      before(:each) do
        put :update, id: course, course: attributes_for(:course, name: 'test name')
      end
      it { expect(Course.find(course).name).to eq('test name')}
    end

    context "with invalid params " do
      let(:course) { create :course }
      before(:each) do
        put :update, id: course, course: attributes_for(:course, name: '')
      end
      it { expect(response).to render_template :edit }
    end
  end

  describe "GET #edit " do
    let(:course) { create :course }
    before(:each) do
      get :edit, id: course
    end
    it { expect(response).to render_template :edit}
    it { expect(assigns(:course)).to eq(course) }
  end

  describe "DELETE #destory" do
    let(:course) { create :course }
    before(:each) do
      delete :destroy, id: course
    end
    it { expect(response).to  redirect_to courses_path }
    it { expect(Course.count).to eq(0) }
  end
end