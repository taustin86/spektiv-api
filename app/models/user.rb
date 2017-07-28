class User < ApplicationRecord
  def next_prompt
    skipped_ids = PromptSkip.where(user_id: self.id).pluck(:prompt_id)
    completed_ids = PromptSession.where(user_id: self.id).pluck(:prompt_id)

    Prompt.where.not(id: skipped_ids + completed_ids).order("RANDOM()").first
  end
end
