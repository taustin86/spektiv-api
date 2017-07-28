class PromptSessionsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    prompt = Prompt.find(params[:prompt_id])
    session = PromptSession.create(user: user, prompt: prompt)

    render json: {success: true, promptSession: session}
  end

  def submit_input
    prompt_session = PromptSession.find(params[:id])
    PromptResponse.create(prompt_session: prompt_session, bot_response: false, body: params[:text])
    response = prompt_session.generate_bot_response

    render json: {success: true, response: response}
  end
end