; AutomaticWeatherEffects indexes
	const_def 1
	const AUTOMATIC_SUN
	const AUTOMATIC_RAIN
	const AUTOMATIC_SANDSTORM
	const AUTOMATIC_SPIKES

AutomaticWeatherMaps:
auto_weather_map: MACRO
	map_id \1 ; map
	db \2 ; AUTOMATIC_* weather index
ENDM
	auto_weather_map SEAFOAM_GYM, AUTOMATIC_SUN
    auto_weather_map BURNED_TOWER_1F, AUTOMATIC_SUN
    auto_weather_map LANCES_ROOM, AUTOMATIC_SUN    
    auto_weather_map ROUTE_41, AUTOMATIC_RAIN
    auto_weather_map ROUTE_42, AUTOMATIC_RAIN
    auto_weather_map LAKE_OF_RAGE, AUTOMATIC_RAIN	
    auto_weather_map CERULEAN_GYM, AUTOMATIC_RAIN
    auto_weather_map VERMILION_GYM, AUTOMATIC_RAIN
	auto_weather_map ROUTE_45, AUTOMATIC_SANDSTORM
	auto_weather_map ROUTE_46, AUTOMATIC_SANDSTORM
	auto_weather_map ROUTE_9, AUTOMATIC_SANDSTORM
	auto_weather_map VICTORY_ROAD, AUTOMATIC_SANDSTORM
	auto_weather_map PEWTER_GYM, AUTOMATIC_SANDSTORM
	auto_weather_map SILVER_CAVE_ROOM_1, AUTOMATIC_SANDSTORM
	auto_weather_map SILVER_CAVE_ROOM_2, AUTOMATIC_SANDSTORM
	db 0 ; end

AutomaticWeatherEffects:
; entries correspond to AUTOMATIC_* constants
auto_weather_effect: MACRO
	db \1 ; battle weather
	dw \2 ; animation
	dw \3 ; text
ENDM
	auto_weather_effect WEATHER_SUN, SUNNY_DAY, SunGotBrightText
	auto_weather_effect SCREENS_SPIKES, SPIKES, SpikesDescription
	auto_weather_effect WEATHER_RAIN, RAIN_DANCE, DownpourText
	auto_weather_effect WEATHER_SANDSTORM, ANIM_IN_SANDSTORM, SandstormBrewedText