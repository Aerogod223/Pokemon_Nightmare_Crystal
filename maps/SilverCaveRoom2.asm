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
	startbattle
	opentext
	writetext SilverCaveGiovanniLeaves
	waitbutton
	closetext
	applymovement PLAYER, PlayerStepsOutOfTheWay
	pause 6
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

PlayerStepsOutOfTheWay:
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

GiovanniLeavesCaveMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SilverCaveGiovanniIntro:
	text "TEST"
	done

PlayerBeatGiovanniText:
	text "TEST"
	done

SilverCaveGiovanniLeaves:
	text "TEST"
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
