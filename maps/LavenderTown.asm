	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER
	const LAVENDERTOWN_LORELEI

LavenderTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

.DummyScene0:
	end

.DummyScene1:
	end

LavenderTownLoreleiLeftScript:
	playsound SFX_ENTER_DOOR
	appear LAVENDERTOWN_LORELEI
	waitsfx
	applymovement LAVENDERTOWN_LORELEI, LoreleiExitsMovement
	turnobject LAVENDERTOWN_LORELEI, LEFT
	sjump LavenderTownLoreleiScript

LavenderTownLoreleiDownScript:
	playsound SFX_ENTER_DOOR
	appear LAVENDERTOWN_LORELEI
	waitsfx
	applymovement LAVENDERTOWN_LORELEI, LoreleiExitsMovement

LavenderTownLoreleiScript:
	opentext
	writetext LoreleiIntoText
	waitbutton
	closetext
	winlosstext PlayerBeatLoreleiText, 0
	setlasttalked LAVENDERTOWN_LORELEI
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmap
	opentext
	writetext LoreleiLeavesText
	waitbutton
	closetext
	applymovement LAVENDERTOWN_LORELEI, LoreleiLeavesMovement
	setscene SCENE_FINISHED
	disappear LAVENDERTOWN_LORELEI
	special LoadUsedSpritesGFX
	end

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LoreleiExitsMovement:
	step DOWN
	step_end

LoreleiLeavesMovement:
	teleport_from
	step_end

LavenderTownPokefanMText:
	text "That's quite some"
	line "building, eh?"

	para "It's KANTO's RADIO"
	line "TOWER."
	done

LavenderTownTeacherText:
	text "KANTO has many"
	line "good radio shows."
	done

LavenderTownGrampsText:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #MON."
	done

LavenderTownYoungsterText:
	text "You need a #"
	line "FLUTE to wake"
	cont "sleeping #MON."

	para "Every trainer has"
	line "to know that!"
	done

LavenderTownSignText:
	text "LAVENDER TOWN"

	para "The Noble Purple"
	line "Town"
	done

KantoRadioStationSignText:
	text "KANTO RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

SoulHouseSignText:
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done

LoreleiIntoText:
	text "TEST"
	done

PlayerBeatLoreleiText:
	text "TEST"
	done

LoreleiLeavesText:
	text "TEST"
	done


LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event  1,  5, LAVENDER_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	def_coord_events
	coord_event 13,  6, SCENE_DEFAULT, LavenderTownLoreleiLeftScript
	coord_event 14,  7, SCENE_DEFAULT, LavenderTownLoreleiDownScript

	def_bg_events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, LavenderMartSignText

	def_object_events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
	object_event 14,  5, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_LORELEI
