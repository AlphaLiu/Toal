class ParameterController < ApplicationController
	before_action :get_current_cpe

	def get_current_cpe
		@cpe = current_cpe
	end

	def basic
		tr_data = read_from_yaml @cpe	
		data_model_type = check_data_model tr_data
		json_data = case data_model_type
								when "TR181"
									tr_data[:Device][:ManagementServer]
								else
									tr_data
								end
		respond_to do |format|
			format.html
			format.json { render json: json_data}
		end
	end

	#高级配置页面视图
	def advanced
		tr_data = read_from_yaml @cpe	
		respond_to do |format|
			format.html
			format.json { render json: tr_data}
		end
	end

	#创建配置任务，修改CPE的参数
	def create
		@task = Task.new(params)	
		if @task.save
			flash[:notice] = "您已修改了CPE的配置."
			redirect_to :advanced
		else
			flash[:error] = "无法修改CPE配置."
			render :advanced
		end
	end
end
