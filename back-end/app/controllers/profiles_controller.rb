class ProfilesController < ApplicationController
    before_action :set_profile, only: %i[ show edit update destroy ]

    def index
      @profiles = User.all
    end
  
    def show
      @profile = User.find(params[:id])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        @profile = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def profile_params
        params.require(:profile).permit(:user_id)
      end
end
