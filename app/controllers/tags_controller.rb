class TagsController < ApplicationController
    before_action :check_user
  
    def create
        @tag = current_user.tags.build(tag_params)
        
        if @tag.save
            redirect_back(fallback_location: root_path, notice: 'Tag was successfully added.')
        else
          render :new
        end
      end
      
      # Use tag_params to permit cas_id
      def tag_params
        params.require(:tag).permit(:name, :cas_id)
      end
      
  
    def destroy
      @tag = @applicant.tags.find(params[:id])
      if @tag.user_id == current_user.id
        @tag.destroy
        redirect_to @applicant, notice: 'Tag was successfully removed.'
      else
        redirect_to @applicant, alert: 'You cannot remove a tag you did not create.'
      end
    end
  
    private
  
  
    def check_user
      # todo: logic for user authorization, e.g., using Devise's `authenticate_user!`
    end
  
    # def tag_params
    #   params.require(:tag).permit(:name)
    # end
    def new
        @tag = Tag.new
    end
      
  end
  