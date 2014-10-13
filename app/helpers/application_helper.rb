module ApplicationHelper
	require 'yaml'

	def read_from_yaml cpe
		file_name = "#{cpe.OUICode}_#{cpe.Seirals}.yaml"
		return {} unless file_name.exists?
		YAML.load(File.open(file_name))
	end

	def stored_to_yaml(data, oui, serials_num)
		file_name = "#{oui}_#{serials_num}.yaml"
		File.open("file_name", "w") do |f| 
			YAML.dump(data, f)
		end
	end
end

