#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chess.h"
#include "data.h"

/* last modified 09/12/97 */
/*
********************************************************************************
*                                                                              *
*   Quiesce() is the recursive routine used to implement the alpha/beta        *
*   negamax search (similar to minimax but simpler to code.)  Quiesce() is     *
*   called whenever there is no "depth" remaining so that only capture moves   *
*   are searched deeper.                                                       *
*                                                                              *
********************************************************************************
*/
int Quiesce(int alpha, int beta, int wtm, int ply)
{
  register int initial_alpha, value, delta;
  register int *next_move;
  register int *goodmv, *movep, moves=0, *sortv, temp;
/*
 ----------------------------------------------------------
|                                                          |
|   initialize.                                            |
|                                                          |
 ----------------------------------------------------------
*/
  if (ply >= MAXPLY-2) return(beta);
  nodes_searched++;
  next_time_check--;
  last[ply]=last[ply-1];
  initial_alpha=alpha;
/*
 ----------------------------------------------------------
|                                                          |
|   now call Evaluate() to produce the "stand-pat" score   |
|   that will be returned if no capture is acceptable.     |
|   if this score is > alpha, then we also have to save    |
|   the "path" to this node as it is the PV that leads     |
|   to this score.                                         |
|                                                          |
 ----------------------------------------------------------
*/
  value=Evaluate(ply,wtm,alpha,beta);
  if (value > alpha) {
    if (value >= beta) return(value);
    alpha=value;
    pv[ply].path_length=ply-1;
    pv[ply].path_hashed=0;
    pv[ply].path_iteration_depth=iteration_depth;
  }
/*
 ----------------------------------------------------------
|                                                          |
|   generate captures and sort them based on (a) the value |
|   of the captured piece - the value of the capturing     |
|   piece if this is > 0; or, (b) the value returned by    |
|   Swap().  if the value of the captured piece won't      |
|   bring the material score back up to near alpha, that   |
|   capture is discarded as "futile."                      |
|                                                          |
 ----------------------------------------------------------
*/
  last[ply]=GenerateCaptures(ply, wtm, last[ply-1]);
  delta=alpha-500-(wtm?Material:-Material);
  goodmv=last[ply-1];
  sortv=sort_value;
  for (movep=last[ply-1];movep<last[ply];movep++)
    if (p_values[Captured(*movep)+7]+p_values[Promote(*movep)+7] >= delta) {
      if (Captured(*movep) == king) return(beta);
      if (p_values[Piece(*movep)+7] < p_values[Captured(*movep)+7] ||
          (p_values[Piece(*movep)+7] <= p_values[Captured(*movep)+7] &&
           delta<=0)) {
        *goodmv++=*movep;
        *sortv++=p_values[Captured(*movep)+7];
        moves++;
      }
      else {
        temp=Swap(From(*movep),To(*movep),wtm);
        if (temp >= 0) {
          *sortv++=temp;
          *goodmv++=*movep;
          moves++;
        }
      }
    }
/*
 ----------------------------------------------------------
|                                                          |
|   don't disdain the lowly bubble sort here.  the list of |
|   captures is always short, and experiments with other   |
|   algorithms are always slightly slower.                 |
|                                                          |
 ----------------------------------------------------------
*/
  if (moves > 1) {
    register int done;
    register int *end=last[ply-1]+moves-1;
    do {
      done=1;
      sortv=sort_value;
      movep=last[ply-1];
      for (;movep<end;movep++,sortv++)
        if (*sortv < *(sortv+1)) {
          temp=*sortv;
          *sortv=*(sortv+1);
          *(sortv+1)=temp;
          temp=*movep;
          *movep=*(movep+1);
          *(movep+1)=temp;
          done=0;
        }
    } while(!done);
  }
  next_move=last[ply-1];
/*
 ----------------------------------------------------------
|                                                          |
|   now iterate through the move list and search the       |
|   resulting positions.                                   |
|                                                          |
 ----------------------------------------------------------
*/
  while (moves--) {
    current_move[ply]=*(next_move++);
#if !defined(FAST)
    if (ply <= trace_level)
      SearchTrace(ply,0,wtm,alpha,beta,"quiesce",CAPTURE_MOVES);
#endif
    MakeMove(ply,current_move[ply],wtm);
    value=-Quiesce(-beta,-alpha,ChangeSide(wtm),ply+1);
    UnMakeMove(ply,current_move[ply],wtm);
    if (value > alpha) {
      if(value >= beta) return(value);
      alpha=value;
    }
  }
/*
 ----------------------------------------------------------
|                                                          |
|   all moves have been searched.  return the search       |
|   result that was found.  if the result is not the       |
|   original alpha score, then we need to return the PV    |
|   that is associated with this score.                    |
|                                                          |
 ----------------------------------------------------------
*/
  if (alpha != initial_alpha) {
    memcpy(&pv[ply-1].path[ply],&pv[ply].path[ply],
           (pv[ply].path_length-ply+1)*sizeof(int));
    memcpy(&pv[ply-1].path_hashed,&pv[ply].path_hashed,3);
    pv[ply-1].path[ply-1]=current_move[ply-1];
  }
  return(alpha);
}
