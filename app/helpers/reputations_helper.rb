module ReputationsHelper

  REPUTATION_BACKGROUND = {
    hated: "#d90e03",
    hostile: "#cc3609",
    unfriendly: "#edba03",
    neutral: "#edba03",
    friendly: "#0f9601",
    honored: "#0f9601",
    revered: "#0f9601",
    exalted: "#01b2f1",
    paragon: "#01b2f1"
  }

  def reputation_background reputation
    # p reputation.to_sym, REPUTATION_BACKGROUND[reputation.to_sym]
    return REPUTATION_BACKGROUND[reputation.to_sym]
  end
end
