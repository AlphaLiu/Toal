class Cpe < ActiveRecord::Base
	has_many :pefrormancedata
	has_many :logs
	has_many :cpefaults
	has_many :tasks
	has_many :cpeparams
end
