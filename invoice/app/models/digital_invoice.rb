class DigitalInvoice < ApplicationRecord

    def self.save_file(upload)
        uploaded_file = upload
        file_name = uploaded_file.original_filename
        File.open(Rails.root.join('tmp', file_name), "wb") do |f|
            f.write(uploaded_file.tempfile.read)
        end
        file_name
    end

end