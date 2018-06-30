class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #HOME ACTION
  get '/' do
    erb :index
  end

  #CREATE ACTION
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @rec=Recipe.create(name:params[:name], ingredients:params[:ingredients],cook_time:params[:cook_time])
    @rec.save
  end

  #SHOW ACTION
  get '/recipes/:id' do
    @rec=Recipe.find(params[:id])
    erb :show
  end

  #EDIT ACTION
  get '/recipes/:id/edit' do
    @rec=Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @rec=Recipe.find(params[:id]) #? Is this still the best method for finding here? Other parameters may have changed!
    @rec.name=params[:name]
    @rec.ingredients=params[:ingredients]
    @rec.cook_time=params[:cook_time]
    @rec.save
    redirect '/recipes/<%=params[:id]%>'  #? Is this the right re-direct?
  end

  #INDEX ACTION
  get '/recipes' do
    @recipes=Recipes.all
    erb :recipes
  end




end
