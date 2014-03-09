/*SPEC 
  DEC C objects to items being defined both here and in data.c.
  Three things have been done to solve this:
     1. Items initialized in data.c have been commented out
     2. data.c has been included 
     3. data.c has been removed from the list of objects in the Makefile
  j.henning 18/mar/98 
*/

#include "data.h"        /*SPEC*/

//#if !defined(DATA_INCLUDED)

#  define DATA_INCLUDED

   extern char           version[6];

/*SPEC    PLAYING_MODE   mode;  */
/*SPEC    int            batch_mode;  */
/*SPEC    int            crafty_rating;  */
/*SPEC    int            opponent_rating;  */
/*SPEC    int            number_auto_kibitzers;  */
/*SPEC    int            number_of_computers;  */
/*SPEC    int            number_of_GMs;  */
/*SPEC    int            number_of_IMs;  */
/*SPEC    int            time_used;  */
/*SPEC    int            time_used_opponent;  */
/*SPEC    int            auto_kibitzing;  */
   int            total_moves;
/*SPEC    int            initialized;  */
/*SPEC    int            early_exit;  */
/*SPEC    int            new_game;  */
/*SPEC    char           auto_kibitz_list[100][20];  */
/*SPEC    char           GM_list[100][20];  */
/*SPEC    char           IM_list[100][20];  */
/*SPEC    char           computer_list[100][20];  */
   FILE           *input_stream;
   FILE           *book_file;
   FILE           *books_file;
   FILE           *history_file;
   FILE           *log_file;
   FILE           *auto_file;
   FILE           *book_lrn_file;
   FILE           *position_file;
   FILE           *position_lrn_file;
/*SPEC    int            log_id;  */
/*SPEC    int            output_format;  */
/*SPEC    int            EGTBlimit;  */
   char           whisper_text[500];
   int            whisper_value;
   int            whisper_depth;
   int            last_mate_score;
/*SPEC    int            last_opponent_move;  */

/*SPEC    char           pgn_event[32];  */
/*SPEC    char           pgn_date[32];  */
/*SPEC    char           pgn_round[32];  */
/*SPEC    char           pgn_site[32];  */
/*SPEC    char           pgn_white[64];  */
/*SPEC    char           pgn_white_elo[32];  */
/*SPEC    char           pgn_black[64];  */
/*SPEC    char           pgn_black_elo[32];  */
/*SPEC    char           pgn_result[32];  */
   char           log_filename[64];
   char           history_filename[64];

   int            number_of_solutions;
   int            solutions[10];
   int            solution_type;
/*SPEC    int            default_draw_score;  */
/*SPEC    int            over;  */
/*SPEC    int            ics;  */
   int            auto232;
   int            auto232_delay;
/*SPEC    int            xboard;  */
/*SPEC    int            whisper;  */
/*SPEC    int            channel;  */
/*SPEC    char           channel_title[32];  */
   char           book_path[128];
   char           log_path[128];
   char           tb_path[128];
   char           cmd_buffer[512];
   char           *args[32];
   char           buffer[512];
   int            nargs;
/*SPEC    int            kibitz;  */
/*SPEC    int            move_number;  */
/*SPEC    int            wtm;  */
/*SPEC    int            crafty_is_white;  */
   int            iteration_depth;
   int            last_search_value;
   int            previous_search_value;
   int            search_failed_high;
   int            search_failed_low;
/*SPEC    int            largest_positional_score;  */
   int            root_alpha;
   int            root_beta;
   int            root_value;
   int            root_wtm;
   int            root_move;
   int            root_total_white_pieces;
   int            root_total_white_pawns;
   int            root_total_black_pieces;
   int            root_total_black_pawns;
/*SPEC    int            nodes_per_second;  */
   int            cpu_percent;

   int            tb_probes;
   int            tb_probes_successful;

/*SPEC    int            opening;  */
/*SPEC    int            middle_game;  */
/*SPEC    int            end_game;  */
/*SPEC    int            analyze_mode;  */
/*SPEC    int            annotate_mode;  */
/*SPEC    int            test_mode;  */
/*SPEC    int            analyze_move_read;  */
/*SPEC    signed char    resign;  */
/*SPEC    signed char    resign_counter;  */
/*SPEC    signed char    resign_count;  */
/*SPEC    signed char    draw_counter;  */
/*SPEC    signed char    draw_count;  */
/*SPEC    char           audible_alarm;  */
   char           hint[16];
