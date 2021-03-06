/*
********************************************************************************
*                                                                              *
*   configuration information:  the following variables need to be set to      *
*   indicate the machine configuration/capabilities.                           *
*                                                                              *
*   there are pre-defined machine types for the following machines: (1) SUN    *
*   (2) DOS (3) ALPHA [DEC Alpha] (4) CRAY  (5) LINUX.  defining any of these  *
*   names will produce a runnable executable.  for other machines, the names   *
*   explained below must be individually DEFINED or UNDEFINED as needed.       *
*                                                                              *
*   LONG_HAS_64BITS: define this if the data type "long [int]" is represented  *
*   in 64 bits either as the compiler's default option or by an appropriate    *
*   switch(e.g. -Klp64)                                                        *  
*                                                                              *
*   HAS_LONGLONG:  define this if the C compilation system supports the data-  *
*   type "long long"(which is an extension to ANSI C) and represents data of   *
*   this type with 64 bits and allows bitwise operations on this data type.    *
*   This provides significantly faster execution time as the bitwise operators *
*   are done by the compiler rather than by procedure calls.                   *
*                                                                              *
*   LITTLE_ENDIAN_ARCH:  define for a 32-bit machine that mangles the way data *
*   is stored within a word.  This is currently true for all PC class machines *
*   and false for other processors used in current workstations (SUN, etc.)    *
*                                                                              *
*   UNIX:  define this if the program is being run on a unix-based system,     *
*   which causes the executable to use unix-specific runtime utilities.        *
*                                                                              *
********************************************************************************
*/

#include <stdio.h>

#if !defined(TYPES_INCLUDED)
#  define TYPES_INCLUDED

#if defined(AIX)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(SIEMENS_MIPS)
#  undef LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define  HAS_LONGLONG       /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order          */
#  define UNIX                /* system is unix-based                        */
#endif
#if defined(ALPHA)
#  define LONG_HAS_64BITS     /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  undef  HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(AMIGA)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  undef  UNIX                 /* system is unix-based                       */
#endif
#if defined(CRAY1)
#  define LONG_HAS_64BITS     /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  undef  HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(DOS)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  undef  UNIX                 /* system is unix-based                       */
#endif
#if defined(FreeBSD)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(HP)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                      */
#endif
#if defined(LINUX_i386)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* machine has 32-bit/64-bit integers         */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                      */
#  define LINUX
#endif
#if defined(LINUX_PPC32)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                      */
#  define LINUX
#endif
#if defined(MIPS)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order        */
#  define UNIX                 /* system is unix-based                      */
#endif
#if defined(NEXT)
#  undef  LONG_HAS_64BITS     /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG        /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH  /* machine stores bytes in "PC" order          */
#  define UNIX                /* system is unix-based                        */
#endif
#if defined(NT_AXP)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  undef  UNIX                 /* system is unix-based                       */
#endif
#if defined(NT_i386)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  undef  UNIX                 /* system is unix-based                       */
#endif
#if defined(SGI)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(SOLARIS_X64) || defined(SOLARIS_X86)
#  if defined(SOLARIS_X64)
#    define LONG_HAS_64BITS
#  else
#    undef  LONG_HAS_64BITS
#  endif
#  define HAS_LONGLONG
#  define LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#elif defined(SUN)
#  if defined(SPEC_CPU2000_LP64)
#    define LONG_HAS_64BITS
#  else
#    undef  LONG_HAS_64BITS
#  endif
#  define HAS_LONGLONG
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in network order      */
#  define UNIX                 /* system is unix-based                       */
#endif
#if defined(LINUX_SPARC)
# undef LONG_HAS_64BITS        /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
# define HAS_LONGLONG          /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
# undef LITTLE_ENDIAN_ARCH     /* machine stores bytes in "PC" order         */
# define UNIX                  /* system is unix-based                       */
# define LINUX                 /* system is linix-based                      */
#endif
#if defined(SUN_BSD)
#  undef  LONG_HAS_64BITS      /* the data type "long [int]" is represented in 64 bits either as the compiler's default option or by an appropriate switch(e.g. -Klp64)  */
#  define HAS_LONGLONG         /* the C compilation system supports the data-type "long long"(which is an extension to ANSI C) and represents data of this type with 64 bits  */
#  undef  LITTLE_ENDIAN_ARCH   /* machine stores bytes in "PC" order         */
#  define UNIX                 /* system is unix-based                       */
#endif

/*
  fractional ply extensions.  these should be in units based on the
  value of INCREMENT_PLY (default is 60).  a value of 60 means this
  extension is exactly one ply.
*/

