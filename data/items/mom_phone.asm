momitem: MACRO
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   600, MOM_ITEM, GOLD_BERRY
	momitem      0,    90, MOM_ITEM, BITTER_BERRY
	momitem      0,   180, MOM_ITEM, MINT_BERRY
	momitem      0,   450, MOM_ITEM, MIRACLEBERRY
	momitem      0,   500, MOM_ITEM, BERSERK_GENE
.End

MomItems_2:
	momitem    900,   600, MOM_ITEM, SOFT_SAND
	momitem   4000,   500, MOM_ITEM, SHARP_BEAK
	momitem   7000,   500, MOM_ITEM, FOCUS_BAND
	momitem  10000,  1000, MOM_DOLL, BERSERK_GENE
	momitem  15000,  3000, MOM_ITEM, BRIGHTPOWDER
	momitem  19000,   4000, MOM_ITEM, SCOPE_LENS
	momitem  30000,  5000, MOM_DOLL, QUICK_CLAW
	momitem  40000,   10000, MOM_ITEM, LEFTOVERS
	momitem  50000,  10000, MOM_DOLL, MASTER_BALL
	momitem 100000, 20000, MOM_DOLL, MASTER_BALL
.End

	dt 0 ; unused