/*SPEC    int            post;  */
/*SPEC    int            search_depth;  */
/*SPEC    int            search_move;  */
   int            easy_move;
/*SPEC    TIME_TYPE      time_type;  */
/*SPEC    int            time_limit;  */
   int            absolute_time_limit;
   int            search_time_limit;
/*SPEC    int            nodes_between_time_checks;  */
   int            next_time_check;

   int            time_abort;

#if 0 /*SPEC*/
   signed char    pondering;   /* program is thinking on opponent's time */  
   signed char    thinking;    /* program is searching on its time       */ 
   signed char    puzzling;    /* program is puzzling about a move to ponder */
   signed char    booking;     /* program is searching, following book moves */ 
#endif

   signed char    abort_search;
/*SPEC    int            ponder;  */
   int            ponder_move;
   int            made_predicted_move;
/*SPEC    int            force;  */
   int            ponder_moves[220];
   int            num_ponder_moves;
/*SPEC    char           initial_position[80];  */

   unsigned int   opponent_start_time, opponent_end_time;
   unsigned int   program_start_time, program_end_time;
   unsigned int   start_time, end_time;
   unsigned int   elapsed_start, elapsed_end;
   unsigned int   nodes_searched;
   unsigned int   evaluations;
/*SPEC    int            predicted;  */
/*SPEC    signed char    transposition_id;  */
   int            transposition_probes;
   int            transposition_hits;
   int            pawn_probes;
   int            pawn_hits;
   int            check_extensions_done;
   int            recapture_extensions_done;
   int            passed_pawn_extensions_done;
   int            one_reply_extensions_done;

/*SPEC    int            ansi;  */
/*SPEC    int            trace_level;  */
/*SPEC    int            verbosity_level;  */
   int            burp;
/*SPEC    unsigned int   noise_level;  */

   int            book_move;
/*SPEC    int            moves_out_of_book;  */
/*SPEC    int            book_accept_mask;  */
/*SPEC    int            book_reject_mask;  */
/*SPEC    int            book_random;  */
/*SPEC    int            book_search_trigger;  */
/*SPEC    int            book_selection_width;  */
/*SPEC    int            show_book;  */
/*SPEC    int            learning;  */

/*SPEC    int            tc_moves;  */
/*SPEC    int            tc_time;  */
/*SPEC    int            tc_time_remaining;  */
/*SPEC    int            tc_time_remaining_opponent;  */
/*SPEC    int            tc_moves_remaining;  */
/*SPEC    int            tc_secondary_moves;  */
/*SPEC    int            tc_secondary_time;  */
/*SPEC    int            tc_increment;  */
/*SPEC    int            tc_sudden_death;  */
/*SPEC    int            tc_operator_time;  */
/*SPEC    int            tc_safety_margin;  */
/*SPEC    int            draw_score_is_zero;  */
/*SPEC    int            usage_level;  */

   int            log_hash;
