class DigitalInvoice < ApplicationRecord

    def self.save_file(upload)
        name = "invoice.txt"
        directory = "tmp"    
        uploaded_file = upload
        File.open(Rails.root.join('tmp', name), "wb") do |f|
            f.write(uploaded_file.tempfile.read)
        end
    end

end