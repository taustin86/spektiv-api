class CreatePromptSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :prompt_sessions do |t|
      t.references :user, foreign_key: true
      t.references :prompt, foreign_key: true

      t.timestamps
    end
  end
end