/*SPEC    int            log_pawn_hash;  */
/*SPEC    int            hash_table_size;  */
   int            pawn_hash_table_size;

   int            hash_maska;
   int            hash_maskb;
   unsigned int   pawn_hash_mask;
   HASH_ENTRY      *trans_ref_wa;
   HASH_ENTRY      *trans_ref_wb;
   HASH_ENTRY      *trans_ref_ba;
   HASH_ENTRY      *trans_ref_bb;
   PAWN_HASH_ENTRY *pawn_hash_table;

   int            hash_move[MAXPLY];
   int            history_w[4096], history_b[4096];
   int            killer_move1[MAXPLY];
   int            killer_move2[MAXPLY];
   int            killer_count1[MAXPLY];
   int            killer_count2[MAXPLY];
   BITBOARD       replist_w[50+MAXPLY/2];
   BITBOARD       replist_b[50+MAXPLY/2];
   BITBOARD       *rephead_w;
   BITBOARD       *rephead_b;

   int            unblocked_pawns[9];
   int            p_values[15];
   int            current_move[MAXPLY];
   int            *last[MAXPLY];
   signed char    in_check[MAXPLY];
   signed char    extended_reason[MAXPLY];
   signed char    current_phase[MAXPLY];
   int            move_list[5120];
   int            sort_value[256];
   signed char    searched_this_root_move[256];
   unsigned int   root_nodes[256];
   CHESS_PATH     pv[MAXPLY];
   CHESS_PATH     last_pv;
   int            last_value;
   NEXT_MOVE      next_status[MAXPLY];
   SEARCH_POSITION position[MAXPLY+2];
   BITBOARD       save_hash_key[MAXPLY+2];
   unsigned int   save_pawn_hash_key[MAXPLY+2];

   char           white_outpost[64];
   char           black_outpost[64];
   char           square_color[64];
   int            passed_pawn_value[8];
   int            supported_passer[8];
   int            reduced_material_passer[20];
   int            pawn_advance[8];
   int            outside_passed[128];
   int            pawn_value_w[64];
   int            pawn_value_b[64];
   int            knight_value_w[64];
   int            knight_value_b[64];
   int            bishop_value_w[64];
   int            bishop_value_b[64];
   int            rook_value_w[64];
   int            rook_value_b[64];
   int            queen_value_w[64];
   int            queen_value_b[64];
   int            king_value_w[64];
   int            king_value_b[64];
   char           king_defects_w[64];
   char           king_defects_b[64];

   int            b_n_mate_dark_squares[64];
   int            b_n_mate_light_squares[64];
   int            mate[64];

   char           push_extensions[64];

   signed char    directions[64][64];
   BITBOARD       w_pawn_attacks[64];
   BITBOARD       b_pawn_attacks[64];
   BITBOARD       knight_attacks[64];
   BITBOARD       bishop_attacks[64];
   BITBOARD       bishop_attacks_rl45[64][256];
   BITBOARD       bishop_attacks_rr45[64][256];
   int            bishop_mobility_rl45[64][256];
   int            bishop_mobility_rr45[64][256];
   int            bishop_shift_rl45[64];
   int            bishop_shift_rr45[64];
   BITBOARD       rook_attacks[64];
   BITBOARD       rook_attacks_r0[64][256];
   BITBOARD       rook_attacks_rl90[64][256];
   int            rook_mobility_r0[64][256];
   int            rook_mobility_rl90[64][256];

   CHESS_POSITION search;
   CHESS_POSITION display;

   BITBOARD       queen_attacks[64];
   BITBOARD       king_attacks[64];
   BITBOARD       king_attacks_1[64];
   BITBOARD       king_attacks_2[64];
   BITBOARD       obstructed[64][64];

   unsigned int   w_pawn_random32[64];
   unsigned int   b_pawn_random32[64];
   BITBOARD       w_pawn_random[64];
   BITBOARD       b_pawn_random[64];
   BITBOARD       w_knight_random[64];
   BITBOARD       b_knight_random[64];
   BITBOARD       w_bishop_random[64];
   BITBOARD       b_bishop_random[64];
   BITBOARD       w_rook_random[64];
   BITBOARD       b_rook_random[64];
   BITBOARD       w_queen_random[64];
   BITBOARD       b_queen_random[64];
   BITBOARD       w_king_random[64];
   BITBOARD       b_king_random[64];
   BITBOARD       enpassant_random[65];
   BITBOARD       castle_random_w[2];
   BITBOARD       castle_random_b[2];
   BITBOARD       wtm_random[2];
   BITBOARD       endgame_random_w;
   BITBOARD       endgame_random_b;
   BITBOARD       w_rooks_random;
   BITBOARD       b_rooks_random;

   BITBOARD       clear_mask[65];
   BITBOARD       clear_mask_rl45[65];
   BITBOARD       clear_mask_rr45[65];
   BITBOARD       clear_mask_rl90[65];
   BITBOARD       set_mask[65];
   BITBOARD       set_mask_rl45[65];
   BITBOARD       set_mask_rr45[65];
   BITBOARD       set_mask_rl90[65];
   BITBOARD       file_mask[8];
   BITBOARD       rank_mask[8];
   BITBOARD       mask_not_rank8;
   BITBOARD       mask_not_rank1;
   BITBOARD       right_side_mask[8];
   BITBOARD       left_side_mask[8];
   BITBOARD       right_side_empty_mask[8];
   BITBOARD       left_side_empty_mask[8];
   BITBOARD       right_half_mask, left_half_mask;
   BITBOARD       mask_abs7_w, mask_abs7_b;
   BITBOARD       pawns_cramp_black;
   BITBOARD       pawns_cramp_white;
   BITBOARD       mask_advance_2_w;
   BITBOARD       mask_advance_2_b;
   BITBOARD       mask_left_edge;
   BITBOARD       mask_right_edge;
   BITBOARD       mask_corner_squares;
   BITBOARD       promote_mask_w;
   BITBOARD       promote_mask_b;
   BITBOARD       mask_G2G3;
   BITBOARD       mask_B2B3;
   BITBOARD       mask_G6G7;
   BITBOARD       mask_B6B7;
   BITBOARD       mask_F3H3;
   BITBOARD       mask_F6H6;
   BITBOARD       mask_A3C3;
   BITBOARD       mask_A6C6;
   BITBOARD       mask_A7H7;
   BITBOARD       mask_A2H2;
   BITBOARD       center;

   BITBOARD       stonewall_white;
   BITBOARD       stonewall_black;

   BITBOARD       mask_kr_trapped_w[3];
   BITBOARD       mask_qr_trapped_w[3];
   BITBOARD       mask_kr_trapped_b[3];
   BITBOARD       mask_qr_trapped_b[3];

   BITBOARD       good_bishop_kw;
   BITBOARD       good_bishop_qw;
   BITBOARD       good_bishop_kb;
   BITBOARD       good_bishop_qb;

   BITBOARD       light_squares;
   BITBOARD       dark_squares;
   BITBOARD       not_rook_pawns;

   BITBOARD       plus1dir[65];
   BITBOARD       plus7dir[65];
   BITBOARD       plus8dir[65];
   BITBOARD       plus9dir[65];
   BITBOARD       minus1dir[65];
   BITBOARD       minus7dir[65];
   BITBOARD       minus8dir[65];
   BITBOARD       minus9dir[65];

   BITBOARD       mask_eptest[64];