#  define INCREMENT_PLY            60  /* 1.00 */
#  define NULL_MOVE_DEPTH         120  /* 2.00 */
#  define RAZORING_DEPTH           60  /* 1.00 */
#  define IN_CHECK                 60  /* 1.00 */
#  define ONE_REPLY_TO_CHECK       45  /* 0.75 */
#  define RECAPTURE                60  /* 1.00 */
#  define PASSED_PAWN_PUSH         60  /* 1.00 */

#  define MATE                  32768
#  define PAWN_VALUE              100
#  define KNIGHT_VALUE            330
#  define BISHOP_VALUE            330
#  define ROOK_VALUE              520
#  define QUEEN_VALUE             980
#  define KING_VALUE            40000

#  define MAXPLY 65
  
#  if defined(LONG_HAS_64BITS)
     typedef unsigned long BITBOARD;
#  else
#    if defined(NT_i386) || defined(NT_AXP)
       typedef unsigned _int64 BITBOARD;
#    else
       typedef unsigned long long BITBOARD;
#    endif
#  endif

#include <time.h>
#if !defined(CLOCKS_PER_SEC)
#  define CLOCKS_PER_SEC 1000000
#endif
  typedef enum { A1,B1,C1,D1,E1,F1,G1,H1,
                 A2,B2,C2,D2,E2,F2,G2,H2,
                 A3,B3,C3,D3,E3,F3,G3,H3,
                 A4,B4,C4,D4,E4,F4,G4,H4,
                 A5,B5,C5,D5,E5,F5,G5,H5,
                 A6,B6,C6,D6,E6,F6,G6,H6,
                 A7,B7,C7,D7,E7,F7,G7,H7,
                 A8,B8,C8,D8,E8,F8,G8,H8,
                 BAD_SQUARE } squares;

  typedef enum {FILEA, FILEB, FILEC, FILED, FILEE, FILEF, FILEG, FILEH} files;

  typedef enum {RANK1, RANK2, RANK3, RANK4, RANK5, RANK6, RANK7, RANK8} ranks;

  typedef enum {empty=0, pawn=1, knight=2, king=3, 
                bishop=5, rook=6, queen=7} PIECE;
  
  typedef enum {empty_v=0, pawn_v=1, knight_v=2, 
                bishop_v=3, rook_v=5, queen_v=9} PIECE_V;
  
  typedef enum {no_extension=0, check_extension=1, recapture_extension=2,
                passed_pawn_extension=4, one_reply_extension=8} EXTENSIONS;
  
  typedef enum {cpu, elapsed, microseconds} TIME_TYPE;

  typedef enum {think=1, puzzle=2, book=3, annotate=4} SEARCH_TYPE;

  typedef enum {normal_mode, tournament_mode} PLAYING_MODE;

  typedef enum {crafty, opponent} PLAYER;

  typedef enum {book_learning=1, position_learning=2} LEARNING_MODE;
  
  typedef struct {
    unsigned char enpassant_target;
    signed   char w_castle;
    signed   char b_castle;
    unsigned char rule_50_moves;
  } SEARCH_POSITION;

  typedef  struct {
    BITBOARD       w_occupied;
    BITBOARD       b_occupied;
    BITBOARD       occupied_rl90;
    BITBOARD       occupied_rl45;
    BITBOARD       occupied_rr45;
    BITBOARD       rooks_queens;
    BITBOARD       bishops_queens;
    BITBOARD       w_pawn;
    BITBOARD       w_knight;
    BITBOARD       w_bishop;
    BITBOARD       w_rook;
    BITBOARD       w_queen;
    BITBOARD       b_pawn;
    BITBOARD       b_knight;
    BITBOARD       b_bishop;
    BITBOARD       b_rook;
    BITBOARD       b_queen;
    BITBOARD       hash_key;
    unsigned int   pawn_hash_key;
    int            material_evaluation;
    signed char    white_king;
    signed char    black_king;
    signed char    board[64];
    signed char    white_pieces;
    signed char    white_pawns;
    signed char    black_pieces;
    signed char    black_pawns;
    signed char    total_pieces;
  } CHESS_POSITION;
  
  typedef struct {
    BITBOARD word1;
    BITBOARD word2;
  } HASH_ENTRY;

  typedef struct {
    unsigned int key;
    short    p_score;
    unsigned char black_protected;
    unsigned char black_pof;
    unsigned char weak_b;
    unsigned char passed_b;
    unsigned char black_defects_k;
    unsigned char black_defects_q;
    unsigned char white_protected;
    unsigned char white_pof;
    unsigned char weak_w;
    unsigned char passed_w;
    unsigned char white_defects_k;
    unsigned char white_defects_q;
    unsigned char outside;
  } PAWN_HASH_ENTRY;
  
  typedef struct {
    int path[MAXPLY];
    unsigned char path_hashed;
    unsigned char path_length;
    unsigned char path_iteration_depth;
  } CHESS_PATH;
  
  typedef struct {
    int phase;
    int remaining;
    int *last;
  } NEXT_MOVE;

  typedef struct {
    BITBOARD position;
    BITBOARD status;
    int learn;
  } BOOK_POSITION;

