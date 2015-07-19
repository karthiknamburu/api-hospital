require 'rails_helper'

require 'spec_helper'

# RSpec.describe Message, type: :model do
# describe "Messages API" do
#   describe "GET /Message" do
#     it "returns all the Message" do
#       FactoryGirl.create :message, body: "The Lord of the Rings"
#       FactoryGirl.create :message, body: "The Two Towers"

#       get "/messages", {}, { "Accept" => "application/json" }

#       expect(response.status).to eq 200

#       body = JSON.parse(response.body)
#       movie_titles = body.map { |m| m["title"] }

#       expect(movie_titles).to match_array(["The Lord of the Rings",
#                                            "The Two Towers"])
#     end
#   end
# end
# end
