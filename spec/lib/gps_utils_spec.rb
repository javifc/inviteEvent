require 'spec_helper'

shared_examples 'gps' do


    subject  { described_class.new({}) }

  describe "Check Methods" do

    it "should have longitude" do
      subject.longitude = '52.01'
      expect(subject.longitude).to eq('52.01')
    end

    it "should have latitude" do
      subject.latitude = '52.01'
      expect(subject.latitude).to eq('52.01')
    end

    it "should have calculate_distance_to" do
      expect(subject).to respond_to(:calculate_distance_to) 
    end
    
    it "should raise an exception when passing a wrong unit is passed to calculate_distance_to" do
      subject.longitude = '52.01'
      subject.latitude = '52.01'
      expect { raise subject.calculate_distance_to('52.01','52.01',:WrongUnit) }.to raise_error.with_message(/WrongUnit is a not a valid unit./)      
    end
  end

  describe "calculate_distance_to logic" do

    it "should return 0km when passing the same coordenates from and to" do
      subject.latitude = '52.01'
      subject.longitude = '52.01'
      distance = subject.calculate_distance_to('52.01','52.01', :kms )
      expect(distance).to be 0.0
    end

    it "should return 1km (rounded) when passing two coordenates which are 1km away from each other" do
      # It is difficult to get 2 coordenates which are exactly 1km from each other, so i will round the distance for the sake of the tests
      subject.latitude = '53.339428'
      subject.longitude = '-6.257664'
      distance = subject.calculate_distance_to('53.349222','-6.260247', :kms)
      expect(distance.round).to be 1
    end
  end
    
end