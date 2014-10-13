class CreateCpes < ActiveRecord::Migration
  def change
    create_table :cpes do |t|
			t.string :OUICode
			t.string :VendorCode
			t.string :PriviosionCode
			t.string :Serials
      t.timestamps
    end
  end
end
