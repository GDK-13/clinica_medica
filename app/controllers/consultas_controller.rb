class ConsultasController < ApplicationController
  before_action :set_consulta, only: %i[ show edit update destroy ]

  # GET /consultas or /consultas.json
  def index
    # 1. KAMINARI (0,5 pontos): Paginação com 5 registros por página.
    # O .includes(:medico, :paciente) otimiza a busca no banco de dados.
    @consultas = Consulta.includes(:medico, :paciente).page(params[:page]).per(5)

    respond_to do |format|
      format.html # Renderiza a tela normal do Rails

      # 2. GERAR CSV (1,0 ponto): Exigência de pelo menos 3 campos
      format.csv do
        require 'csv'
        csv_data = CSV.generate(headers: true) do |csv|
          # Cabeçalho com 4 campos
          csv << ['ID', 'Paciente', 'Medico', 'Data e Hora'] 
          
          # Usamos Consulta.all para garantir que o CSV baixe todas as consultas, não só as da página 1
          Consulta.all.each do |c|
            # Proteção caso alguma consulta esteja sem paciente ou médico associado
            nome_paciente = c.paciente ? c.paciente.nome : 'Não informado'
            nome_medico = c.medico ? c.medico.nome : 'Não informado'
            data_formatada = c.data_hora ? c.data_hora.strftime("%d/%m/%Y %H:%M") : 'Não informada'
            
            csv << [c.id, nome_paciente, nome_medico, data_formatada]
          end
        end
        send_data csv_data, filename: "relatorio_consultas-#{Date.today}.csv"
      end

      # 3. GERAR PDF COM PRAWN (0,5 pontos)
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Listagem de Consultas da Clínica", size: 18, style: :bold, align: :center
        pdf.move_down 20
        
        # Estruturando os dados para a tabela do PDF
        table_data = [["ID", "Paciente", "Médico", "Data/Hora"]]
        
        Consulta.all.each do |c|
          nome_paciente = c.paciente ? c.paciente.nome : '-'
          nome_medico = c.medico ? c.medico.nome : '-'
          data_formatada = c.data_hora ? c.data_hora.strftime("%d/%m/%Y %H:%M") : '-'
          
          table_data << [c.id.to_s, nome_paciente, nome_medico, data_formatada]
        end

        # Desenhando a tabela no PDF (ajustando a largura para 100% e colorindo linhas alternadas)
        pdf.table(table_data, header: true, width: pdf.bounds.width, row_colors: ["F2F2F2", "FFFFFF"])
        
        # disposition: 'inline' faz o PDF abrir no navegador em vez de baixar direto
        send_data pdf.render, filename: 'consultas.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /consultas/1 or /consultas/1.json
  def show
  end

  # GET /consultas/new
  def new
    @consulta = Consulta.new
  end

  # GET /consultas/1/edit
  def edit
  end

  # POST /consultas or /consultas.json
  def create
    @consulta = Consulta.new(consulta_params)

    respond_to do |format|
      if @consulta.save
        format.html { redirect_to @consulta, notice: "Consulta was successfully created." }
        format.json { render :show, status: :created, location: @consulta }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @consulta.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /consultas/1 or /consultas/1.json
  def update
    respond_to do |format|
      if @consulta.update(consulta_params)
        format.html { redirect_to @consulta, notice: "Consulta was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @consulta }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @consulta.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /consultas/1 or /consultas/1.json
  def destroy
    @consulta.destroy!

    respond_to do |format|
      format.html { redirect_to consultas_path, notice: "Consulta was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta
      @consulta = Consulta.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def consulta_params
      params.expect(consulta: [ :medico_id, :paciente_id, :data_hora, :observacoes ])
    end
end
