class DigitalInvoicesController < ApplicationController

require 'carrierwave/orm/activerecord'
   
  def index
    @digital_invoices = DigitalInvoice.all
    @digital_invoice = DigitalInvoice.new
  end

	def upload
    di = DigitalInvoice.create(digital_invoices_params)
    #send the uploaded file to parse method
    #skipping validation on the inout file
    Parser.parse(di)
    flash[:notice] = "File successfully processed"
    redirect_to root_path
   
  end

  def download
      file_id = params[:id] 
      type =  params[:type] == "processed"  ? "processed" : "raw"
      file_path = DigitalInvoice.find(file_id).send(type).current_path
      send_file(file_path,
      type: 'application/text',
      disposition: 'attachment'
       )
  end

  protected

  def digital_invoices_params
    params.require(:digital_invoice).permit(:raw)
  end

end