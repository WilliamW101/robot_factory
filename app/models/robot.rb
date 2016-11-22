# == Schema Information
#
# Table name: robots
#
#  id            :integer          not null, primary key
#  name          :string
#  serial_number :string
#  evil          :boolean
#  color         :string
#  industry      :string
#  inventor_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Robot < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :inventor
  validates :name, :serial_number, presence: true
  validates :name, :serial_number, uniqueness: true
  validates :industry, inclusion: {
    in: %w(education war service novelty),
    message: "Nope!"
  }, allow_nil: true


  def info
    if industry == 'education'
      "Education: #{name}, #{color}, #{serial_number}, #{industry}."
    elsif industry == 'war'
      "War: #{name}, #{color}, #{serial_number}, #{industry}."
    elsif industry == 'service'
      "Service: #{name}, #{color}, #{serial_number}, #{industry}."
    elsif industry == 'novelty'
      "Novelty: #{name}, #{color}, #{serial_number}, #{industry}."
    end
  end

  def self.by_name
    order(:name)
  end

  private
    def create_serial
      self.serial_number = '5'
    end

end
