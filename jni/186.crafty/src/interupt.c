#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include "chess.h"
#include "data.h"

/* last modified 04/29/97 */
/*
********************************************************************************
*                                                                              *
*   Interrupt() is used to read in a move when the operator types something    *
*   while a search is in progress (during pondering as one example.)  this     *
*   routine reads in a command (move) and then makes two attempts to use this  *
*   input:  (1) call Option() to see if the command can be executed;  (2) try  *
*   InputMove() to see if this input is a legal move;  if so, and we are       *
*   pondering see if it matches the move we are pondering.                     *
*                                                                              *
********************************************************************************
*/
void Interrupt(int ply)
{
  int temp, *mvp, i, left, readstat, result, time_used;
/*
 ----------------------------------------------------------
|                                                          |
|   if trying to find a move to ponder, and the operator   |
|   types a command, exit a.s.a.p.                         |
|                                                          |
 ----------------------------------------------------------
*/
  if (puzzling) 
    abort_search=1;
/*
 ----------------------------------------------------------
|                                                          |
|   first check to see if this is a command by calling     |
|   Option().  Option() will return a 0 if it didn't       |
|   recognize the command; otherwise it returns a 1 if     |
|   the command was executed, or a 2 if we need to abort   |
|   the search to execute the command.                     |
|                                                          |
 ----------------------------------------------------------
*/
  else do {
    readstat=Read(0,buffer);
    if (readstat <= 0) return;
    nargs=ReadParse(buffer,args," 	;");
    if (nargs == 0) {
      printf("ok.\n");
      return;
    }
    if (wtm)
      printf("White(%d): %s\n",move_number,buffer);
    else
      printf("Black(%d): %s\n",move_number,buffer);
/*
 ----------------------------------------------------------
|                                                          |
|   "." command displays status of current search.         |
|                                                          |
 ----------------------------------------------------------
*/
    if (!strcmp(args[0],".")) {
      if (xboard) {
        end_time=GetTime(time_type);
        time_used=(end_time-start_time);
        printf("stat01: %d ",time_used);
        printf("%d ",nodes_searched);
        printf("%d ",iteration_depth); 
        for (left=0,mvp=last[0];mvp<last[1];mvp++) 
          if (!searched_this_root_move[mvp-last[0]]) left++;
        printf("%d %ld\n",left,last[1]-last[0]);
        return;
      }
      else {
        end_time=GetTime(time_type);
        time_used=(end_time-start_time);
        printf("time:%s ",DisplayTime(time_used));
        printf("nodes:%d\n",nodes_searched);
        for (left=0,mvp=last[0];mvp<last[1];mvp++) 
          if (!searched_this_root_move[mvp-last[0]]) left++;
        printf("%d:%d/%ld  ",1,left,last[1]-last[0]);
        for (i=2;i<=ply;i++) {
          left=0;
          for (mvp=last[i-1];mvp<last[i];mvp++) 
            if (*mvp) left++;
          printf("%d:%d/%ld  ",i,left,last[i]-last[i-1]);
          if (!(i%8)) printf("\n");
        }
        printf("\n");
      }
    }
/*
 ----------------------------------------------------------
|                                                          |
|   "?" command says "move now!"                           |
|                                                          |
 ----------------------------------------------------------
*/
    else if (!strcmp(args[0],"?")) {
      if (thinking) {
        time_abort=1;
        abort_search=1;
      }
    }
/*
 ----------------------------------------------------------
|                                                          |
|   next see if Option() recognizes this as a command.     |
|                                                          |
 ----------------------------------------------------------
*/
    else {
      result=Option();
      if (result >= 2) {
        if (thinking && result!=3)
          printf("command not legal now.\n");
        else {
          abort_search=1;
          analyze_move_read=1;
          return;
        }
      }
      else if ((result != 1) && analyze_mode) {
        abort_search=1;
        analyze_move_read=1;
        return;
      }
/*
 ----------------------------------------------------------
|                                                          |
|   now, check to see if the operator typed a move.  if    |
|   so, and it matched the predicted move, switch from     |
|   pondering to thinking to start the timer.  if the      |
|   is a move, but not the predicted move, abort the       |
|   search, and start over with the right move.            |
|                                                          |
 ----------------------------------------------------------
*/
      else if (!result) {
        if (pondering) {
          nargs=ReadParse(buffer,args," 	;");
          temp=InputMove(args[0],0,ChangeSide(root_wtm),1,1);
          if (temp) {
            if (auto232) {
              char *mv=OutputMoveICS(&temp);
              Delay(auto232_delay);
              if (!wtm) fprintf(auto_file,"\t");
              fprintf(auto_file, " %c%c-%c%c", mv[0], mv[1], mv[2], mv[3]);
              if ((mv[4] != ' ') && (mv[4] != 0))
              fprintf(auto_file, "/%c", mv[4]);
              fprintf(auto_file, "\n");
              fflush(auto_file);
            }
            if ((From(temp) == From(ponder_move)) &&
                (To(temp) == To(ponder_move)) &&
                (Piece(temp) == Piece(ponder_move)) &&
                (Captured(temp) == Captured(ponder_move)) &&
                (Promote(temp) == Promote(ponder_move))) {
              predicted++;
              made_predicted_move=1;
              pondering=0;
              thinking=1;
              opponent_end_time=GetTime(elapsed);
              program_start_time=GetTime(time_type);
              printf("predicted move made.\n");
            }
            else {
              abort_search=1;
              return;
            }
          }
          else if (!strcmp(args[0],"go") || !strcmp(args[0],"move") ||
                   !strcmp(args[0],"SP")) {
            abort_search=1;
            return;
          }
          else printf("illegal move.\n");
        }
        else printf("unrecognized/illegal command.\n");
      }
    }
  } while (1);
  if (log_file) fflush(log_file);
}
/*
********************************************************************************
*                                                                              *
*   SignalInterrupt() is used to catch SIGINT and SIGTERM which are used by    *
*   Xboard.  SIGINT is used when the operator clicks the "move now" button,    *
*   while SIGTERM is used to detect when Crafty is terminating.                *
*                                                                              *
********************************************************************************
*/
#if defined(NT_i386) || defined(NT_AXP)
void _cdecl SignalInterrupt(int signal_type)
#else
void SignalInterrupt(int signal_type)
#endif
{
  switch (signal_type) {
  case SIGINT:
    if (xboard) {
      if (thinking) {
        time_abort=1;
        abort_search=1;
      }
      signal(SIGINT,SignalInterrupt);
      break;
    }
    break;
  case SIGTERM:
    break;
  }
}
