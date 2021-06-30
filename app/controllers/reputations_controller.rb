class ReputationsController < ApplicationController
  def index
    @character = Character.find(params[:char])
    @reputations = @character.build_rep_table
    # @reputations = Faction.where.not(reputation_index: nil)
    # @reputations_root = @reputations.where(parent_id: 0)
    
  end
end