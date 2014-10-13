class SoapController < ApplicationController

	soap_action "inform",
							args: :hash
							return: :string

	def inform
		render soap: ""	if params.empty? #空inform
		#参数更新
		stored_to_yaml(params,params[:DeviceID][:OUI], params[:DeviceID][:SerialNumber])
		render soap :max_envloap
	end
end
