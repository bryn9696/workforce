class AddFullNameToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :full_name, :string
  end
end
