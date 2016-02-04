class EntriesController < ApplicationController
    respond_to :json
    
    def index
        @entries = Entry.all
        #respond_with @entries
        render json: @entries
    end
    
    def show
        render json: Entry.find(params[:id])
    end
    
    def create
        render json: Entry.crate(params[:entry])
    end
    
    def update
        render json: Entry.update(params[:id], params[:entry])
    end
    
    def destroy
        render json: Entry.destroy(params[:id])
    end
    
end
