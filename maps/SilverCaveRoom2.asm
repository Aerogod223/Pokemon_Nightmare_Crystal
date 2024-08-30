	object_const_def
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3
	const SILVER_CAVE_GIOVANNI

SilverCaveRoom2_MapScripts:
	def_scene_scripts

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

GiovanniSilverCaveScript:
	faceplayer
	showemote EMOTE_SHOCK, SILVER_CAVE_GIOVANNI, 15
	opentext
	writetext SilverCaveGiovanniIntro
	waitbutton
	closetext
	winlosstext PlayerBeatGiovanniText, 0
	setlasttalked SILVER_CAVE_GIOVANNI
	loadtrainer BOSS, GIOVANNI
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_GIOVANNI
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_GIOVANNI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SilverCaveGiovanniLeaves
	waitbutton
	closetext
	applymovement SILVER_CAVE_GIOVANNI, GiovanniLeavesCaveMovement
	disappear SILVER_CAVE_GIOVANNI
	setevent EVENT_BEAT_GIOVANNI
	end

SilverCaveRoom2Calcium:
	itemball CALCIUM

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2PPUp:
	itemball PP_UP

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION

GiovanniLeavesCaveMovement:
	teleport_from
	step_end

SilverCaveGiovanniIntro:
	text "You are the one I"
	line "saw at the tower."

	para "You remind me of"
	line "the trainer who"
	cont "beat me years ago"

	para "I came here to"
	line "challenge him after"
	cont "years of training."

	para "I see you have the"
	line "goal as me."

	para "That means we must"
	line "battle first."

	para "I was once the"
	line "Greatest Trainer."

	para "now I will prove"
	line "I am worthy of"
	cont "that title again."
	done


PlayerBeatGiovanniText:
	text "Defeated again!"
	line "How can this be?"
	done

SilverCaveGiovanniLeaves:
	text "I have been beaten"
	line "again by a child."

	para "It would seem I"
	line "am not worthy to"
	cont "challenge him."

	para "Go to the peak of"
	line "the mountain and"
	cont "battle him."

	para "One day I will"
	line "challenge you"
	cont "again. Farewell."
	done

SilverCaveRoom2_MapEvents:
	db 0, 0 ; fillerx

	def_warp_events
	warp_event 17, 31, SILVER_CAVE_ROOM_1, 2
	warp_event 11,  5, SILVER_CAVE_ROOM_3, 1
	warp_event 13, 21, SILVER_CAVE_ITEM_ROOMS, 1
	warp_event 23,  3, SILVER_CAVE_ITEM_ROOMS, 2

	def_coord_events

	def_bg_events
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

	def_object_events
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
	object_event 19, 22, SPRITE_RADIOTOWER_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GiovanniSilverCaveScript, EVENT_BEAT_GIOVANNI