#  if !defined(CRAY1)
     BITBOARD       mask_1;
     BITBOARD       mask_2;
     BITBOARD       mask_3;
     BITBOARD       mask_4;
     BITBOARD       mask_8;
     BITBOARD       mask_16;
     BITBOARD       mask_32;
     BITBOARD       mask_72;
     BITBOARD       mask_80;
     BITBOARD       mask_85;
     BITBOARD       mask_96;
     BITBOARD       mask_107;
     BITBOARD       mask_108;
     BITBOARD       mask_112;
     BITBOARD       mask_118;
     BITBOARD       mask_120;
     BITBOARD       mask_121;
     BITBOARD       mask_127;
#  endif
   BITBOARD       mask_clear_entry;
#  if !defined(CRAY1)
     unsigned char  first_ones[65536];
     unsigned char  last_ones[65536];
#  endif
   unsigned char  first_ones_8bit[256];
   unsigned char  last_ones_8bit[256];
   unsigned char  connected_passed[256];

   BITBOARD       mask_kingside_attack_w1;
   BITBOARD       mask_kingside_attack_w2;
   BITBOARD       mask_kingside_attack_b1;
   BITBOARD       mask_kingside_attack_b2;
   BITBOARD       mask_queenside_attack_w1;
   BITBOARD       mask_queenside_attack_w2;
   BITBOARD       mask_queenside_attack_b1;
   BITBOARD       mask_queenside_attack_b2;

   BITBOARD       mask_pawn_protected_b[64];
   BITBOARD       mask_pawn_protected_w[64];
   BITBOARD       mask_pawn_isolated[64];
   BITBOARD       mask_pawn_passed_w[64];
   BITBOARD       mask_pawn_passed_b[64];
   BITBOARD       mask_promotion_threat_w[64];
   BITBOARD       mask_promotion_threat_b[64];
   BITBOARD       mask_pawn_connected[64];
   BITBOARD       mask_no_pawn_attacks_w[64];
   BITBOARD       mask_no_pawn_attacks_b[64];
   BITBOARD       mask_a1_corner;
   BITBOARD       mask_a8_corner;
   BITBOARD       mask_h1_corner;
   BITBOARD       mask_h8_corner;
   BITBOARD       white_minor_pieces;
   BITBOARD       black_minor_pieces;
   BITBOARD       white_center_pawns;
   BITBOARD       black_center_pawns;
   BITBOARD       white_pawn_race_wtm[64];
   BITBOARD       white_pawn_race_btm[64];
   BITBOARD       black_pawn_race_wtm[64];
   BITBOARD       black_pawn_race_btm[64];

   BITBOARD       mask_wk_4th, mask_wq_4th, mask_bk_4th, mask_bq_4th;
   BITBOARD       mask_wk_5th, mask_wq_5th, mask_bk_5th, mask_bq_5th;
//#endif

