#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#if !defined(AMIGA)
#  include <limits.h>
#endif
#if defined(NT_i386) || defined(NT_AXP)
#  include <windows.h>
#  include <winbase.h>
#  include <wincon.h>
#  include <io.h>
#else
#  include <sys/times.h>
#  include <sys/time.h>
#  include <sys/types.h>
#endif
#include "chess.h"
#include "data.h"
#if defined(UNIX)
#  include <unistd.h>
#  include <sys/types.h>
#  if !defined(LINUX) && !defined(ALPHA) && !defined(HP) && !defined(CRAY1) && !defined(FreeBSD)
#    if defined(AIX)
#      include <sys/termio.h>
#      include <sys/select.h>
#    else
#      if defined(NEXT)
#        include <bsd/termios.h>
#        include <sys/ioctl.h>
#      else
#        include <sys/filio.h>
#      endif
#    endif
#    if !defined(NEXT)
#      include <stropts.h>
#    endif
#    include <sys/conf.h>
#  else
#    include <sys/ioctl.h>
#  endif
#endif

#if defined(UNIX)
#  if !defined(CLK_TCK)
     static clock_t clk_tck = 0;
#  endif
#endif


#if defined(AMIGA)
#  include <proto/dos.h>
#  define tv_sec tv_secs
#  define tv_usec tv_micro
#  include <exec/types.h>
#  define RAW 1
#  define CON 0
#  include <limits.h>

int _kbhit(void)
{
  BPTR  inp;
  BOOLEAN  ret;

  inp=Input();
  if(!IsInteractive(inp)) return FALSE;
  Flush(inp);
  (void) SetMode(inp,RAW);
  ret=WaitForChar(inp,1);
  (void) SetMode(inp,CON);
  return ret;
}
#endif   /* if defined(AMIGA)  */

# if defined(NT_i386) || defined(NT_AXP)
#  include <windows.h>
#  include <conio.h>
extern int CheckInput(void)
{
  int i;
   static int init = 0, pipe;
   static HANDLE inh;
   DWORD dw;

  if (!xboard && !ics && !isatty(fileno(stdin))) return(0);
  if (batch_mode) return(0);
  if (strchr(cmd_buffer,'\n')) return(1);
  if (xboard) {
#if defined(FILE_CNT)
    if (stdin->_cnt > 0) return stdin->_cnt;
#endif
    if (!init) {
      init = 1;
      inh = GetStdHandle(STD_INPUT_HANDLE);
      pipe = !GetConsoleMode(inh, &dw);
      if (!pipe) {
        SetConsoleMode(inh, dw & ~(ENABLE_MOUSE_INPUT|ENABLE_WINDOW_INPUT));
        FlushConsoleInputBuffer(inh);
      }
    }
    if (pipe) {
      if (!PeekNamedPipe(inh, NULL, 0, NULL, &dw, NULL)) {
        return 1;
      }
      return dw;
    } else {
      GetNumberOfConsoleInputEvents(inh, &dw);
      return dw <= 1 ? 0 : dw;
    }
  }
  else {
    i=_kbhit();
  }
  return(i);
}
#endif

#if defined(DOS)
extern int CheckInput(void)
{
  int i;
  if (!xboard && !ics && !isatty(fileno(stdin))) return(0);
  if (batch_mode) return(0);
  if (strchr(cmd_buffer,'\n')) return(1);
  i=bioskey(1);
  return(i);
}
#endif

#if defined(UNIX) || defined(LINUX_i386)
extern int CheckInput(void) {
  fd_set readfds;
  struct timeval tv;
  int data;

  if (!xboard && !ics && !isatty(fileno(stdin))) return(0);
  if (batch_mode) return(0);
  if (strchr(cmd_buffer,'\n')) return(1);
  FD_ZERO (&readfds);
  FD_SET (fileno(stdin), &readfds);
  tv.tv_sec=0;
  tv.tv_usec=0;
  select(16, &readfds, 0, 0, &tv);
  data=FD_ISSET(fileno(stdin), &readfds);
  return(data);
}
#endif

void Delay(int ms)
{
  int old,newer;
  old=GetTime(elapsed);
  do {
    newer=GetTime(elapsed);
  } while (newer-ms/10 < old);
}

