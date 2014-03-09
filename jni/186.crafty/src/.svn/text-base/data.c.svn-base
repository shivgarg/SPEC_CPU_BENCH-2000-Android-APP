#include <stdio.h>
#include <stdlib.h>
#include "chess.h"
#include "evaluate.h"
#include "data.h"  
#define     VERSION                             "14.3"
  char      version[6] =                    {VERSION};

  PLAYING_MODE mode =                     normal_mode;

  int       batch_mode =                            0; /* no asynch reads */
  int       crafty_rating =                      2500;
  int       opponent_rating =                    2500;
  char      pgn_event[32] = {"Private Match"};
  char      pgn_site[32] = {"Birmingham, AL"};
  char      pgn_date[32] = {"????.??.??"};
  char      pgn_round[32] = {"1"};
  char      pgn_white[64] = {"unknown"};
  char      pgn_white_elo[32] = {""};
  char      pgn_black[64] = {"Crafty " VERSION};
  char      pgn_black_elo[32] = {""};
  char      pgn_result[32] = {"*"};

  int       number_auto_kibitzers =                 8;

  char      auto_kibitz_list[100][20] = {
                                      {"diepx"},
                                      {"ferret"},
                                      {"knightc"},
                                      {"knightcap"},
                                      {"nowx"},
                                      {"rajah"},
                                      {"tcb"},
                                      {"zarkovx"}};
  

  int       number_of_computers =                  80;
  char      computer_list[100][20] = {
                                      {"abner"},
                                      {"aragorn"},
                                      {"babyblue"},
                                      {"ban"},
                                      {"bigblue"},
                                      {"bikerbabe"},
                                      {"bobbyfischer"},
                                      {"braincan"},
                                      {"brause"},
                                      {"carokann"},
                                      {"chameleon"},
                                      {"chesskid"},
                                      {"chesst"},
                                      {"chessica"},
                                      {"chesscomputer"},
                                      {"chinook"},
                                      {"crazyknight"},
                                      {"cstal-x"},
                                      {"deep-modem"},
                                      {"deepviolet"},
                                      {"diep"},
                                      {"diepx"},
                                      {"destroyer"},
                                      {"doctorwho"},
                                      {"dominator"},
                                      {"dustbin"},
                                      {"ego-crusher"},
                                      {"ferret"},
                                      {"fitter"},
                                      {"fritzpentium"},
                                      {"futuregm"},
                                      {"gammaray"},
                                      {"gazaboy"},
                                      {"gballa"},
                                      {"gnusurf"},
                                      {"hiarcs"},
                                      {"kerrigan"},
                                      {"knightc"},
                                      {"knightcap"},
                                      {"kingtwoft"},
                                      {"killerchess"},
                                      {"killergrob"},
                                      {"klamath"},
                                      {"lightpurple"},
                                      {"lonnie"},
                                      {"lynnett"},
                                      {"mchesspro"},
                                      {"mephistoiii"},
                                      {"netsurfer"},
                                      {"norpico"},
                                      {"nowx"},
                                      {"otter"},
                                      {"pecabale"},
                                      {"phibs"},
                                      {"rajah"},
                                      {"ratbert"},
                                      {"rdx"},
                                      {"rebel"},
                                      {"rebel8"},
                                      {"robocop"},
                                      {"roborvl"},
                                      {"selectric"},
                                      {"shredder"},
                                      {"silmaril"},
                                      {"spectronic"},
                                      {"stobor"},
                                      {"tcb"},
                                      {"theextreme"},
                                      {"tingle"},
                                      {"turbocrafty"},
                                      {"turbogm"},
                                      {"ultragnu"},
                                      {"viktor2000"},
                                      {"virtualmachine"},
                                      {"wchess"},
                                      {"wchessx"},
                                      {"wheeler"},
                                      {"whoknows"},
                                      {"zarkovx"},
                                      {"zuntsu"}};

  int       number_of_GMs =                        27;
  char      GM_list[100][20] =       {
                                      {"anat"},
                                      {"badviking"},
                                      {"devin"},
                                      {"cleaner"},
                                      {"dgurevich"},
                                      {"dlugy"},
                                      {"flamingskull"},
                                      {"gum"},
                                      {"gmsoffer"},
                                      {"junior"},
                                      {"kaidanov"},
                                      {"kc"},
                                      {"kevlar"},
                                      {"kingloek"},
                                      {"kudrin"},
                                      {"logofet"},
                                      {"lombardy"},
                                      {"mohegan"},
                                      {"pnin"},
                                      {"psakhis"},
                                      {"roman"},
                                      {"sagalchik"},
                                      {"securitron"},
                                      {"smirin"},
                                      {"stefansson"},
                                      {"silvester"},
                                      {"wbrowne"}};

  int       number_of_IMs =                        11;
  char      IM_list[100][20] =       {
                                      {"adolf"},
                                      {"badviking"},
                                      {"bandora"},
                                      {"imorlov"},
                                      {"impolzin"},
                                      {"laflair"},
                                      {"lsokol"},
                                      {"oed"},
                                      {"thutters"},
                                      {"thumpster"},
                                      {"tim"}};

  int       ics =                                   0;
  int       output_format =                         0;
  int       EGTBlimit =                             5;
  int       xboard =                                0;
  int       whisper =                               0;
  int       channel =                               0;
  int       early_exit =                           99;
  int       new_game =                              0;
  char      channel_title[32] =                  {""};
  int       initialized =                           0;
  int       kibitz =                                0;
  int       post =                                  0;
  int       log_id =                                1;
  int       move_number =                           1;
  int       wtm =                                   1;
  int       crafty_is_white =                       0;
  int       last_opponent_move =                    0;
  int       largest_positional_score =            100;
  int       search_depth =                          0;
  int       search_move =                           0;
  TIME_TYPE time_type =                       elapsed;
  int       nodes_between_time_checks =         10000;
  int       nodes_per_second =                  10000;
  int       predicted =                             0;

  int       time_used =                             0;
  int       time_used_opponent =                    0;
  int       auto_kibitzing =                        0;
  signed char transposition_id =                    0;

  int       opening =                               1;
  int       middle_game =                           0;
  int       end_game =                              0;
  signed char thinking =                            0;
  signed char pondering =                           0;
  signed char puzzling =                            0;
  signed char booking =                             0;
  int       analyze_mode =                          0;
  int       annotate_mode =                         0;
  int       test_mode =                             0;
  int       analyze_move_read =                     0;
  signed char resign =                              5;
  signed char resign_counter =                      0;
  signed char resign_count =                        5;
  signed char draw_counter =                        0;
  signed char draw_count =                         10;
  int       tc_moves =                             60;
  int       tc_time =                          180000;
  int       tc_time_remaining =                180000;
  int       tc_time_remaining_opponent =       180000;
  int       tc_moves_remaining =                   60;
  int       tc_secondary_moves =                   30;
  int       tc_secondary_time =                 90000;
  int       tc_increment =                          0;
  int       tc_sudden_death =                       0;
  int       tc_operator_time =                      0;
  int       tc_safety_margin =                      0;
  int       time_limit =                          100;
  int       force =                                 0;
  char      initial_position[80] =               {""};
  int       over =                                  0;
  int       draw_score_is_zero =                    0;
  int       usage_level =                           0;
  char      audible_alarm =                         0;
  int       ansi =                                  1;
  int       book_accept_mask =                    ~03;
  int       book_reject_mask =                      3;
  int       book_random =                           3;
  int       book_search_trigger =                  20;
  int       learning =                              3;
  int       moves_out_of_book =                     0;
  int       show_book =                             0;
  int       book_selection_width =                  5;
  int       ponder =                                1;
  int       trace_level =                           0;
  int       verbosity_level =                       9;
  unsigned int noise_level =                    10000;
 
  int       hash_table_size =                    8192;
  int       log_hash =                             13;
  int       pawn_hash_table_size =               4096;
  int       log_pawn_hash =                        12;

  int       default_draw_score =                 DRAW;

  int       passed_pawn_value[8] = { 0,
                                     PAWN_PASSED*2, PAWN_PASSED*3,
                                     PAWN_PASSED*4, PAWN_PASSED*6,
                                     PAWN_PASSED*9, PAWN_PASSED*12,
                                     0};

  int       supported_passer[8] =  { 0,
                                     PAWN_SUPPORTED_PASSED_RANK2,
                                     PAWN_SUPPORTED_PASSED_RANK3,
                                     PAWN_SUPPORTED_PASSED_RANK4,
                                     PAWN_SUPPORTED_PASSED_RANK5,
                                     PAWN_SUPPORTED_PASSED_RANK6,
                                     PAWN_SUPPORTED_PASSED_RANK7,
                                     0};

  int       reduced_material_passer[20] = { 10,10,9,9,8,8,7,7,6,6,
                                             5,5,4,4,3,3,2,2,1,1};

  int       outside_passed[128] = { 30, 30, 27, 27, 27, 25, 24, 23,
                                    22, 21, 20, 19, 18, 17, 16, 15,
                                    14, 13, 12, 11, 10,  9,  8,  7,
                                     6,  5,  4,  3,  2,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1,
                                     1,  1,  1,  1,  1,  1,  1,  1};

  char      square_color[64]  = { 1, 0, 1, 0, 1, 0, 1, 0,
                                  0, 1, 0, 1, 0, 1, 0, 1,
                                  1, 0, 1, 0, 1, 0, 1, 0,
                                  0, 1, 0, 1, 0, 1, 0, 1,
                                  1, 0, 1, 0, 1, 0, 1, 0,
                                  0, 1, 0, 1, 0, 1, 0, 1,
                                  1, 0, 1, 0, 1, 0, 1, 0,
                                  0, 1, 0, 1, 0, 1, 0, 1 };

  int       b_n_mate_dark_squares[64] = 
                             { 20, 15, 10,  5, -5,-10,-15,-20,
                               15, 15, 10,  5, -5,-10,-15,-15,
                               10, 10, 10,  5, -5,-10,-10,-10,
                                5,  5,  5,  5, -5, -5, -5, -5,
                               -5, -5, -5, -5,  5,  5,  5,  5,
                              -10,-10,-10, -5,  5, 10, 10, 10,
                              -15,-15,-10, -5,  5, 10, 15, 15,
                              -20,-15,-10, -5,  5, 10, 15, 20};

  int       b_n_mate_light_squares[64] =
                             {-20,-15,-10, -5,  5, 10, 15, 20,
                              -15,-15,-10, -5,  5, 10, 15, 15,
                              -10,-10,-10, -5,  5, 10, 10, 10,
                               -5, -5, -5, -5,  5,  5,  5,  5,
                                5,  5,  5,  5, -5, -5, -5, -5,
                               10, 10, 10,  5, -5,-10,-10,-10,
                               15, 15, 10,  5, -5,-10,-15,-15,
                               20, 15, 10,  5, -5,-10,-15,-20};

  int       mate[64] =        {28, 26, 24, 22, 22, 24, 26, 28,
                               26, 16, 14, 12, 12, 14, 16, 26,
                               24, 14,  4,  2,  2,  4, 14, 24,
                               22, 12,  2,  0,  0,  2, 12, 22,
                               22, 12,  2,  0,  0,  2, 12, 22,
                               24, 14,  4,  2,  2,  4, 14, 24,
                               26, 16, 14, 12, 12, 14, 16, 26,
                               28, 26, 24, 22, 22, 24, 26, 28};

  char            white_outpost[64] = { 0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 2, 2, 0, 0, 0,
                                        0, 0, 4, 5, 5, 4, 0, 0,
                                        0, 0, 3, 6, 6, 3, 0, 0,
                                        0, 0, 0, 1, 1, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0 };

  char            black_outpost[64] = { 0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 1, 1, 0, 0, 0,
                                        0, 0, 3, 6, 6, 3, 0, 0,
                                        0, 0, 4, 5, 5, 4, 0, 0,
                                        0, 0, 0, 2, 2, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0, 0, 0, 0, 0, 0 };

  char           push_extensions[64] = { 0, 0, 0, 0, 0, 0, 0, 0,
                                         1, 1, 1, 1, 1, 1, 1, 1,
                                         0, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0,
                                         1, 1, 1, 1, 1, 1, 1, 1,
                                         0, 0, 0, 0, 0, 0, 0, 0 };

  int    pawn_value_b[64] = { 0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  3,  3,  3,  3,  0,  0,
                              0,  0,  3,  3,  3,  3,  0,  0,
                              0,  0,  0,  3,  3,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0};

  int    pawn_value_w[64] = { 0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  3,  3,  0,  0,  0,
                              0,  0,  3,  3,  3,  3,  0,  0,
                              0,  0,  3,  3,  3,  3,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0,
                              0,  0,  0,  0,  0,  0,  0,  0};

  int  knight_value_w[64] = { -9, -3, -3, -2, -2, -3, -3,  -9,
                              -5, -3, -1,  0,  0, -1, -3,  -5,
                              -6,  0,  1,  1,  1,  1,  0,  -6,
                              -5,  0,  1,  2,  2,  1,  0,  -5,
                              -5,  0,  1,  2,  2,  1,  0,  -5,
                              -5,  0,  1,  1,  1,  1,  0,  -5,
                              -5,  0,  0,  0,  0,  0,  0,  -5,
                             -10, -5, -5, -5, -5, -5, -5, -10};

  int  knight_value_b[64] ={ -10, -5, -5, -5, -5, -5, -5, -10,
                              -5,  0,  0,  0,  0,  0,  0,  -5,
                              -5,  0,  1,  1,  1,  1,  0,  -5,
                              -5,  0,  1,  2,  2,  1,  0,  -5,
                              -5,  0,  1,  2,  2,  1,  0,  -5,
                              -6,  0,  1,  1,  1,  1,  0,  -6,
                              -5, -3, -1,  0,  0, -1, -3,  -5,
                              -9, -3, -3, -2, -2, -3, -3,  -9};

  int  bishop_value_w[64] = { -3, -3, -3, -3, -3, -3, -3, -3,
                              -3,  0,  0,  0,  0,  0,  0, -3,
                              -3,  0,  2,  2,  2,  2,  0, -2,
                              -3,  0,  2,  3,  3,  2,  0, -3,
                              -3,  0,  2,  3,  3,  2,  0, -3,
                              -3,  0,  2,  2,  2,  2,  0, -3,
                              -3,  0,  0,  0,  0,  0,  0, -3,
                              -3, -3, -3, -3, -3, -3, -3, -3};

  int  bishop_value_b[64] = { -3, -3, -3, -3, -3, -3, -3, -3,
                              -3,  0,  0,  0,  0,  0,  0, -3,
                              -3,  0,  2,  2,  2,  2,  0, -3,
                              -3,  0,  2,  3,  3,  2,  0, -3,
                              -3,  0,  2,  3,  3,  2,  0, -3,
                              -3,  0,  2,  2,  2,  2,  0, -3,
                              -3,  0,  0,  0,  0,  0,  0, -3,
                              -3, -3, -3, -3, -3, -3, -3, -3};
 
  int    rook_value_w[64] = {  0,  2,  3,  4,  4,  3,  2,  0,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                               0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0};

  int    rook_value_b[64] = {  0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0,
                               0,  2,  3,  4,  4,  3,  2,  0,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                              -4,  2,  3,  4,  4,  3,  2, -4,
                               0,  2,  3,  4,  4,  3,  2,  0};

  int   queen_value_w[64] = {  0,  0,  0,  0,  0,  0,  0,  0,
                               0,  2,  2,  2,  2,  2,  2,  0,
                               0,  2,  4,  5,  5,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  5,  5,  4,  2,  0,
                               0,  0,  0,  0,  0,  0,  0,  0};

  int   queen_value_b[64] = {  0,  0,  0,  0,  0,  0,  0,  0,
                               0,  2,  4,  5,  5,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  6,  6,  4,  2,  0,
                               0,  2,  4,  5,  5,  4,  2,  0,
                               0,  2,  2,  2,  2,  2,  2,  0,
                               0,  0,  0,  0,  0,  0,  0,  0};

  int    king_value_w[64] = { -3,  0,  0,  0,  0,  0,  0, -3,
                               0,  0,  3,  3,  3,  3,  0,  0,
                               0,  3,  3,  5,  5,  3,  3,  0,
                               0,  3,  5,  8,  8,  5,  3,  0,
                               0,  3,  5,  8,  8,  5,  3,  0,
                               0,  3,  3,  5,  5,  3,  3,  0,
                               0,  0,  3,  3,  3,  3,  0,  0,
                              -3,  0,  0,  0,  0,  0,  0, -3};

  int    king_value_b[64] = { -3,  0,  0,  0,  0,  0,  0, -3,
                               0,  0,  3,  3,  3,  3,  0,  0,
                               0,  3,  3,  5,  5,  3,  3,  0,
                               0,  3,  5,  8,  8,  5,  3,  0,
                               0,  3,  5,  8,  8,  5,  3,  0,
                               0,  3,  3,  5,  5,  3,  3,  0,
                               0,  0,  3,  3,  3,  3,  0,  0,
                              -3,  0,  0,  0,  0,  0,  0, -3};

   char king_defects_w[64]= { 4, 3, 2, 3, 3, 1, 1, 2,
                              4, 3, 3, 7, 7, 3, 2, 2,
                              6, 4, 6, 7, 7, 6, 4, 6,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8};

   char king_defects_b[64]= { 8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              8, 5, 6, 8, 8, 6, 5, 8,
                              6, 4, 6, 7, 7, 6, 4, 6,
                              4, 3, 3, 7, 7, 3, 2, 2,
                              4, 3, 2, 3, 3, 1, 1, 2};

  int       p_values[15] =       {QUEEN_VALUE,ROOK_VALUE,BISHOP_VALUE,0,
                                  KING_VALUE,KNIGHT_VALUE,PAWN_VALUE,
                                  0,PAWN_VALUE,KNIGHT_VALUE,KING_VALUE,
                                  0, BISHOP_VALUE,ROOK_VALUE,QUEEN_VALUE};

  int       unblocked_pawns[9] = {-PAWN_UNBLOCKED*2,0,PAWN_UNBLOCKED,
                                   PAWN_UNBLOCKED*2, PAWN_UNBLOCKED*3,
                                   PAWN_UNBLOCKED*4, PAWN_UNBLOCKED*5,
                                   PAWN_UNBLOCKED*6, PAWN_UNBLOCKED*7};

  int            bishop_shift_rl45[64] = { 63, 61, 58, 54, 49, 43, 36, 28,
                                           61, 58, 54, 49, 43, 36, 28, 21,
                                           58, 54, 49, 43, 36, 28, 21, 15,
                                           54, 49, 43, 36, 28, 21, 15, 10,
                                           49, 43, 36, 28, 21, 15, 10,  6,
                                           43, 36, 28, 21, 15, 10,  6,  3,
                                           36, 28, 21, 15, 10,  6,  3,  1,
                                           28, 21, 15, 10,  6,  3,  1,  0 };

  int            bishop_shift_rr45[64] = { 28, 36, 43, 49, 54, 58, 61, 63,
                                           21, 28, 36, 43, 49, 54, 58, 61,
                                           15, 21, 28, 36, 43, 49, 54, 58,
                                           10, 15, 21, 28, 36, 43, 49, 54,
                                            6, 10, 15, 21, 28, 36, 43, 49,
                                            3,  6, 10, 15, 21, 28, 36, 43,
                                            1,  3,  6, 10, 15, 21, 28, 36,
                                            0,  1,  3,  6, 10, 15, 21, 28 };
