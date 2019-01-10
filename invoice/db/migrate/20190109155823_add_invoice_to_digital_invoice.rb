class AddInvoiceToDigitalInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :digital_invoices, :raw, :string
  end
end
