/*
* 
* - Handles the global functions
* 
*/ 

NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY = { 

  Params ["_Loc_Array"];

  Places_Live pushBack _Loc_Array;

};

NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY = {  

  Params ["_Loc_Array"];

  Places_Live deleteAt (Places_Live find _Loc_Array);

};