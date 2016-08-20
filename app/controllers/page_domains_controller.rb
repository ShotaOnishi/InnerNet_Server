class PageDomainsController < ApplicationController
  before_action :set_page_domain, only: [:show, :edit, :update, :destroy]

  # GET /page_domains
  # GET /page_domains.json
  def index
    @page_domains = PageDomain.all
  end

  # GET /page_domains/1
  # GET /page_domains/1.json
  def show
  end

  # GET /page_domains/new
  def new
    @page_domain = PageDomain.new
  end

  # GET /page_domains/1/edit
  def edit
  end

  # POST /page_domains
  # POST /page_domains.json
  def create
    @page_domain = PageDomain.new(page_domain_params)

    respond_to do |format|
      if @page_domain.save
        format.html { redirect_to @page_domain, notice: 'Page domain was successfully created.' }
        format.json { render :show, status: :created, location: @page_domain }
      else
        format.html { render :new }
        format.json { render json: @page_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_domains/1
  # PATCH/PUT /page_domains/1.json
  def update
    respond_to do |format|
      if @page_domain.update(page_domain_params)
        format.html { redirect_to @page_domain, notice: 'Page domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_domain }
      else
        format.html { render :edit }
        format.json { render json: @page_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_domains/1
  # DELETE /page_domains/1.json
  def destroy
    @page_domain.destroy
    respond_to do |format|
      format.html { redirect_to page_domains_url, notice: 'Page domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_domain
      @page_domain = PageDomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_domain_params
      params.require(:page_domain).permit(:page_id, :domain_id)
    end
end
