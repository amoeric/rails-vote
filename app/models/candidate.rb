class Candidate < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
