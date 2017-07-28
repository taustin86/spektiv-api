class UsersController < ApplicationController
  def prompt
    user = User.find(params[:id])
    render json: {success: true, prompt: user.next_prompt}
  end

  def skip_prompt
    user = User.find(params[:id])
    prompt = Prompt.find(params[:prompt_id])
    PromptSkip.create!(user: user, prompt: prompt)

    render json: {success: true}
  end
end