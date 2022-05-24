require 'rails_helper'

describe Division do
  it { should have_many(:employees) }
  it { should validate_presence_of :name }
end