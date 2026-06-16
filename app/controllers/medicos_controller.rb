class MedicosController < ApplicationController
  before_action :set_medico, only: %i[ show edit update destroy ]

  # GET /medicos or /medicos.json
  def index
    if params[:busca].present?
      # busca por nome crm ou especialidade
      @medicos = Medico.where("nome LIKE ? OR crm LIKE ? OR especialidade LIKE ?", "%#{params[:busca]}%", "%#{params[:busca]}%", "%#{params[:busca]}%").page(params[:page]).per(5)
    else
      @medicos = Medico.page(params[:page]).per(5)
    end
  end

  # GET /medicos/1 or /medicos/1.json
  def show
  end

  # GET /medicos/new
  def new
    @medico = Medico.new
  end

  # GET /medicos/1/edit
  def edit
  end
  
  # POST /medicos or /medicos.json
  def create
    @medico = Medico.new(medico_params)

    respond_to do |format|
      if @medico.save
        format.html { redirect_to @medico, notice: "Medico was successfully created." }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @medico.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /medicos/1 or /medicos/1.json
  def update
    respond_to do |format|
      if @medico.update(medico_params)
        format.html { redirect_to @medico, notice: "Medico was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @medico.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /medicos/1 or /medicos/1.json
  def destroy
    @medico.destroy!

    respond_to do |format|
      format.html { redirect_to medicos_path, notice: "Medico was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def medico_params
      params.expect(medico: [ :nome, :crm, :especialidade ])
    end
end
