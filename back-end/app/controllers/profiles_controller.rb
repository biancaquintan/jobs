class ProfilesController < ApplicationController
    before_action :set_profile, only: %i[ show edit update destroy ]

    def index
      if params[:search]
        @profiles = User.search(params[:search])
      else
        @profiles = User.all
      end
    end
  
    def show
      @profile = User.find(params[:id])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        params[:id] = current_user.id if current_user
        @profile = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def profile_params
        params.require(:profile).permit(:user_id)
      end

      def filtering_params(params)
        params.slice(:username)
      end
end
