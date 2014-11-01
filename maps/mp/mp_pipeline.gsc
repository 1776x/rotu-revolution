#include maps\mp\_zombiescript;
main()
{
    maps\mp\mp_pipeline_fx::main();
    maps\createart\mp_pipeline_art::main();
    maps\mp\_load::main();

    maps\mp\_compass::setupMiniMap("compass_map_mp_pipeline");

    ambientPlay("ambient_pipeline");
    VisionSetNaked( "mp_pipeline" );

    game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
    setdvar("r_glowbloomintensity1",".1");
    setdvar("r_glowskybleedintensity0",".1");
    setdvar("compassmaxrange","2200");

    thread maps\mp\mp_pipeline_waypoints::load_waypoints();
    thread maps\mp\mp_pipeline_tradespawns::load_tradespawns();
	
	waittillStart();
	
	buildSurvSpawnByClassname("mp_dm_spawn");
	startSurvWaves();
}