/*  
    DO NOT modify these.  these are constants, used in multiple modules.
    modification may corrupt the search in any number of ways, all bad.
*/

#  define WORTHLESS                 0
#  define LOWER_BOUND               1
#  define UPPER_BOUND               2
#  define EXACT_SCORE               3
#  define AVOID_NULL_MOVE           4

#  define NULL_MOVE                 0
#  define DO_NULL                   1
#  define NO_NULL                   0

#  define NONE                      0
#  define FIRST_PHASE               1
#  define HASH_MOVE                 1
#  define GENERATE_CAPTURE_MOVES    2
#  define CAPTURE_MOVES             3
#  define KILLER_MOVE_1             4
#  define KILLER_MOVE_2             5
#  define GENERATE_ALL_MOVES        6
#  define SORT_ALL_MOVES            7  
#  define HISTORY_MOVES_1           8
#  define HISTORY_MOVES_2           9
#  define REMAINING_MOVES          10
#  define ROOT_MOVES               11
 
#  if !defined(CRAY1)
    BITBOARD     Mask(int);
    int          PopCnt(BITBOARD);
    int          FirstOne(BITBOARD);
    int          LastOne(BITBOARD);
#  endif
  
  void           Analyze();
  void           Annotate();
  int            Attacked(int, int);
  BITBOARD       AttacksFrom(int, int);
  BITBOARD       AttacksTo(int);
  int            Book(int,int);
  int            BookMask(char*);
  void           BookUp(char*,int,char**);
#  if defined(NT_i386) || defined(NT_AXP)
    int _cdecl     BookUpCompare(const void *, const void *);
#  else
    int            BookUpCompare(const void *, const void *);
