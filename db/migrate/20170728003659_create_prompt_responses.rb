class CreatePromptResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :prompt_responses do |t|
      t.references :prompt_session, foreign_key: true
      t.boolean :bot_response
      t.text :body

      t.timestamps
    end
  end
end
