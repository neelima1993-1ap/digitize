class UploadController < ApplicationController

	def uploadFile
    file_name = DigitalInvoice.save_file(params[:upload])
    Parser.parse(file_name)  #reads digitized file and converts
    redirect_to action: "index"
    flash[:notice] = "File converted successfully"
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