#  endif
  int            CheckInput(void);
  void           ClearHashTables(void);
  void           ComputeAttacksAndMobility(void);
  void           Delay(int);
  void           DisplayBitBoard(BITBOARD);
  void           DisplayChessBoard(FILE*, CHESS_POSITION);
  char*          DisplayEvaluation(int);
  char*          DisplayEvaluationWhisper(int);
  void           DisplayFT(int, int, int);
  char*          DisplayHHMM(unsigned int);
  void           DisplayPieceBoards(int*, int*);
  char*          DisplayTime(unsigned int);
  char*          DisplayTimeWhisper(unsigned int);
  void           Display2BitBoards(BITBOARD, BITBOARD);
  void           DisplayChessMove(char*, int);
  int            DrawScore(void);
  int            Drawn(int);
  void           Edit(void);
  int            EnPrise(int, int);
  int            Evaluate(int, int, int, int);
  int            EvaluateDevelopment(int);
  int            EvaluateDraws();
  int            EvaluateMate(void);
  int            EvaluatePassedPawns(void);
  int            EvaluatePassedPawnRaces(int);
  int            EvaluatePawns(void);
  int*           GenerateCaptures(int, int, int*);
  int*           GenerateCheckEvasions(int, int, int*);
  int*           GenerateNonCaptures(int, int, int*);
  unsigned int   GetTime(TIME_TYPE);
  int            HasOpposition(int, int, int);
  void           HistoryBest(int, int, int);
  void           HistoryRefutation(int, int, int);
  void           Initialize(int);
  void           InitializeAttackBoards(void);
  void           InitializeChessBoard(SEARCH_POSITION*);
  int            InitializeFindAttacks(int, int, int);
  void           InitializeHashTables(void);
  void           InitializeMasks(void);
  void           InitializePawnMasks(void);
  void           InitializePieceMasks(void);
  void           InitializeRandomHash(void);
  void           InitializeZeroMasks(void);
  int            InputMove(char*, int, int, int, int);
  int            InputMoveICS(char*, int, int, int, int);
  BITBOARD       InterposeSquares(int, int, int);
  void           Interrupt(int);
  int            Iterate(int, int, int);
  int            KingPawnSquare(int, int, int, int);
  int            LookUp(int, int, int, int*, int*);
  void           MakeMove(int, int, int);
  void           MakeMoveRoot(int, int);
  void           NewGame(int);
  int            NextEvasion(int, int);
  int            NextMove(int, int);
  int            NextRootMove(int);
  char*          Normal(void);
  int            Option(void);
  int            OptionMatch(char*, char*);
  void           OptionPerft(int,int,int);
  char*          OutputMove(int*, int, int);
  char*          OutputMoveICS(int*);
  int            OutputGood(char*, int, int);
  int            ParseTime(char*);
  void           Phase(void);
  int            PinnedOnKing(int,int);
  int            Ponder(int);
  void           PreEvaluate(int);
  int            Quiesce(int, int, int, int);
  unsigned int   Random32(void);
  BITBOARD       Random64(void);
  int            Read(int, char*);
  int            ReadChessMove(FILE*, int, int);
  void           ReadClear();
  int            ReadNextMove(char*, int, int);
  int            ReadParse(char*, char *args[], char*);
  int            SpecReadRaw();
  int            RepetitionCheck(int,int);
  int            RepetitionDraw(int);
  void           ResignOrDraw(int,int);
  char*          Reverse(void);
  void           RootMoveList(int);
  int            Search(int, int, int, int, int, int);
  void           SearchOutput(int,int);
  int            SearchRoot(int, int, int, int);
  void           SearchTrace(int,int,int,int,int,char*,int);
  void           SetBoard(int,char**,int);
  void           SetChessBitBoards(SEARCH_POSITION*);
  void           StoreBest(int,int,int,int,int);
  void           StorePV(int,int);
  void           StoreRefutation(int,int,int,int);
  int            Swap(int, int, int);
  BITBOARD       SwapXray(BITBOARD, int, int);
  void           TimeAdjust(int,PLAYER);
  int            TimeCheck(int);
  void           TimeSet(int);
  void           UnMakeMove(int, int, int);
  void           ValidatePosition(int,int,char*);
  BITBOARD       ValidateComputeBishopAttacks(int);
  BITBOARD       ValidateComputeRookAttacks(int);
  int            ValidMove(int, int, int);
  void           Whisper(int, int, int, int, unsigned int, int, char*);
  
//#  if defined(LONG_HAS_64BITS) || defined(HAS_LONGLONG)
#    define And(a,b)    ((a) & (b))
#    define Or(a,b)     ((a) | (b))
#    define Xor(a,b)    ((a) ^ (b))
#    define Compl(a)    (~(a))
#    define Shiftl(a,b) ((a) << (b))
#    define Shiftr(a,b) ((a) >> (b))
#    if defined(CRAY1)
#      define PopCnt(a)     _popcnt(a)
#      define FirstOne(a)   _leadz(a)
#      define LastOne(a)    _leadz((a)^(a-1))
#      define Mask(a)       _mask(a)
#      define mask_1        _mask(1)
#      define mask_2        _mask(2)
#      define mask_3        _mask(3)
#      define mask_4        _mask(4)
#      define mask_8        _mask(8)
#      define mask_16       _mask(16)
#      define mask_32       _mask(32)
#      define mask_72       _mask(72)
#      define mask_80       _mask(80)
#      define mask_85       _mask(85)
#      define mask_96       _mask(96)
#      define mask_107      _mask(107)
#      define mask_108      _mask(108)
#      define mask_112      _mask(112)
#      define mask_118      _mask(118)
#      define mask_120      _mask(120)
#      define mask_121      _mask(121)
#      define mask_127      _mask(127)
#    endif
//#  endif

#  define ABSearch(alpha,beta,wtm,depth,ply,donull)              \
   (((depth) >= INCREMENT_PLY) ?                                 \
      Search(alpha,beta,wtm,depth,ply,donull) :                  \
      Quiesce(alpha,beta,wtm,ply))

#  define Max(a,b)  (((a) > (b)) ? (a) : (b))
#  define Min(a,b)  (((a) < (b)) ? (a) : (b))
#  define FileDistance(a,b) abs(((a)&7) - ((b)&7))
#  define RankDistance(a,b) abs(((a)>>3) - ((b)>>3))
#  define Distance(a,b) Max(FileDistance(a,b),RankDistance(a,b))

/*  
    the following macro is used to determine if one side is in check.  it
    simply returns the result of Attacked().
*/
#  define Check(wtm)                                                     \
    Attacked((wtm)?WhiteKingSQ:BlackKingSQ,ChangeSide(wtm))
