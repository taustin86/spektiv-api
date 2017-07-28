class CreateAuthorizedApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :authorized_applications do |t|
      t.string :api_key
      t.string :name

      t.timestamps
    end
  end
end
