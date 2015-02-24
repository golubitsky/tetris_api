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

class Game < ActiveRecord::Base
  validates_presence_of :score

  def Game.high_scores(limit = 10)
    Game.order(score: :desc).limit(limit)
  end
end