/*  
    Attack() is used to determine if a newly promoted pawn (queen)
    attacks <square>.  normally <square> will be the location of the opposing
    king, but it can also be the location of the opposing side's queening
    square in case this pawn prevents the other pawn from safely queening on
    the next move.
*/
#  define Attack(square,queen,ply) !And(obstructed[square][queen],Occupied)
/*  
    the following macros are used to construct the attacks from a square.
    the attacks are computed as four separate bit vectors, one for each of the
    two diagonals, and one for the ranks and one for the files.  these can be
    Or'ed together to produce the attack bitmaps for bishops, rooks and queens.
*/
#  define AttacksRook(a)    Or(AttacksRank(a),AttacksFile(a))
#  define AttacksBishop(a)  Or(AttacksDiaga1(a),AttacksDiagh1(a))

#  define AttacksQueen(a)   Or(AttacksBishop(a),AttacksRook(a))
#  define Rank(x)       (((x)>>3)&7)
#  define File(x)       ((x)&7)
#  define ChangeSide(x) ((x)^1)


#  define AttacksRank(a)                                               \
      rook_attacks_r0[(a)][And(Shiftr(Or(search.w_occupied,search.b_occupied),\
                                      56-((a)&56)),255)]
#  define AttacksFile(a)                                               \
      rook_attacks_rl90[(a)][And(Shiftr(search.occupied_rl90,   \
                                        56-(((a)&7)<<3)),255)]
#  define AttacksDiaga1(a)                                             \
      bishop_attacks_rl45[(a)][And(Shiftr(search.occupied_rl45, \
                                          bishop_shift_rl45[(a)]),255)]
#  define AttacksDiagh1(a)                                             \
      bishop_attacks_rr45[(a)][And(Shiftr(search.occupied_rr45, \
                                          bishop_shift_rr45[(a)]),255)]
/*  
    the following macros are used to compute the mobility for a sliding piece.
    The basic idea is the same as the attack vectors above, but the result is 
    an integer mobility factor rather than a bitboard.  this saves having to 
    do a PopCnt() on the attack bit vector, which is much slower.
*/
#  define MobilityRook(a)   (MobilityRank(a)+MobilityFile(a))

#  define MobilityBishop(a) (MobilityDiaga1(a)+MobilityDiagh1(a))

#  define MobilityQueen(a)  (MobilityBishop(a)+MobilityRook(a))

#  define MobilityRank(a)                                                   \
     rook_mobility_r0[(a)][And(Shiftr(Or(search.w_occupied,search.b_occupied),            \
                                      56-((a)&56)),255)]
#  define MobilityFile(a)                                                   \
     rook_mobility_rl90[(a)][And(Shiftr(search.occupied_rl90,   \
                                        56-(((a)&7)<<3)),255)]
#  define MobilityDiaga1(a)                                                 \
     bishop_mobility_rl45[(a)][And(Shiftr(search.occupied_rl45, \
                                          bishop_shift_rl45[(a)]),255)]
#  define MobilityDiagh1(a)                                                 \
     bishop_mobility_rr45[(a)][And(Shiftr(search.occupied_rr45, \
                                          bishop_shift_rr45[(a)]),255)]
/*  
    the following macros are used to extract the pieces of a move that are
    kept compressed into the rightmost 21 bits of a simple integer.
*/

#  define From(a)             ((a)&63)
#  define To(a)               (((a)>>6)&63)
#  define Piece(a)            (((a)>>12)&7)
#  define Captured(a)         (((a)>>15)&7)
#  define Promote(a)          (((a)>>18)&7)
#  define CaptureOrPromote(a) (((a)>>15)&63)
#  define SetMask(a)          (set_mask[a])
#  define ClearMask(a)        (clear_mask[a])

/*  
    the following macros are used to extract the correct bits for the piece
    type desired.
*/

#  define BlackPawns            search.b_pawn
#  define BlackKnights          search.b_knight
#  define BlackBishops          search.b_bishop
#  define BlackRooks            search.b_rook
#  define BlackQueens           search.b_queen
#  define BlackKing             set_mask[search.black_king]
#  define BlackKingSQ           search.black_king
#  define BlackCastle(ply)      position[ply].b_castle
#  define TotalBlackPawns       search.black_pawns
#  define TotalBlackPieces      search.black_pieces
#  define TotalBlackMaterial    search.black_pieces+search.black_pawns
#  define BlackPieces           search.b_occupied

