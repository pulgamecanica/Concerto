module Admins
	class PagesController < AdminController
		before_action :set_page, only: [:edit, :update, :destroy]
		around_action :set_locale
		
		def index
			@page = Page.all	
		end

		def new
			@page = Page.new
		end

		def create
			@page = Page.new(page_params)

			if @page.save
				redirect_to pages_path, notice: "Page created succesfully!"
			else
				render :show
			end
		end

		def update
			if @page.update(page_params)
				redirect_to pages_path, notice: "Page was updated"
			else
				render :edit
			end
		end

		def destroy
			@page.destroy
			redirect_to pages_url, notice: "Page was succesfully destroyed"
		end

		def set_locale
			I18n.with_locale(params[:locale] || I18n.default_locale) {
				yield
			}
		end
		private

			def set_page
					@page = Page.find(params[:id])
			end

			def page_params
				params.require(:page).permit(:title_en, :title_es, :title_fr, :description_en, :description_es, :description_fr, :display)
			end
	end
end
