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
        render json: Entry.create(entry_params)
    end
    
    def update
        render json: Entry.update(params[:id], entry_params)
    end
    
    def destroy
        render json: Entry.destroy(params[:id])
    end
    
    private
    
        def entry_params
            params.require(:entry).permit(:name, :winner)
        end
    
end
