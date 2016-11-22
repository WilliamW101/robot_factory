require 'rails_helper'

RSpec.describe Robot, type: :model do

describe 'validations' do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:serial_number) }
  it do
    should validate_inclusion_of(:industry).
      in_array(['education', 'war', 'service', 'novelty'])
    end
  end

  describe 'instance methods' do
    describe '#info' do
      it 'returns the info message with name, color, serial number, and industry.' do
        #Setup Code
        robot = Robot.create(name: 'robot', color: 'purple', serial_number: '5', industry: 'education')
        # assertion / expection code
        expect(robot.info).to eq("Education: robot, purple, 5, education.")
      end

      it 'returns the info message with name, color, serial number, and industry.' do
        #Setup Code
        robot = Robot.create(name: 'robot', color: 'purple', serial_number: '5', industry: 'war')
        # assertion / expection code
        expect(robot.info).to eq("War: robot, purple, 5, war.")
      end

      it 'returns the info message with name, color, serial number, and industry.' do
        #Setup Code
        robot = Robot.create(name: 'robot', color: 'purple', serial_number: '5', industry: 'service')
        # assertion / expection code
        expect(robot.info).to eq("Service: robot, purple, 5, service.")
      end

      it 'returns the info message with name, color, serial number, and industry.' do
        #Setup Code
        robot = Robot.create(name: 'robot', color: 'purple', serial_number: '5', industry: 'novelty')
        # assertion / expection code
        expect(robot.info).to eq("Novelty: robot, purple, 5, novelty.")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'returns robots in order by name' do
      i = Inventor.create(name: 'Okay', hire_date: Date.today, speciality: 'software')
      r1 = Robot.create(name: 'Screw', serial_number: '1', inventor_id: i.id)
      r2 = Robot.create(name: 'Drillbit', serial_number: '2', inventor_id: i.id)
      r3 = Robot.create(name: 'Pliers', serial_number: '3', inventor_id: i.id)

      by_name = Robot.all.by_name
      expect(by_name[0].name).to eq(r2.name)
      expect(by_name[1].name).to eq(r3.name)
      expect(by_name[2].name).to eq(r1.name)
      end
    end
  end

end
