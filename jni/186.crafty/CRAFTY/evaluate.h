#if !defined(EVALUATE_INCLUDED)
#  define    EVALUATE_INCLUDED
 
#  define                                 DRAW           (0)

#  define                       PAWN_UNBLOCKED           (4)
#  define                         PAWN_BLOCKED           (1)
#  define                        PAWN_ISOLATED          (12)
#  define                         PAWN_DOUBLED           (2)
#  define                         PAWN_WEAK_P1           (7)
#  define                         PAWN_WEAK_P2          (11)
#  define                          PAWN_PASSED           (4)
#  define           PAWN_PROTECTED_PASSER_WINS          (11)
#  define                         CENTER_PAWNS           (5)
 
#  define                       PAWN_ADVANCE_A          (-1)
#  define                       PAWN_ADVANCE_B          (-1)
#  define                       PAWN_ADVANCE_C           (1)
#  define                       PAWN_ADVANCE_D           (1)
#  define                       PAWN_ADVANCE_E           (1)
#  define                       PAWN_ADVANCE_F          (-1)
#  define                       PAWN_ADVANCE_G          (-1)
#  define                       PAWN_ADVANCE_H          (-1)
 
#  define                    PAWN_ADVANCE_BC_A          (-1)
#  define                    PAWN_ADVANCE_BC_B          (-1)
#  define                    PAWN_ADVANCE_BC_C           (1)
#  define                    PAWN_ADVANCE_BC_D           (1)
#  define                    PAWN_ADVANCE_BC_E           (1)
#  define                    PAWN_ADVANCE_BC_F          (-1)
#  define                    PAWN_ADVANCE_BC_G          (-1)
#  define                    PAWN_ADVANCE_BC_H          (-1)

#  define                    PAWN_ADVANCE_KING           (1)
  
#  define                    PAWN_ADVANCE_EG_A           (1)
#  define                    PAWN_ADVANCE_EG_B           (1)
#  define                    PAWN_ADVANCE_EG_C           (1)
#  define                    PAWN_ADVANCE_EG_D           (1)
#  define                    PAWN_ADVANCE_EG_E           (1)
#  define                    PAWN_ADVANCE_EG_F           (1)
#  define                    PAWN_ADVANCE_EG_G           (1)
#  define                    PAWN_ADVANCE_EG_H           (1)

#  define          PAWN_CONNECTED_PASSED_6TH (PAWN_VALUE+20)
  
#  define          PAWN_SUPPORTED_PASSED_RANK2           (0)
#  define          PAWN_SUPPORTED_PASSED_RANK3           (0)
#  define          PAWN_SUPPORTED_PASSED_RANK4           (0)
#  define          PAWN_SUPPORTED_PASSED_RANK5           (8)
#  define          PAWN_SUPPORTED_PASSED_RANK6          (20)
#  define          PAWN_SUPPORTED_PASSED_RANK7          (40)

#  define                  KNIGHT_KING_TROPISM           (3)
#  define                  BISHOP_KING_TROPISM           (3)
#  define                    ROOK_KING_TROPISM           (5)
#  define                   QUEEN_KING_TROPISM          (10)
  
#  define                       KNIGHT_OUTPOST           (2)
  
#  define                       BISHOP_TRAPPED         (150)
#  define                       BISHOP_OUTPOST           (2)
#  define                      BISHOP_MOBILITY           (1)
#  define                          BISHOP_PAIR          (10)
  
#  define                          ROOK_ON_7TH          (10)
#  define                    ROOK_ABSOLUTE_7TH          (15)
#  define              ROOK_CONNECTED_7TH_RANK          (15)
#  define                       ROOK_OPEN_FILE           (7)
#  define             ROOK_CONNECTED_OPEN_FILE           (3)
#  define              ROOK_BEHIND_PASSED_PAWN           (3)
#  define                         ROOK_TRAPPED          (15)
#  define                       ROOK_WEAK_PAWN           (3)
  
#  define               QUEEN_ROOK_ON_7TH_RANK          (20)
 
#  define              KING_SAFETY_GOOD_BISHOP           (2)
#  define                KING_SAFETY_MATE_G2G7           (3)
#  define              KING_SAFETY_MATE_THREAT          (50)
#  define                KING_SAFETY_OPEN_FILE           (3)
#  define                       KING_BACK_RANK           (5)
#  define          KING_SAFETY_PAWN_ATTACK_4TH           (3)
#  define          KING_SAFETY_PAWN_ATTACK_5TH           (4)
#  define              KING_SAFETY_PAWN_ATTACK           (3)
#  define                KING_SAFETY_STONEWALL           (4)
 
#  define                  KING_SAFETY_RP_ADV1           (1)
#  define                  KING_SAFETY_RP_ADV2           (2)
#  define               KING_SAFETY_RP_TOO_FAR           (2)
#  define               KING_SAFETY_RP_MISSING           (3)
#  define             KING_SAFETY_RP_FILE_OPEN           (3)
 
#  define                  KING_SAFETY_NP_ADV1           (1)
#  define                  KING_SAFETY_NP_ADV2           (2)
#  define               KING_SAFETY_NP_TOO_FAR           (3)
#  define               KING_SAFETY_NP_MISSING           (4)
#  define             KING_SAFETY_NP_FILE_OPEN           (3)
 
#  define                  KING_SAFETY_BP_ADV1           (1)
#  define                  KING_SAFETY_BP_ADV2           (1)
#  define               KING_SAFETY_BP_TOO_FAR           (2)
#  define               KING_SAFETY_BP_MISSING           (2)
#  define             KING_SAFETY_BP_FILE_OPEN           (2)

#  define               KING_SAFETY_RP_BP_ADV1           (2)
 
#  define                 DEVELOPMENT_THEMATIC           (2)
#  define                  DEVELOPMENT_UNMOVED           (4)
#  define             DEVELOPMENT_BLOCKED_PAWN           (6)
#  define            DEVELOPMENT_LOSING_CASTLE          (20)
#  define              DEVELOPMENT_NOT_CASTLED          (10)
#  define              DEVELOPMENT_QUEEN_EARLY           (5)
 
#  define                         TRADE_PIECES           (3)
#  define                          TRADE_PAWNS           (9)

#endif
