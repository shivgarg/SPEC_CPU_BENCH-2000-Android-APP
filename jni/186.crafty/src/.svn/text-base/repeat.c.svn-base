#include <stdio.h>
#include <stdlib.h>
#include "chess.h"
#include "data.h"

/* last modified 04/16/97 */
/*
********************************************************************************
*                                                                              *
*   RepetitionCheck() is used to detect a draw by repetition.  it saves the    *
*   current position in the repetition list each time it is called.  the list  *
*   contains all positions encountered since the last irreversible move        *
*   (capture or pawn push).                                                    *
*                                                                              *
*   RepetitionCheck() then scans the list to determine if this position has    *
*   occurred before.  if so, the position will be treated as a draw by         *
*   Search().                                                                  *
*                                                                              *
*   RepetitionCheck() also handles 50-move draws.  the position[] structure    *
*   countains the count of moves since the last capture or pawn push.  when    *
*   this value reaches 100 (plies, which is 50 moves) the score is set to      *
*   DRAW.                                                                      *
*                                                                              *
********************************************************************************
*/
int RepetitionCheck(int ply, int wtm)
{
  register int entries;
  register BITBOARD *replist, *thispos;
/*
 ----------------------------------------------------------
|                                                          |
|   check for trivial draws, like insufficient material.   |
|                                                          |
 ----------------------------------------------------------
*/
  if (!(TotalWhitePawns+TotalBlackPawns) &&
      TotalWhitePieces<5 && TotalBlackPieces<5) return(1);
/*
 ----------------------------------------------------------
|                                                          |
|   insert the board into the next slot in the repetition  |
|   list.  then scan the list.  we look for one of the     |
|   conditions:  (a) the position has occured two times in |
|   the actual search tree (not including positions that   |
|   occurred before ply=1); (b) the position has occurred  |
|   three times including all positions in the list.       |
|                                                          |
 ----------------------------------------------------------
*/
  entries=Rule50Moves(ply)>>1;
  thispos=((wtm)?rephead_w:rephead_b)+((ply-1)>>1);
  *thispos=HashKey;
  for (replist=thispos-1;entries;replist--,entries--)
    if(*thispos == *replist) return(1);
  return(0);
}

/* last modified 06/14/96 */
/*
********************************************************************************
*                                                                              *
*   RepetitionDraw() is used to detect a draw by repetition.  this routine is  *
*   only called from Main() and simply scans the complete list searching for   *
*   exactly three repetitions (two additional repetitions of the current       *
*   position.)                                                                 *
*                                                                              *
********************************************************************************
*/
int RepetitionDraw(int wtm)
{
  register int reps;
  BITBOARD *thispos;
/*
 ----------------------------------------------------------
|                                                          |
|   if the 50-move rule is drawing close, then adjust the  |
|   score to reflect the impending draw.                   |
|                                                          |
 ----------------------------------------------------------
*/
  if (Rule50Moves(0) > 99) return(2);
/*
 ----------------------------------------------------------
|                                                          |
|   scan the repetition list to determine if this position |
|   has occurred before.                                   |
|                                                          |
 ----------------------------------------------------------
*/
  reps=0;
  if (wtm) {
    for (thispos=replist_w;thispos<rephead_w;thispos++)
      if(HashKey == *thispos) reps++;
  }
  else {
    for (thispos=replist_b;thispos<rephead_b;thispos++)
      if(HashKey == *thispos) reps++;
  }
  return(reps == 3);
}
