# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  status          :integer
#  description     :text
#  employment_type :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Job < ActiveRecord::Base
  enum status: [:active, :inactive]
  enum employment_type: [:full_time, :part_time]

  belongs_to :user
  has_many   :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true

  validates_presence_of :name, :description, :status, :employment_type, :user_id
end
