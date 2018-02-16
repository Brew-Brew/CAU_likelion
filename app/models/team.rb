class Team < ApplicationRecord
  has_many :users
  # after_create :set_seed
  #
  # def set_seed
  #   team=[
  #   [1,1,"2018-01-01"],
  #   [2,2,"2018-01-01"],
  #   [3,3,"2018-01-01"],
  #   [4,4,"2018-01-01"],
  #   ]
  #   team.each do |id,number,study_date|
  #     Team.create(id: id,number: number, study_date: study_date)
  #   end
  # end
end