void ClearHashTables(void)
{
  int i;

  if (trans_ref_ba && trans_ref_wa) {
    for (i=0;i<hash_table_size;i++) {
      (trans_ref_ba+i)->word1=Or(And((trans_ref_ba+i)->word1,
			      mask_clear_entry),Shiftl((BITBOARD) 65536,21));
	      (trans_ref_wa+i)->word1=Or(And((trans_ref_wa+i)->word1,
			      mask_clear_entry),Shiftl((BITBOARD) 65536,21));
    }
    for (i=0;i<2*hash_table_size;i++) {
      (trans_ref_bb+i)->word1=Or(And((trans_ref_bb+i)->word1,
                      mask_clear_entry),Shiftl((BITBOARD) 65536,21));
      (trans_ref_wb+i)->word1=Or(And((trans_ref_wb+i)->word1,
                      mask_clear_entry),Shiftl((BITBOARD) 65536,21));
    }
  }
}

void DisplayBitBoard(BITBOARD board)
{
  union doub {
    char i[8];
    BITBOARD d;
  };
  union doub x;
  int i,j;
#if defined(LITTLE_ENDIAN_ARCH) && defined(HAS_LONGLONG)
  int subs[8]={7,6,5,4,3,2,1,0};
#endif
#if defined(LITTLE_ENDIAN_ARCH) && !defined(HAS_LONGLONG)
  int subs[8]={3,2,1,0,7,6,5,4};
#endif

  x.d=board;
#if defined(LITTLE_ENDIAN_ARCH)
  for(i=7;i>=0;i--) {
    printf("  %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(x.i[subs[i]] & j) 
        printf("X ");
      else
        printf("- ");
    printf("\n");
  }
#else
  for(i=7;i>=0;i--) {
    printf("  %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(x.i[i] & j) 
        printf("X ");
      else
        printf("- ");
    printf("\n");
  }
#endif
}

/*
********************************************************************************
*                                                                              *
*   DisplayChessBoard() is used to display the board since it is kept in       *
*   both the bit-board and array formats, here we use the array format which   *
*   is nearly ready for display as is.                                         *
*                                                                              *
********************************************************************************
*/
void DisplayChessBoard(FILE *display_file, CHESS_POSITION pos)
{
  int display_board[64];
  char display_string[] =
    {"*Q\0*R\0*B\0  \0*K\0*N\0*P\0  \0P \0N \0K \0  \0B \0R \0Q \0"};
  int i,j;
/*
 ----------------------------------------------------------
|                                                          |
|   first, convert square values to indices to the proper  |
|   text string.                                           |
|                                                          |
 ----------------------------------------------------------
*/
  for(i=0;i<64;i++) display_board[i]=(pos.board[i]+7)*3;
/*
 ----------------------------------------------------------
|                                                          |
|   now that that's done, simply display using 8 squares   |
|   per line.                                              |
|                                                          |
 ----------------------------------------------------------
*/
  fprintf(display_file,"\n       +---+---+---+---+---+---+---+---+\n");
  for(i=7;i>=0;i--) {
    fprintf(display_file,"   %2d  ",i+1);
    for(j=0;j<8;j++)
      fprintf(display_file,"| %s",&display_string[display_board[i*8+j]]);
    fprintf(display_file,"|\n");
    fprintf(display_file,"       +---+---+---+---+---+---+---+---+\n");
  }
  fprintf(display_file,"         a   b   c   d   e   f   g   h\n\n");
}

char* DisplayEvaluation(int value)
{
  static char out[10];

  if (abs(value) < MATE-100) 
    sprintf(out,"%7.2f",((double) value)/100.0);
  else if (abs(value) > MATE) {
    if (value < 0) sprintf(out," -infnty");
    else sprintf(out," +infnty");
  }
  else if (value == MATE-2) sprintf(out,"   Mate");
  else if (value == -(MATE-1)) sprintf(out,"  -Mate");
  else if (value > 0) sprintf(out,"  Mat%.2d",(MATE-value)/2);
  else sprintf(out," -Mat%.2d",(MATE-abs(value))/2);
  return(out);
}

char* DisplayEvaluationWhisper(int value)
{
  static char out[10];

  if (abs(value) < MATE-100)
    sprintf(out,"%+.2f",((double) value)/100.0);
  else if (abs(value) > MATE) {
    if (value < 0) sprintf(out,"-infnty");
    else sprintf(out,"+infnty");
  }
  else if (value == MATE-2) sprintf(out,"Mate");
  else if (value == -(MATE-1)) sprintf(out,"-Mate");
  else if (value > 0) sprintf(out,"Mat%.2d",(MATE-value)/2);
  else sprintf(out,"-Mat%.2d",(MATE-abs(value))/2);
  return(out);
}

void DisplayPieceBoards(int *white, int *black)
{
  int i,j;
  printf("                 white                      ");
  printf("                 black\n");
  for (i=7;i>=0;i--) {
    for (j=i*8;j<i*8+8;j++) printf("%4d ",white[j]);
    printf("    ");
    for (j=i*8;j<i*8+8;j++) printf("%4d ",black[j]);
    printf("\n");
  }
}

char* DisplayHHMM(unsigned int time)
{
  static char out[10];

  time=time/6000;
/*  sprintf(out,"%3u:%02u", time/60, time%60); */
  sprintf(out,"###.##");
  return(out);
}

char* DisplayTime(unsigned int time)
{
  static char out[10];

  if (time < 6000) {
/*    sprintf(out,"%6.2f",(double) time/100.0); */
    sprintf(out,"###.##");
  } else {
    time=time/100;
/*    sprintf(out,"%3u:%02u", time/60, time%60); */
    sprintf(out,"###.##");
  }
  return(out);
}

char* DisplayTimeWhisper(unsigned int time)
{
  static char out[10];

  if (time < 6000) sprintf(out,"%.2f",(double) time/100.0);
  else {
    time=time/100;
/*    sprintf(out,"%u:%02u", time/60, time%60); */
    sprintf(out,"#:##");
  }
  return(out);
}

void Display64bitWord(BITBOARD word)
{
  union doub {
    unsigned int i[2];
    BITBOARD d;
  };
  union doub x;
  x.d=word;
#if defined(LITTLE_ENDIAN_ARCH)
  printf("%08x%08x\n",x.i[1],x.i[0]);
#else
  printf("%08x%08x\n",x.i[0],x.i[1]);
#endif
}

void Display2BitBoards(BITBOARD board1, BITBOARD board2)
{
  union doub {
    char i[8];
    BITBOARD d;
  };
  union doub x,y;
  int i,j;
#if defined(LITTLE_ENDIAN_ARCH) && defined(HAS_LONGLONG)
  int subs[8]={7,6,5,4,3,2,1,0};
#endif
#if defined(LITTLE_ENDIAN_ARCH) && !defined(HAS_LONGLONG)
  int subs[8]={3,2,1,0,7,6,5,4};
#endif

  x.d=board1;
  y.d=board2;
  printf("          good                     bad\n");
#if defined(LITTLE_ENDIAN_ARCH)
  for(i=7;i>=0;i--) {
    printf("  %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(x.i[subs[i]] & j) printf("X ");
      else printf("- ");
    printf("     %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(y.i[subs[i]] & j) printf("X ");
      else printf("- ");
    printf("\n");
  }
#else
  for(i=7;i>=0;i--) {
    printf("  %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(x.i[i] & j) printf("X ");
      else printf("- ");
    printf("     %2d ",i*8);
    for(j=128;j>0;j=j>>1)
      if(y.i[i] & j) printf("X ");
      else printf("- ");
    printf("\n");
  }
#endif
}

void DisplayChessMove(char *title, int move)
{
  printf("%s  piece=%d, from=%d, to=%d, captured=%d, promote=%d\n",
         title,Piece(move),From(move), To(move),Captured(move),
         Promote(move));
}

unsigned int GetTime(TIME_TYPE type)
{
/* For SPEC */
#ifdef SPEC_CPU2000
  return 0; 

#else
#if defined(UNIX) || defined(AMIGA)
  static struct tms t;
  static struct timeval timeval;
  static struct timezone timezone;
#endif

  switch (type) {
#if defined(UNIX) || defined(AMIGA)
    case cpu:
      (void) times(&t);
#  if defined(CLK_TCK)
      return((t.tms_utime+t.tms_stime)*100/CLK_TCK);
#  else
      if (!clk_tck) clk_tck = sysconf(_SC_CLK_TCK);
      return((t.tms_utime+t.tms_stime)*100/clk_tck);
#  endif
    case elapsed:
      gettimeofday(&timeval, &timezone);
      return(timeval.tv_sec*100+(timeval.tv_usec / 10000L));
    default:
      gettimeofday(&timeval, &timezone);
      return(timeval.tv_usec);
#endif
#if defined(NT_i386) || defined(NT_AXP)
    case elapsed:
      return( (unsigned int) GetTickCount()/10);
    default:
      return( (unsigned int) GetTickCount()/10);
#endif
#if defined(DOS)
    case elapsed:
      return(time(0)*100);
    default:
      return(time(0)*100);
#endif
  }
}
#endif /* SPEC_CPU2000 */

/*
********************************************************************************
*                                                                              *
*   HasOpposition() is used to determine if one king stands in "opposition"    *
*   to the other.  if the kings are opposed on the same file or else are       *
*   opposed on the same diagonal, then the side not-to-move has the opposition *
*   and the side-to-move must give way.                                        *
*                                                                              *
********************************************************************************
*/
int HasOpposition(int on_move, int white_king, int black_king)
{
  register int file_distance, rank_distance;
  file_distance=FileDistance(white_king,black_king);
  rank_distance=RankDistance(white_king,black_king);
  if (rank_distance < 2) return(1);
  if (on_move) {
    if (rank_distance > 2) rank_distance--;
    else file_distance--;
  }
  if ((file_distance == 2) && (rank_distance == 2)) return(1);
  if ((file_distance == 0) && (rank_distance == 2)) return(1);
  return(0);
}

/*
********************************************************************************
*                                                                              *
*   InterposeSquares() is used to compute the set of squares that block an     *
*   attack on the king by a sliding piece, by interposing any piece between    *
*   the attacking piece and the king on the same ray.                          *
*                                                                              *
********************************************************************************
*/
BITBOARD InterposeSquares(int check_direction, int king_square, 
                          int checking_square)
{
  register BITBOARD target;
/*
 ----------------------------------------------------------
|                                                          |
|   if this is a check from a single sliding piece, then   |
|   we can interpose along the checking rank/file/diagonal |
|   and block the check.  otherwise, interposing is not a  |
|   possibility.                                           |
|                                                          |
 ----------------------------------------------------------
*/
  switch (check_direction) {
    case +1:
      target=Xor(plus1dir[king_square-1],plus1dir[checking_square]);
      break;
    case +7:
      target=Xor(plus7dir[king_square-7],plus7dir[checking_square]);
      break;
    case +8:
      target=Xor(plus8dir[king_square-8],plus8dir[checking_square]);
      break;
    case +9:
      target=Xor(plus9dir[king_square-9],plus9dir[checking_square]);
      break;
    case -1:
      target=Xor(minus1dir[king_square+1],minus1dir[checking_square]);
      break;
    case -7:
      target=Xor(minus7dir[king_square+7],minus7dir[checking_square]);
      break;
    case -8:
      target=Xor(minus8dir[king_square+8],minus8dir[checking_square]);
      break;
    case -9:
      target=Xor(minus9dir[king_square+9],minus9dir[checking_square]);
      break;
    default:
      target=0;
      break;
  }
  return(target);
}
 
int KingPawnSquare(int pawn, int king, int queen, int ptm)
{
  register int pdist, kdist;
  pdist=abs((pawn>>3)-(queen>>3));
  kdist=(abs((king>>3)-(queen>>3)) > abs((king&7)-(queen&7))) ? 
    abs((king>>3)-(queen>>3)) : abs((king&7)-(queen&7));
  if (!ptm) pdist++;
  if (pdist < kdist) return(0);
  else return(1);
}

/* last modified 05/01/97 */
/*
********************************************************************************
*                                                                              *
*   NewGame() is used to initialize the chess position and timing controls to  *
*   the setup needed to start a new game.                                      *
*                                                                              *
********************************************************************************
*/
void NewGame(int save) {
  char filename[64];
  static int save_book_selection_width=5, save_book_random=2;
  static int save_whisper=0, save_kibitz=0, save_channel=0;
  static int save_resign=0, save_resign_count=0, save_draw_count=0;
  static int save_learning=0;

  new_game=0;
  if (save) {
    save_book_selection_width=book_selection_width;
    save_book_random=book_random;
    save_whisper=whisper;
    save_kibitz=kibitz;
    save_channel=channel;
    save_resign=resign;
    save_resign_count=resign_count;
    save_draw_count=draw_count;
    save_learning=learning;
  }
  else {
    over=0;
    moves_out_of_book=0;
    ponder_move=0;
    previous_search_value=0;
    last_pv.path_iteration_depth=0;
    last_pv.path_length=0;
    strcpy(initial_position,"");
    InitializeChessBoard(&position[0]);
    InitializeHashTables();
    force=0;
    wtm=1;
    move_number=1;
    tc_time_remaining=tc_time;
    tc_time_remaining_opponent=tc_time;
    tc_moves_remaining=tc_moves;
    if (history_file) fclose(history_file);
    history_file=fopen("game.001","w+");
    book_selection_width=save_book_selection_width;
    book_random=save_book_random;
    whisper=save_whisper;
    kibitz=save_kibitz;
    channel=save_channel;
    resign=save_resign;
    resign_count=save_resign_count;
    resign_counter=0;
    draw_count=save_draw_count;
    draw_counter=0;
    usage_level=0;
    learning=save_learning;
    largest_positional_score=60;
    predicted=0;
    whisper_depth=0;
    whisper_value=0;
    nodes_searched=0;
    cpu_percent=0;
    whisper_text[0]=0;
  }
}

char* Normal(void)
{
#if defined(NT_i386) || defined(NT_AXP)
  HANDLE  std_console;
  std_console = GetStdHandle(STD_OUTPUT_HANDLE);
#endif

  if (ansi) {
#if defined(UNIX) || defined(AMIGA)
    return("\033[0m");
#elif defined(NT_i386) || defined(NT_AXP)
    SetConsoleTextAttribute(std_console, FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);
    return("");
#else
    return("\033[1;44;37m");
#endif
  }
  return("");
}

int ParseTime(char* string)
{
  int time=0;
  int minutes=0;
  while (*string) {
    switch (*string) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        minutes=minutes*10+(*string)-'0';
        break;
      case ':':
        time=time*60+minutes;
        minutes=0;
        break;
      default: printf("illegal character in time, please re-enter\n");
        break;
    }
    string++;
  }
  return(time*60+minutes);
}

/*
********************************************************************************
*                                                                              *
*   PinnedOnKing() is used to determine if the piece on <square> is pinned     *
*   against the king, so that it's illegal to move it.  this is used to screen *
*   potential moves by GenerateCheckEvasions() so that illegal moves are not   *
*   produced.                                                                  *
*                                                                              *
********************************************************************************
*/
int PinnedOnKing(int wtm, int square)
{
  register int ray;
  if (wtm) {
/*
 ----------------------------------------------------------
|                                                          |
|   first, determine if the piece being moved is on the    |
|   same diagonal, rank or file as the king.               |
|                                                          |
 ----------------------------------------------------------
*/
    ray=directions[square][WhiteKingSQ];
    if (!ray) return(0);
/*
 ----------------------------------------------------------
|                                                          |
|   if they are on the same ray, then determine if the     |
|   king blocks a bishop attack in one direction from this |
|   square and a bishop or queen blocks a bishop attack    |
|   on the same diagonal in the opposite direction.        |
|                                                          |
 ----------------------------------------------------------
*/
    switch (abs(ray)) {
    case 1: 
      if (And(AttacksRank(square),WhiteKing) != 0)
        return(And(And(AttacksRank(square),RooksQueens),
                   BlackPieces) != 0);
      else return(0);
    case 7: 
      if (And(AttacksDiaga1(square),WhiteKing) != 0)
        return(And(And(AttacksDiaga1(square),BishopsQueens),
                   BlackPieces) != 0);
      else return(0);
    case 8: 
      if (And(AttacksFile(square),WhiteKing) != 0)
        return(And(And(AttacksFile(square),RooksQueens),
                   BlackPieces) != 0);
      else return(0);
    case 9: 
      if (And(AttacksDiagh1(square),WhiteKing) != 0)
        return(And(And(AttacksDiagh1(square),BishopsQueens),
                   BlackPieces) != 0);
      else return(0);
    }
  }
  else {
/*
 ----------------------------------------------------------
|                                                          |
|   first, determine if the piece being moved is on the    |
|   same diagonal, rank or file as the king.               |
|                                                          |
 ----------------------------------------------------------
*/
    ray=directions[BlackKingSQ][square];
    if (!ray) return(0);
/*
 ----------------------------------------------------------
|                                                          |
|   if they are on the same ray, then determine if the     |
|   king blocks a bishop attack in one direction from this |
|   square and a bishop or queen blocks a bishop attack    |
|   on the same diagonal in the opposite direction.        |
|                                                          |
 ----------------------------------------------------------
*/
    switch (abs(ray)) {
    case 1: 
      if (And(AttacksRank(square),BlackKing) != 0)
        return(And(And(AttacksRank(square),RooksQueens),
                   WhitePieces) != 0);
      else return(0);
    case 7: 
      if (And(AttacksDiaga1(square),BlackKing) != 0)
        return(And(And(AttacksDiaga1(square),BishopsQueens),
                   WhitePieces) != 0);
      else return(0);
    case 8: 
      if (And(AttacksFile(square),BlackKing) != 0)
        return(And(And(AttacksFile(square),RooksQueens),
                   WhitePieces) != 0);
      else return(0);
    case 9: 
      if (And(AttacksDiagh1(square),BlackKing) != 0)
        return(And(And(AttacksDiagh1(square),BishopsQueens),
                   WhitePieces) != 0);
      else return(0);
    }
  }
  return(0);
}

/*

A 32 bit random number generator. An implementation in C of the algorithm given by
Knuth, the art of computer programming, vol. 2, pp. 26-27. We use e=32, so 
we have to evaluate y(n) = y(n - 24) + y(n - 55) mod 2^32, which is implicitly
done by unsigned arithmetic.

*/

unsigned int Random32(void)
{
  /*
  random numbers from Mathematica 2.0.
  SeedRandom = 1;
  Table[Random[Integer, {0, 2^32 - 1}]
  */
  static unsigned long x[55] = {
    1410651636UL, 3012776752UL, 3497475623UL, 2892145026UL, 1571949714UL,
    3253082284UL, 3489895018UL, 387949491UL, 2597396737UL, 1981903553UL,
    3160251843UL, 129444464UL, 1851443344UL, 4156445905UL, 224604922UL,
    1455067070UL, 3953493484UL, 1460937157UL, 2528362617UL, 317430674UL, 
    3229354360UL, 117491133UL, 832845075UL, 1961600170UL, 1321557429UL,
    747750121UL, 545747446UL, 810476036UL, 503334515UL, 4088144633UL,
    2824216555UL, 3738252341UL, 3493754131UL, 3672533954UL, 29494241UL,
    1180928407UL, 4213624418UL, 33062851UL, 3221315737UL, 1145213552UL,
    2957984897UL, 4078668503UL, 2262661702UL, 65478801UL, 2527208841UL,
    1960622036UL, 315685891UL, 1196037864UL, 804614524UL, 1421733266UL,
    2017105031UL, 3882325900UL, 810735053UL, 384606609UL, 2393861397UL };
  static int init = 1;
  static unsigned long y[55];
  static int j, k;
  unsigned long ul;
  
  if (init)
  {
    int i;
    
    init = 0;
    for (i = 0; i < 55; i++) y[i] = x[i];
    j = 24 - 1;
    k = 55 - 1;
  }
  
  ul = (y[k] += y[j]);
  if (--j < 0) j = 55 - 1;
  if (--k < 0) k = 55 - 1;
  return((unsigned int)ul);
}

BITBOARD Random64(void)
{
  BITBOARD result;
  unsigned int r1, r2;

  r1=Random32();
  r2=Random32();
  result=Or(r1,Shiftl((BITBOARD) r2,32));
  return (result);
}

/* last modified 05/06/97 */
/*
********************************************************************************
*                                                                              *
*   Read() copies data from the command_buffer into a local buffer, and then   *
*   uses ReadParse to break this command up into tokens for processing.        *
*                                                                              *
********************************************************************************
*/
int Read(int wait, char *buffer) {
  char *eol, *ret, readdata;

  *buffer=0;
/*
   case 1:  we have a complete command line, with terminating
   N/L character in the buffer.  we can simply extract it from
   the I/O buffer, parse it and return.
*/
  if (strchr(cmd_buffer,'\n'));
/*
   case 2:  the buffer does not contain a complete line.  If we
   were asked to not wait for a complete command, then we first
   see if I/O is possible, and if so, read in what is available.
   If that includes a N/L, then we are ready to parse and return.
   If not, we return indicating no input available just yet.
*/
  else if (!wait) {
    if (CheckInput()) {
      readdata=SpecReadRaw();
      if (!strchr(cmd_buffer,'\n')) return(0);
      if (!readdata) return(-1);
    }
    else return(0);
  }
/*
   case 3:  the buffer does not contain a complete line, but we
   were asked to wait until a complete command is entered.  So we
   hang by doing a SpecReadRaw() and continue doing so until we get
   a N/L character in the buffer.  Then we parse and return.
*/
  else while (!strchr(cmd_buffer,'\n')) {
    readdata=SpecReadRaw();
    if (!readdata) return(-1);
  }

  eol=strchr(cmd_buffer,'\n');
  *eol=0;
  ret=strchr(cmd_buffer,'\r');
  if (ret) *ret=' ';
  strcpy(buffer,cmd_buffer);
  memmove(cmd_buffer,eol+1,strlen(eol+1)+1);
  return(1);
}

/* last modified 04/23/97 */
/*
********************************************************************************
*                                                                              *
*   ReadClear() clears the input buffer when input_stream is being switched to *
*   a file, since we have info buffered up from a different input stream.      *
*                                                                              *
********************************************************************************
*/
void ReadClear() {
  cmd_buffer[0]=0;
}

/* last modified 05/06/97 */
/*
********************************************************************************
*                                                                              *
*   ReadParse() takes one complete command-line, and breaks it up into tokens. *
*   common delimiters are used, such as " ", ",", "/" and ";", any of which    *
*   delimit fields.                                                            *
*                                                                              *
********************************************************************************
*/
int ReadParse(char *buffer, char *args[], char *delims) {
  char *next, tbuffer[512];
  int nargs;

  strcpy(tbuffer,buffer);
  for (nargs=0;nargs<16;nargs++) *(args[nargs])=0;
  next=strtok(tbuffer,delims);
  if (!next) return(0);
  strcpy(args[0],next);
  for (nargs=1;nargs<32;nargs++) {
    next=strtok(0,delims);
    if (!next) break;
    strcpy(args[nargs],next);
  }
  return(nargs);
}

/* last modified 04/23/97 */
/*
********************************************************************************
*                                                                              *
*   SpecReadRaw() reads data from the input_stream, and buffers this into the      *
*   command_buffer for later processing.                                       *
*                                                                              *
********************************************************************************
*/
int SpecReadRaw(void) {
  char buffer[512], *end;
  int bytes;

  do
    bytes=read(fileno(input_stream),buffer,512);
  while (bytes<0 && errno==EINTR);
  if (bytes == 0) {
    if (input_stream != stdin) fclose(input_stream);
    input_stream=stdin;
    return(0);
  }
  else if (bytes < 0) {
    printf("ERROR!  input I/O stream is unreadable, exiting.\n");
    exit(1);
  }
  end=cmd_buffer+strlen(cmd_buffer);
  memcpy(end,buffer,bytes);
  *(end+bytes)=0;
  return(1);
}

/* last modified 10/11/96 */
/*
********************************************************************************
*                                                                              *
*   ReadChessMove() is used to read a move from an input file.  the main issue *
*   is to skip over "trash" like move numbers, times, comments, and so forth,  *
*   and find the next actual move.                                             *
*                                                                              *
********************************************************************************
*/
int ReadChessMove(FILE *input, int wtm, int one_move) {

  static char text[128];
  char *tmove;
  int move=0, status;

  while (move == 0) {
    status=fscanf(input,"%s",text);
    if (status <= 0) return(-1);
    if (strcmp(text,"0-0") && strcmp(text,"0-0-0"))
      tmove=text+strspn(text,"0123456789.");
    else
      tmove=text;
    if (((tmove[0]>='a' && tmove[0]<='z') ||
         (tmove[0]>='A' && tmove[0]<='Z')) ||
        !strcmp(tmove,"0-0") || !strcmp(tmove,"0-0-0")) {
      if (!strcmp(tmove,"exit")) return(-1);
      move=InputMove(tmove,0,wtm,1,0);
    }
    if (one_move) break;
  }
  return(move);
}

/* last modified 05/13/97 */
/*
********************************************************************************
*                                                                              *
*   ReadNextMove() is used to take a text chess move from a file, and see if   *
*   if is legal, skipping a sometimes embedded move number (1.e4 for example)  *
*   to make PGN import easier.                                                 *
*                                                                              *
********************************************************************************
*/
int ReadNextMove(char *text, int ply, int wtm) {

  char *tmove;
  int move=0;

  if (strcmp(text,"0-0") && strcmp(text,"0-0-0"))
    tmove=text+strspn(text,"0123456789./-");
  else
    tmove=text;
  if (((tmove[0]>='a' && tmove[0]<='z') ||
       (tmove[0]>='A' && tmove[0]<='Z')) ||
      !strcmp(tmove,"0-0") || !strcmp(tmove,"0-0-0")) {
    if (!strcmp(tmove,"exit")) return(-1);
    move=InputMove(tmove,ply,wtm,1,0);
  }
  return(move);
}

char* Reverse(void)
{
#if defined(NT_i386) || defined(NT_AXP)
  HANDLE  std_console;
  std_console = GetStdHandle(STD_OUTPUT_HANDLE);
#endif

  if (ansi) {
#if defined(UNIX) || defined(AMIGA)
    return("\033[7m");
#elif defined(NT_i386) || defined(NT_AXP)
    SetConsoleTextAttribute(std_console, BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE | BACKGROUND_INTENSITY);
    return("");
#else
    return("\033[7;47;33m");
#endif
  }
  return("");
}

/*
********************************************************************************
*                                                                              *
*   Whisper() is used to whisper/kibitz information to a chess server.  it has *
*   to handle the xboard whisper/kibitz interface as well as the custom ics    *
*   interface for Crafty.  there are two main issues:  (a) presenting only the *
*   information specified by the current value of whisper or kibitz variables; *
*   (a) if using the custom ICS interface, preceeding the commands with a "*"  *
*   so the interface will direct them to the server rather than the operator.  *
*                                                                              *
********************************************************************************
*/
void Whisper(int level,int depth,int time,int value,unsigned int nodes,
             int cpu,char* pv)
{
  if (!puzzling) {
    char prefix[128];

    if (strlen(channel_title) && channel)
      sprintf(prefix,"tellics tell %d (%s) ",channel, channel_title);
    else if (channel) sprintf(prefix,"tellics tell %d",channel);
    else sprintf(prefix,"tellics whisper");
    switch (level) {
    case 1:
      if (kibitz && (value > 0)) {
        if (ics) printf("*");
        printf("tellics kibitz mate in %d moves.\n\n",value);
      }
      else if (whisper && (value > 0)) {
        if (ics) printf("*");
        printf("%s mate in %d moves.\n\n",prefix,value);
      }
      if (kibitz && (value < 0)) {
        if (ics) printf("*");
        printf("%s mated in %d moves.\n\n",prefix,-value);
      }
      break;
    case 2:
      if (kibitz >= 2) {
        if (ics) printf("*");
        printf("tellics kibitz d%d; %s; nps %d; time %s; cpu %d%%; p:%d\n",
               depth,DisplayEvaluationWhisper(value),
               (time)?100*nodes/time:nodes,DisplayTimeWhisper(time),cpu,predicted);
      }
      else if (whisper >= 2) {
        if (ics) printf("*");
        printf("%s d%d; %s; nps %d; time %s; cpu %d%%; p:%d\n",
               prefix,depth,DisplayEvaluationWhisper(value),
               (time)?100*nodes/time:nodes,DisplayTimeWhisper(time),cpu,predicted);
      }
    case 3:
      if ((kibitz >= 3) && nodes>5000) {
        if (ics) printf("*");
        printf("tellics kibitz pv:%s\n",pv);
      }
      else if ((whisper >= 3) && nodes>5000) {
        if (ics) printf("*");
        printf("%s pv:%s\n",prefix,pv);
      }
      break;
    case 4:
      if (kibitz >= 4) {
        if (ics) printf("*");
        printf("tellics kibitz %s\n",pv);
      }
      else if (whisper >= 4) {
        if (ics) printf("*");
        printf("%s %s\n",prefix,pv);
      }
      break;
    case 5:
      if (kibitz>=5 && nodes>5000) {
        if (ics) printf("*");
        printf("tellics kibitz d%d-> %s %s %s\n",depth, DisplayTimeWhisper(time),
                                       DisplayEvaluationWhisper(value),pv);
      }
      else if (whisper>=5 && nodes>5000) {
        if (ics) printf("*");
        printf("%s d%d-> %s %s %s\n",prefix,depth, DisplayTimeWhisper(time),
                                       DisplayEvaluationWhisper(value),pv);
      }
      break;
    case 6:
      if (kibitz>=6 && nodes>5000) {
        if (ics) printf("*");
        if (cpu == 0)
          printf("tellics kibitz d%d+ %s %s %s\n",depth, DisplayTimeWhisper(time),
                                           DisplayEvaluationWhisper(value),pv);
        else
          printf("tellics kibitz d%d+ %s >(%s) %s <re-searching>\n",depth,
                 DisplayTimeWhisper(time),DisplayEvaluationWhisper(value),pv);
      }
      else if (whisper>=6 && nodes>5000) {
        if (ics) printf("*");
        if (cpu == 0)
          printf("%s d%d+ %s %s %s\n",prefix,depth, DisplayTimeWhisper(time),
                                            DisplayEvaluationWhisper(value),pv);
        else
          printf("%s d%d+ %s >(%s) %s <re-searching>\n",prefix,depth,
                 DisplayTimeWhisper(time),DisplayEvaluationWhisper(value),pv);
      }
      break;
    }
    if (post) {
      if (strstr(pv,"book"))
        printf("	%2d  %5d %7d %6u %s\n",depth,value,time,nodes,pv+10);
      else
        printf("	%2d  %5d %7d %6u %s\n",depth,value,time,nodes,pv);
    }
    fflush(stdout);
    return;
  }
}
