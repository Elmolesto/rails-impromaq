class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :edit, :update, :destroy]

  # GET /gastos
  # GET /gastos.json
  def index
    @gastos = Gasto.all
  end

  def gastosunasigned
    @gastos = Gasto.where(estado: [nil, ''])
  end

  def gastoslcarend
    # @gastos = Gasto.where("rend < ?", Gasto.maximum(:rend))
    @max = Gasto.where(cc: [ "ADM", "ENV", "SER", "CMEC", "TRANS", "NGP", "H09"]).maximum("rend")
    @gastos = Gasto.where(cc: [ "ADM", "ENV", "SER", "CMEC", "TRANS", "NGP", "H09"]).where(rend: @max)
  end

  def gastosvtsrend
    @max = Gasto.where(cc: "VTS").maximum("rend")
    @gastos = Gasto.where(cc: "VTS").where(rend: @max)
  end

  def gastosptmrend
    @max = Gasto.where(cc: "PTM").maximum("rend")
    @gastos = Gasto.where(cc: "PTM").where(rend: @max)
  end


  def gastoslca
    @gastos = Gasto.where(cc: [ "ADM", "ENV", "SER", "CMEC", "TRANS", "NGP", "H09"])
  end

  def gastoslcapend
    @gastos = Gasto.where(cc: [ "ADM", "ENV", "SER", "CMEC", "TRANS", "NGP", "H09"]).where(estado: "Pendiente")
  end

  def gastoslcapagado
    @gastos = Gasto.where(cc: [ "ADM", "ENV", "SER", "CMEC", "TRANS", "NGP", "H09"]).where(estado: "Pagado")
  end

  def gastosvts
    @gastos = Gasto.where(cc: 'VTS')
  end

  def gastosvtspend
    @gastos = Gasto.where(cc: 'VTS').where(estado: "Pendiente")
  end

  def gastosvtspagado
    @gastos = Gasto.where(cc: 'VTS').where(estado: "Pagado")
  end

  def gastosptm
    @gastos = Gasto.where(cc: 'PTM')
  end

  def gastosptmpend
    @gastos = Gasto.where(cc: 'PTM').where(estado: "Pendiente")
  end

  def gastosptmpagado
    @gastos = Gasto.where(cc: 'PTM').where(estado: "Pagado")
  end

  def import
    Gasto.my_import(params[:file])
    redirect_to gastos_url, notice: 'Facturas correctamente importadas'
  end

  def dup
    @gasto = Gasto.find(params["format"].to_i).dup
    render :new
  end

  # GET /gastos/1
  # GET /gastos/1.json
  def show; end

  # GET /gastos/new
  def new
    @gasto = Gasto.new
  end

  # GET /gastos/1/edit
  def edit; end

  # POST /gastos
  # POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)

    respond_to do |format|
      if @gasto.save
        format.html { redirect_to gastos_url, notice: 'El registro ha sido creado.' }
        # format.html { redirect_to @gasto, notice: 'Gasto creado con exito' }
        format.json { render :show, status: :created, location: @gasto }
      else
        format.html { render :new }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      if @gasto.update(gasto_params)
        format.html { redirect_to gastos_url, notice: 'El registro ha sido actualizado.' }
        # format.html { redirect_to @gasto, notice: 'Gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasto }
      else
        format.html { render :edit }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    respond_to do |format|
      format.html { redirect_to gastos_url, notice: 'Gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gasto
    @gasto = Gasto.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gasto_params
    params.require(:gasto).permit(:fecha, :rend, :tipo, :num, :descripcion, :valor, :iva, :neto, :cc, :resp, :familia,
                                  :tipo, :cot, :aprobado, :estado, :tipo_documento, :folio, :emisor,
                                  :razon_social_emisor, :emision, :monto_neto, :monto_exento, :monto_iva, :monto_total,
                                  :impuestos, :fecha_vencimiento)
  end
end
