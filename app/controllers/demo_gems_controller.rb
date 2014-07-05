class DemoGemsController < ApplicationController
  before_action :set_demo_gem, only: [:show, :edit, :update, :destroy]

  # GET /demo_gems
  # GET /demo_gems.json
  def index
    @demo_gems = DemoGem.all
  end

  # GET /demo_gems/1
  # GET /demo_gems/1.json
  def show
  end

  # GET /demo_gems/new
  def new
    @demo_gem = DemoGem.new
  end

  # GET /demo_gems/1/edit
  def edit
  end

  # POST /demo_gems
  # POST /demo_gems.json
  def create
    @demo_gem = DemoGem.new(demo_gem_params)

    respond_to do |format|
      if @demo_gem.save
        format.html { redirect_to @demo_gem, notice: 'Demo gem was successfully created.' }
        format.json { render :show, status: :created, location: @demo_gem }
      else
        format.html { render :new }
        format.json { render json: @demo_gem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demo_gems/1
  # PATCH/PUT /demo_gems/1.json
  def update
    respond_to do |format|
      if @demo_gem.update(demo_gem_params)
        format.html { redirect_to @demo_gem, notice: 'Demo gem was successfully updated.' }
        format.json { render :show, status: :ok, location: @demo_gem }
      else
        format.html { render :edit }
        format.json { render json: @demo_gem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demo_gems/1
  # DELETE /demo_gems/1.json
  def destroy
    @demo_gem.destroy
    respond_to do |format|
      format.html { redirect_to demo_gems_url, notice: 'Demo gem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demo_gem
      @demo_gem = DemoGem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demo_gem_params
      params.require(:demo_gem).permit(:name, :description, :image, :github, :rubygems, :code)
    end
end
