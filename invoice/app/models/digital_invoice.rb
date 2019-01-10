class DigitalInvoice < ApplicationRecord
	require 'carrierwave/orm/activerecord'
	mount_uploader :raw, InvoiceUploader
	mount_uploader :processed, InvoiceUploader

end