#  define WhitePawns            search.w_pawn
#  define WhiteKnights          search.w_knight
#  define WhiteBishops          search.w_bishop
#  define WhiteRooks            search.w_rook
#  define WhiteQueens           search.w_queen
#  define WhiteKing             set_mask[search.white_king]
#  define WhiteKingSQ           search.white_king
#  define WhiteCastle(ply)      position[ply].w_castle
#  define TotalWhitePawns       search.white_pawns
#  define TotalWhitePieces      search.white_pieces
#  define TotalWhiteMaterial    search.white_pieces+search.white_pawns
#  define WhitePieces           search.w_occupied

#  define TotalPieces           search.total_pieces

#  define Material              search.material_evaluation
#  define Rule50Moves(ply)      position[ply].rule_50_moves
#  define HashKey               search.hash_key
#  define PawnHashKey           search.pawn_hash_key
#  define EnPassant(ply)        position[ply].enpassant_target
#  define EnPassantTarget(ply)  (EnPassant(ply) ? set_mask[EnPassant(ply)] : 0)
#  define PieceOnSquare(sq)     search.board[sq]
#  define BishopsQueens         search.bishops_queens
#  define RooksQueens           search.rooks_queens
#  define Occupied              Or(search.w_occupied,search.b_occupied)
#  define OccupiedRL90          search.occupied_rl90
#  define OccupiedRL45          search.occupied_rl45
#  define OccupiedRR45          search.occupied_rr45

#  define Sliding(piece)        ((piece) & 4)
#  define SlidingDiag(piece)    (((piece) & 5) == 5)
#  define SlidingRow(piece)     (((piece) & 6) == 6)
/*  
    the following macros are used to Set and Clear a specific bit in the
    second argument.  this is done to make the code more readable, rather
    than to make it faster.
*/
#  define ClearSet(a,b)  b=Xor(a,b)
#  define Clear(a,b)     b=And(clear_mask[a],b)
#  define ClearRL90(a,b) b=And(clear_mask_rl90[a],b)
#  define ClearRL45(a,b) b=And(clear_mask_rl45[a],b)
#  define ClearRR45(a,b) b=And(clear_mask_rr45[a],b)
#  define Set(a,b)       b=Or(set_mask[a],b)
#  define SetRL90(a,b)   b=Or(set_mask_rl90[a],b)
#  define SetRL45(a,b)   b=Or(set_mask_rl45[a],b)
#  define SetRR45(a,b)   b=Or(set_mask_rr45[a],b)

#  define HashPB32(a,b)       b=b_pawn_random32[a]^(b)
#  define HashPW32(a,b)       b=w_pawn_random32[a]^(b)
#  define HashPB(a,b)         b=Xor(b_pawn_random[a],b)
#  define HashPW(a,b)         b=Xor(w_pawn_random[a],b)
#  define HashNB(a,b)         b=Xor(b_knight_random[a],b)
#  define HashNW(a,b)         b=Xor(w_knight_random[a],b)
#  define HashBB(a,b)         b=Xor(b_bishop_random[a],b)
#  define HashBW(a,b)         b=Xor(w_bishop_random[a],b)
#  define HashRB(a,b)         b=Xor(b_rook_random[a],b)
#  define HashRW(a,b)         b=Xor(w_rook_random[a],b)
#  define HashQB(a,b)         b=Xor(b_queen_random[a],b)
#  define HashQW(a,b)         b=Xor(w_queen_random[a],b)
#  define HashKB(a,b)         b=Xor(b_king_random[a],b)
#  define HashKW(a,b)         b=Xor(w_king_random[a],b)
#  define HashEP(a,b)         b=Xor(enpassant_random[a],b)
#  define HashCastleW(a,b)    b=Xor(castle_random_w[a],b);
#  define HashCastleB(a,b)    b=Xor(castle_random_b[a],b);
#  define SavePV(ply,value,ph) do {\
      pv[ply-1].path[ply-1]=current_move[ply-1];\
      pv[ply-1].path_length=ply-1; \
      pv[ply-1].path_hashed=ph; \
      pv[ply-1].path_iteration_depth=iteration_depth;} while(0)
#  define SavePVS(ply,value,ph) do {\
      pv[ply-1].path[ply-1]=current_move[ply-1];\
      pv[ply-1].path_length=ply-1; \
      pv[ply-1].path_hashed=ph; \
      pv[ply-1].path_iteration_depth=iteration_depth; \
      SearchOutput(value,beta);} while(0)
#endif
