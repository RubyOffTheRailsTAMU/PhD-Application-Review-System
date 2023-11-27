# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :check_user
  # # GET /tags
  # def index
  #   @tags = Tag.all
  # end

  # # GET /tags/new
  # def new
  #   @tag = Tag.new
  # end

  # def create
  #   @tag = current_user.tags.build(tag_params)

  #   if @tag.save
  #     redirect_back(fallback_location: root_path, notice: 'Tag was successfully added.')
  #   else
  #     render :new
  #   end
  # end

  # # Use tag_params to permit cas_id
  # def tag_params
  #   params.require(:tag).permit(:name, :cas_id)
  # end

  # # GET /tags/:id/edit
  # def edit
  #   @tag = Tag.find(params[:id])
  # end

  # # PATCH/PUT /tags/:id
  # def update
  #   puts "cas_id: #{params[:cas_id]}"
  #   @tag = Tag.find(params[:id])
  #   if @tag.update(tag_params)

  #     # redirect_back(fallback_location: root_path, notice: 'Tag was successfully edited.')
  #     # todo: would like to redirect to applicant page
  #     redirect_to application_path(cas_id: tag_params[:cas_id]), notice: 'Tag was successfully edited.'

  #     # redirect_to application_path(cas_id: params[:cas_id]), notice: 'Tag was successfully edited.'
  #   else
  #     render :edit
  #   end
  # end

  # # todo: fix
  # def destroy
  #   @tag = Tag.find(params[:id])
  #   if @tag.user_id == current_user.id
  #     @tag.destroy
  #     redirect_to application_path(cas_id: params[:cas_id]), notice: 'Tag was successfully deleted.'
  #   else
  #     redirect_back(fallback_location: root_path, notice: 'You cannot remove a tag you did not create.')
  #   end
  # end

  # private

  # def check_user
  #   # TODO: logic for user authorization, e.g., using Devise's `authenticate_user!`
  # end

  # # def tag_params
  # #   params.require(:tag).permit(:name)
  # # end

end
