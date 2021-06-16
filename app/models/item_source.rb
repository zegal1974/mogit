class ItemSource < ApplicationRecord
  enum source_type: { None: 0, JournalEncounter: 1, Quest: 2, Vendor: 3, WorldDrop: 4, 
    HiddenUntilCollected: 5, CantCollect: 6, Achievement: 7, Profession: 8, NotValidForTransmog: 9 }
end
