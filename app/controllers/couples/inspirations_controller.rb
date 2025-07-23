class Couples::InspirationsController < ApplicationController
    def show
        @query = params[:q] || "wedding"
        @results = Unsplash::Photo.search(@query, 1, 20)
    end
end

