require 'rails_helper'

RSpec.describe Part, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number) }
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'returns part by name' do
      i = Inventor.create(name: 'Okay', hire_date: Date.today, speciality: 'software')
      r = Robot.create(name: 'yes', serial_number: '123abc', industry: 'war', inventor_id: i.id)
      p1 = Part.create(name: 'Screw', number: '1', robot_id: r.id)
      p2 = Part.create(name: 'Drillbit', number: '2', robot_id: r.id)
      p3 = Part.create(name: 'Pliers', number: '3', robot_id: r.id)

      by_name = Part.all.by_name
      expect(by_name[0].name).to eq(p2.name)
      expect(by_name[1].name).to eq(p3.name)
      expect(by_name[2].name).to eq(p1.name)
      end
    end
  end

end
