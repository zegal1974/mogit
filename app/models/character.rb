

class Character < ApplicationRecord
  include Tree

  belongs_to :realm, optional: true
  belongs_to :race, optional: true
  belongs_to :chr_class, optional: true
  # belongs_to :active_covenant, optional: true

  has_many :reputations

  enum gender: { unknown: 1, male: 2, female: 3 }

  def build_rep_table
    tree = Tree.new
    self.reputations.each do |rep|
      # next if reps.exist?(rep.faction.id)
      faction = rep.faction
      node = tree.find(faction.id)
      if !node.nil?
        node.attributes = { name: faction.name, level_en: rep.level, level: rep.level_i18n, value: rep.value, top: rep.top, rate: rep.value*100/rep.top }
        next
      end
      node = tree.create_node(faction.id, name: faction.name, level_en: rep.level, level: rep.level_i18n, value: rep.value, top: rep.top, rate: rep.value*100/rep.top)
      while !(faction.parent_id == 0 or faction.parent.nil?) do
        faction = faction.parent
        parent = tree.find(faction.id)
        if parent.nil?
          parent = tree.create_node(faction.id, name: faction.name)
        end
        parent << node
        node = parent
      end
      tree.root << node
    end
    return tree.to_h
  end
end
