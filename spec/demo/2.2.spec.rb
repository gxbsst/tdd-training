class User
 attr_accessor :name, :age

 def initialize(name, age)
   @name = name
   @age = age
 end

 def young?
  if self.age < 30
    true
  else
    false
  end
 end
end

describe "Rsepc Methods" do 

  context "use let" do 
    let(:jim) { User.new('jim', 18) }
    it { expect(jim.name).to eq('jim') }
    it { expect(jim.age).to eq(18) }
  end

  context "use before" do 
    before(:each) do 
      @tom = User.new('tom', 20)
    end
    it { expect(@tom.name).to eq('tom') }
    it { expect(@tom.age).to eq(20) }
  end

  describe "allow" do
    context "without return value" do 
      before(:each) do 
        allow(User).to receive(:count)
      end

      it { expect(User.count).to eq(nil) }
    end

    context "with return value" do 
      before(:each) do 
        allow(User).to receive(:count).and_return(1)
      end

      it { expect(User.count).to eq(1) }
    end
  end

  describe "allow_any_instance_of" do 
    context "without return value" do 
      before(:each) do 
        allow_any_instance_of(User).to receive(:gender)
      end
      it { expect(User.new('lisa', 20).gender).to eq(nil) }
    end

    context "with return value" do 
      before(:each) do 
        allow_any_instance_of(User).to receive(:gender).and_return('man')
      end
      it { expect(User.new('lisa', 20).gender).to eq('man') }
    end
  end

  describe "expect_any_instance_of" do 
    before(:each) do 
      expect_any_instance_of(User).to receive(:age).once.and_return(10)
      #expect_any_instance_of(User).to receive(:age).twice.and_return(10)
    end
    it { expect(User.new('lisa', 40).young?).to be_truthy }
  end

  describe "is_expected" do 
    subject(:jim) { User.new('jim', 40) }
    it { is_expected.to be_a(User) }
  end

  describe "receive_message_chain" do 
    let(:you) { User.new('you', 20) }
    before(:each) do 
     allow(you).to  receive_message_chain(:father, :wife, :son => 'you')
    end

    it { expect(you.father.wife.son).to eq('you') }
  end
end
