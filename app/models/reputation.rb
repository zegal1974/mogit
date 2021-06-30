class Reputation < ApplicationRecord
  belongs_to :faction
  belongs_to :character

  BOTTOM_LEVEL = [-42000, -6000, -3000, 0, 3000, 9000, 21000, 42000, 43000]
  enum level: { hated: 0, hostile: 1, unfriendly: 2, neutral: 3, friendly: 4,
    honored: 5, revered: 6, exalted: 7, paragon: 8
  }
  TOP = 53000

  before_save :update_earned
  before_create :update_earned

  # def self.build_by_faction_id(faction_id, attributes={})
  #   faction = Faction.where(id: faction_id).first
  #   if(!faction.nil?)
  #     attributes.merge!(faction_id: faction.id)
  #     return Reputation.new(attributes)
  #   end
  # end

  # def self.build_by_faction_index(index, character)
  #   faction = Faction.where(reputation_index: index).first
  #   if(!faction.nil?)
  #     return Reputation.where(faction: faction, character: character).first_or_initialize
  #   end
  # end

  def update_earned
    top = TOP
    index = BOTTOM_LEVEL.length - 1
    while (self.earned < BOTTOM_LEVEL[index]) do
      top = BOTTOM_LEVEL[index]
      index = index - 1
    end
    
    self.level = index
    self.value = self.earned - BOTTOM_LEVEL[index]
  end

  def top
    p self.level_before_type_cast
    if self.level_before_type_cast
      if self.level_before_type_cast == 8
        return 10000
      end
      return BOTTOM_LEVEL[self.level_before_type_cast+1] - BOTTOM_LEVEL[self.level_before_type_cast]
    end
    return 0
  end

  def name
    return faction.name if !faction.nil?
  end

end
