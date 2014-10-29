
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
  describe "allow_any_instance_of" do 
    context "with return value" do 
      before(:each) do 
        allow_any_instance_of(User).to receive(:gender).and_return('man')
      end
      it { expect(User.new('lisa', 20).gender).to eq('man') }
    end
  end
  
  describe "expect_any_instance_of" do 
    before(:each) do 
      expect_any_instance_of(User).to receive(:age).once.and_return(29)
      #expect_any_instance_of(User).to receive(:age).twice.and_return(10)
    end
    it { expect(User.new('lisa', 40).young?).to be_truthy }
  end
end
