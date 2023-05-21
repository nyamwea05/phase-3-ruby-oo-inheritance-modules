describe Dance do
  let(:dummy_class) { Class.new { include Dance }.new }

  it 'has a #twirl method' do
    expect(dummy_class.twirl).to eq("I'm twirling!")
  end

  it 'has a #jump method' do
    expect(dummy_class.jump).to eq("Look how high I'm jumping!")
  end

  it 'has a #pirouette method' do
    expect(dummy_class.pirouette).to eq("I'm doing a pirouette")
  end

  it 'has a #take_a_bow method' do
    expect(dummy_class.take_a_bow).to eq("Thank you, thank you. It was a pleasure to dance for you all.")
  end
end

require_relative '../lib/dancer'
require_relative '../lib/meta_dancing_module'

describe Dancer do
  let(:dancer) { Dancer.new }

  describe 'class methods' do
    it 'extends the MetaDancing module' do
      expect(Dancer.singleton_class.included_modules).to include(MetaDancing)
    end

    it 'has a metadata method' do
      expect(Dancer.metadata).to eq("This class produces objects that love to dance.")
    end
  end

  describe 'instance methods' do
    it 'includes the Dance module' do
      expect(dancer).to respond_to(:twirl)
      expect(dancer).to respond_to(:jump)
      expect(dancer).to respond_to(:pirouette)
      expect(dancer).to respond_to(:take_a_bow)
    end
  end
end