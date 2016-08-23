module Api
  module V1
    class PagesController < ApplicationBaseController
      before_action :set_page, only: [:show, :edit, :update, :destroy]


      def index
        @pages = Page.all
      end


      def show
      end

      # curl -X POST -F 'page[image]=@stake.png' -F 'page[title]=test' -F 'page[is_favorite]=true' -F 'page[memo]=sample_memo' -F 'page[tags_attributes]=[{name: "Vuejs"},{name: "Vuerouter"}]' -F 'page[domain_attributes]=Hatena' http://localhost:3000/api/v1/pages
      def create
        params[:page][:tags_attributes] = eval(params[:page][:tags_attributes])
        @page = Page.new(page_params)
        params[:page][:tags_attributes].each do |tag|
          if !(Tag.where(name: tag["name"]) == []) then
            @page.tags << Tag.where(name: tag["name"]).first
          else
            @page.tags.new(name: tag["name"])
          end
        end
        if !(Domain.where(name: params[:page][:domain_attributes]) == []) then
          @page.domain << Domain.where(name: params[:page][:domain_attributes]).first
        else
          @page.domain.new(name: params[:page][:domain_attributes])
        end
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
