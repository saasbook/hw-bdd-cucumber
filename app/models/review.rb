class Review < ActiveRecord::Base
    validates :movie_id, :presence => true
    validates_associated :movie
    belongs_to :movie
    belongs_to :moviegoer
  end