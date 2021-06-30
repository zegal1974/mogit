class AchievementsController < ApplicationController
  def index
    # @current_character = Character.find(params[:character])
    @categories = AchievementCategory.where(parent: nil).order(:order).all
    @current_category = 
      if params[:category]
        AchievementCategory.find(params[:category])
      else
        AchievementCategory.find(1)
      end
    @achievements = @current_category.achievements
    p @current_category, @achievements
  end

end