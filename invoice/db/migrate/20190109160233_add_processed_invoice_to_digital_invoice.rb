class AddProcessedInvoiceToDigitalInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :digital_invoices, :processed, :string
  end
end
