class AdminController < ApplicationController
	before_action :authenticate_admin!, :sideBarTools 

	layout 'admins'

	def sideBarTools
		@current_admin = current_admin
		@pages = Page.all
	end
end
