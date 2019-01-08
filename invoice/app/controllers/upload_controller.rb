class UploadController < ApplicationController

	def upload_file
    file_name = DigitalInvoice.save_file(params[:upload])
    Parser.parse(file_name)  #reads digitized file and converts
    flash[:notice] = "File converted successfully"
    redirect_to action: "index"
    
  end

  def download_text_file
    processed_filename = params[:file] 
    text_file =  "#{Rails.root}/tmp/#{processed_filename}"
    send_file( text_file,
    filename: processed_filename,
    type: 'application/text',
    disposition: 'attachment'
  )
  end

end