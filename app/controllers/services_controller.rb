class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def welcome
  end

  def show
  end

  def new
    @service = Service.new
    # COMENTÁRIO: O build inicializa a página com 1 nested já renderizado
    # @stage = @service.stages.build
  end

  def edit
  end

  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to welcome_index_path, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to welcome_index_path, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      # COMENTARIO: Permitir a passagem dos parametros do "stage"
      params.require(:service).permit(:title, :sub_title, :which_is, :who_can_use, :more_info, stages_attributes: [:id, :desc, :duration, :_destroy])
    end
end
