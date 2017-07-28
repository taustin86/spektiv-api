class CreatePromptSkips < ActiveRecord::Migration[5.1]
  def change
    create_table :prompt_skips do |t|
      t.references :user, foreign_key: true
      t.references :prompt, foreign_key: true

      t.timestamps
    end
  end
end
