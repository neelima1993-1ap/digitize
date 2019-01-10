#class UploadController < ApplicationController
class DigitalInvoiceController < ApplicationController

require 'carrierwave/orm/activerecord'
   

	def upload
    di = DigitalInvoice.new
    di.raw = params[:upload]
    di.save!  
    #send the uploaded file to parse method
    Parser.parse(di)
    flash[:notice] = "File successfully processed"
    redirect_to root_path
   
  end

  def download
      file_id = params[:file] 
      type =  params[:type] == "processed"  ? "processed" : "raw"
      file_path = DigitalInvoice.find(file_id).send(type).current_path
      send_file(file_path,
      type: 'application/text',
      disposition: 'attachment'
       )
  end

end