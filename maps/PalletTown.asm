	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_AGATHA

PalletTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

.DummyScene0:
	end

.DummyScene1:
	end

PalletTownAgathaLeftScript:
	playsound SFX_ENTER_DOOR
	appear PALLETTOWN_AGATHA
	waitsfx
	applymovement PALLETTOWN_AGATHA, AgathaExitsLabMovement
	turnobject PALLETTOWN_AGATHA, LEFT
	sjump PalletTownAgathaScript

PalletTownAgathaRightScript:
	playsound SFX_ENTER_DOOR
	appear PALLETTOWN_AGATHA
	waitsfx
	applymovement PALLETTOWN_AGATHA, AgathaExitsLabMovement
	turnobject PALLETTOWN_AGATHA, RIGHT

PalletTownAgathaScript:
	opentext
	writetext AgathaIntoText
	waitbutton
	closetext
	winlosstext PlayerBeatAgathaText, 0
	setlasttalked PALLETTOWN_AGATHA
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmap
	opentext
	writetext AgathaLeavesText
	waitbutton
	closetext
	applymovement PALLETTOWN_AGATHA, AgathaLeavesMovement
	setscene SCENE_FINISHED
	disappear PALLETTOWN_AGATHA
	special LoadUsedSpritesGFX
	end

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

AgathaExitsLabMovement:
	slow_step DOWN
	step_end

AgathaLeavesMovement:
	teleport_from
	step_end

AgathaIntoText:
	text "Oh, well look what"
	line "we have here."

	para "Are you another"
	line "one of OAK's"
	cont "protege's?"

	para "I was visiting him"
	line "for old time's"
	cont "sake."

	para "Talking with that"
	line "man always makes"

	para "me feel like"
	line "battling."

	para "Hopefully you"
	line "give in too soon!"
	done

PlayerBeatAgathaText:
	text "Oh ho! You are"
	line "something special!"
	done

AgathaLeavesText:
	text "Well looks like I"
	line "was right to"
	cont "retire..."

	para "Oh well, the fact"
	line "that I can still"

	para "give you young'uns"
	line "a good fight gives"

	para "me all the"
	line "satisfaction I"
	cont "need."

	para "Make sure to"
	line "keep your eye on"

	para "that Oak, and make"
	line "sure he doesn't"
	cont "work to hard."

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "RED'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "BLUE'S HOUSE"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events
	coord_event 11, 12, SCENE_DEFAULT, PalletTownAgathaLeftScript
	coord_event 13, 12, SCENE_DEFAULT, PalletTownAgathaRightScript

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event 12, 11, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_AGATHA
