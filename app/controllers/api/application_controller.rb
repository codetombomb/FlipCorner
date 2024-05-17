module Api
    class ApplicationController < ActionController::API
        def hello
            puts "Running hello"
            render json: { message: 'Hello from the Rails API!' }
        end
    end
end