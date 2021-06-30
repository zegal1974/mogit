
### AchievementCategory

achievement_category.csv 文件结构，

字段名|类型|描述|
---|---|---
Name_lang| string | 成就类型名称
ID| integer | 成就类型ID
Parent| integer | 父节点ID
Ui_order| integer | 显示排序

---

### Achievement

achievement.csv 文件结构，

字段名|类型|描述|
---|---|---
Description_lang| string | 成就描述
Title_lang| string | 成就标题
Reward_lang| string | 成就奖励
ID| integer | 成就ID
Instance_ID| integer | 实例ID？
Faction| integer | 种族(-1:全部)
Supercedes| integer | 替代
Category| integer | 成就类别ID
Points| integer | 成就点数
Flags| integer | 
Ui_order| integer | 
IconFileID| integer | 
RewardItemID| integer | 
Minimum_criteria| integer |  
Criteria_tree| integer | 标准？
Shares_criteria| integer | 
CovenantID | integer | 盟约ID
