require 'rails_helper'

RSpec.describe Inventor, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hire_date) }
    it do
      should validate_inclusion_of(:speciality).
         in_array(['software', 'hardware', 'education', 'mad'])
    end
  end

  describe 'instance methods' do
    describe '#info' do
      it 'returns the software info message with name and hire date' do
        #Setup Code
        inventor = Inventor.create(name: 'person', hire_date: '2016-11-21', speciality: 'software')
        # assertion / expection code
        expect(inventor.info).to eq("Software: person was hired on: 2016-11-21.")
      end

      it 'returns the software info message with name and hire date' do
        #Setup Code
        inventor = Inventor.create(name: 'person', hire_date: '2016-11-21', speciality: 'hardware')
        # assertion / expection code
        expect(inventor.info).to eq("Hardware: person was hired on: 2016-11-21.")
      end

      it 'returns the software info message with name and hire date' do
        #Setup Code
        inventor = Inventor.create(name: 'person', hire_date: '2016-11-21', speciality: 'education')
        # assertion / expection code
        expect(inventor.info).to eq("Education: person was hired on: 2016-11-21.")
      end

      it 'returns the software info message with name and hire date' do
        #Setup Code
        inventor = Inventor.create(name: 'person', hire_date: '2016-11-21', speciality: 'mad')
        # assertion / expection code
        expect(inventor.info).to eq("Mad: person was hired on: 2016-11-21.")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'returns inventors ordered by name' do
      #setup code
      b1 = Inventor.create(name: 'John', speciality: 'education', hire_date: 2016-11-21)
      b2 = Inventor.create(name: 'Aaron', speciality: 'hardware', hire_date: 2016-11-21)
      b3 = Inventor.create(name: 'Jeff', speciality: 'software', hire_date: 2016-11-21)

      # assertion / expection code
      by_name = Inventor.all.by_name
      expect(by_name[0].name).to eq(b2.name)
      expect(by_name[1].name).to eq(b3.name)
      expect(by_name[2].name).to eq(b1.name)
      end
    end
  end

end
