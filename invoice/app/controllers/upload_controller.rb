class UploadController < ApplicationController

  
  DIGITS = { "010202212" => 0 , "000002002" => 1 , "010012210" => 2 , "010012012" => 3, "000212002" => 4, "010210012" => 5,
  "010210212" => 6 , "010002002" => 7, "010212212" => 8, "010212012" => 9 }

  def index
     
  end

  def initialize
  @invoice_num = ""
  @counter = 0
  @str = ""
  end


	def uploadFile
    text_file =  "#{Rails.root}/tmp/processed.txt"
    File.delete(text_file) if File.file?(text_file) #delete previously processed file
    DigitalInvoice.save_file(params[:upload])
    read_invoice_file  #reads difgitized file and converts
    redirect_to action: "index"
    flash[:notice] = "File converted successfully"
  end

  def download_text_file
    text_file =  "#{Rails.root}/tmp/processed.txt"
    send_file( text_file,
    filename: "readable_invoices.txt",
    type: 'application/text',
    disposition: 'attachment'
  )
  end


  def dig(lines,x,y)
  
    lines.take(3).each do |l|  #last line contains one next line character   
          l.chars[x,y].each do |ch|
              if ch == " "
                 @str << "0"
            elsif ch == "_" 
                 @str << "1"
            else ch == "|"
                 @str << "2"
            end  
          end 
    end #loop end   

    @counter = @counter + 3 
    if DIGITS[@str] 
        @invoice_num << DIGITS[@str].to_s
    else
      @invoice_num << "?" 
    end

    if @counter < 27 #27 characters in one line 
      @str = ""   #empty string for next digit of invoice
      dig(lines,x+3,3)  
    end 

  end #dig end
    
  def invoice_number
    @invoice_num
  end

  def read_invoice_file
    filename = 'invoice.txt'
    processed = 'processed.txt'
    directory = "tmp"    
    line_count = `wc -l "#{Rails.root.join('tmp', filename)}"`.strip.split(' ')[0].to_i
    invoice_count = line_count/4
    puts "total number of invoices are: #{invoice_count}" 
    File.open(Rails.root.join('tmp', filename), 'r') do |f|
      invoice_count.times do 
          lines = 4.times.map { f.gets }
          invoice = UploadController.new()
          invoice.dig(lines,0,3)   #seding the index of starting char and 3 and counter for iteration  till 27

          File.open(Rails.root.join('tmp', processed), 'a') do |f|
          
              if invoice.invoice_number.include?("?")
                f.write("#{invoice.invoice_number} ------- ILLEGAL" )
              else
                f.write(invoice.invoice_number)
              end
              f.write("\n")
          end
      end
    end
  end #read_invoice_file end 

end