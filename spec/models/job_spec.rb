require 'rails_helper'

RSpec.describe Job, type: :model do
  it "should be invalid without required parameters" do
    job = Job.new
    expect(job).not_to be_valid
  end
end
