class CreateDigitalInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :digital_invoices do |t|

      t.timestamps
    end
  end
end
