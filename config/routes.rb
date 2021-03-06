Rails.application.routes.draw do
  resources :permisos
  resources :personals
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'dup', to: 'gastos#dup'
  resources :medidas
  resources :barcos
  resources :checklists
  resources :envasadoras
  resources :requerimientos
  resources :entregas
  resources :equipos
  get 'brr17check', to: 'equipos#brr17check'
  get 'brr20check', to: 'equipos#brr20check'
  get 'ol03check', to: 'equipos#ol03check'
  get 'hqpta31check', to: 'equipos#hqpta31check'
  get 'hqpta32check', to: 'equipos#hqpta32check'
  get 'hqpta33check', to: 'equipos#hqpta33check'
  get 'lcacheck', to: 'equipos#lcacheck'
  get 'vtscheck', to: 'equipos#vtscheck'
  get 'ptmcheck', to: 'equipos#ptmcheck'
  get 'parcheck', to: 'equipos#parcheck'

  resources :gastos do
    collection { post :import }
  end
  get 'gastoslca', to: 'gastos#gastoslca'
  get 'gastoslcapend', to: 'gastos#gastoslcapend'
  get 'gastoslcapagado', to: 'gastos#gastoslcapagado'
  get 'gastosvts', to: 'gastos#gastosvts'
  get 'gastosvtspend', to: 'gastos#gastosvtspend'
  get 'gastosvtspagado', to: 'gastos#gastosvtspagado'
  get 'gastosptm', to: 'gastos#gastosptm'
  get 'gastosptmpend', to: 'gastos#gastosptmpend'
  get 'gastosptmpagado', to: 'gastos#gastosptmpagado'
  get 'gastoslcarend', to: 'gastos#gastoslcarend'
  get 'gastosvtsrend', to: 'gastos#gastosvtsrend'
  get 'gastosptmrend', to: 'gastos#gastosptmrend'
  get 'gastosunasigned', to: 'gastos#gastosunasigned'

  resources :horas
  get 'mec', to: 'horas#mec'
  get 'serv', to: 'horas#serv'
  resources :trabajos
  get 'lca', to: 'trabajos#lca'
  get 'vts', to: 'trabajos#vts'
  get 'ptm', to: 'trabajos#ptm'
  get 'par', to: 'trabajos#par'

  get 'indexejec', to: 'trabajos#indexejec'
  get 'lcaejec', to: 'trabajos#lcaejec'
  get 'vtsejec', to: 'trabajos#vtsejec'
  get 'ptmejec', to: 'trabajos#ptmejec'
  get 'parejec', to: 'trabajos#parejec'
  get 'indexop', to: 'trabajos#indexop'
  get 'lcaop', to: 'trabajos#lcaop'
  get 'vtsop', to: 'trabajos#vtsop'
  get 'ptmop', to: 'trabajos#ptmop'
  get 'parop', to: 'trabajos#parop'
  get 'indexfact', to: 'trabajos#indexfact'
  get 'lcafact', to: 'trabajos#lcafact'
  get 'vtsfact', to: 'trabajos#vtsfact'
  get 'ptmfact', to: 'trabajos#ptmfact'
  get 'parfact', to: 'trabajos#parfact'
  devise_for :users
  root to: 'pages#home'

  # get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
