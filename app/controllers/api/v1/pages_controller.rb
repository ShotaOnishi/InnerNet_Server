module Api
  module V1
    class PagesController < ApplicationBaseController
      before_action :set_page, only: [:show, :edit, :update, :destroy]

      
      def index
        @pages = Page.all
      end


      def show
      end


      def create
        @page = Page.new(page_params)
        respond_to do |format|
          if @page.save
            format.json { render nothing: true, status: :created }
          else
            format.json { render json: @page.errors, status: :bad_request }
          end
        end
      end


      def destroy
        @page.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        def set_page
          @page = Page.find(params[:id])
        end

        def page_params
          params.require(:page).permit(:title, :image, :is_favorite, :memo)
        end
    end
  end
end
