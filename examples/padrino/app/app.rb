module TestRailsstrap
  class App < Padrino::Application
    register Padrino::Helpers
    register Padrino::Rendering

    register Railsstrap

    get :root, map: '/' do
      render :index
    end

    get :users, map: '/users' do
      render :index
    end
  end
end