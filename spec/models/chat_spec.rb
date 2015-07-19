require 'rails_helper'

RSpec.describe Chat, type: :model do

	it "implements Message model" do
    c = Chat.new
    c.user_one_id = 1
    c.user_one_id = 2
    c.save!
  end

end
