# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  score       :integer          not null
#  start_level :integer
#  end_level   :integer
#  time        :integer
#  lines       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
