class PromptSession < ApplicationRecord
  belongs_to :user
  belongs_to :prompt

  def generate_bot_response
    stock_answers = ["Hmmmm interesting", "Sorry, I'm not smart enough to respond appropriately", "You go girl"]
    PromptResponse.create!(prompt_session_id: self.id, bot_response: true, body: stock_answers.sample)
  end
end
