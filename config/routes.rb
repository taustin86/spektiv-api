Rails.application.routes.draw do
  get   '/users/:id/prompt', to: 'users#prompt', as: 'user_prompt'
  post  '/users/:id/prompt/:prompt_id/skip', to: 'users#skip_prompt', as: 'user_skip_prompt'

  post  '/prompt_sessions/create', to: 'prompt_sessions#create', as: 'prompt_sessions_create'
  post  '/prompt_sessions/:id/submit_input', to: 'prompt_sessions#submit_input', as: 'prompt_sessions_input'
end
