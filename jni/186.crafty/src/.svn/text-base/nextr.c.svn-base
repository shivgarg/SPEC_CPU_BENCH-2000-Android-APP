#include <stdio.h>
#include <stdlib.h>
#include "chess.h"
#include "data.h"

/* last modified 03/11/97 */
/*
********************************************************************************
*                                                                              *
*   NextRootMove() is used to select the next move from the root move list.    *
*                                                                              *
********************************************************************************
*/
int NextRootMove(int wtm)
{
  register int done, *movep;
  char remaining_moves[10];
/*
 ----------------------------------------------------------
|                                                          |
|   for the moves at the root of the tree, the list has    |
|   already been generated and sorted.  on entry, test     |
|   the searched_this_root_move[] array and then take the  |
|   moves in the order they appear in the move list.       |
|                                                          |
 ----------------------------------------------------------
*/
  time_abort+=TimeCheck(1);
  if (time_abort) {
    abort_search=1;
    return(NONE);
  }
  done=0;
  if (!annotate_mode && !pondering && !booking && last[1]-last[0] == 1) {
    abort_search=1;
    return(NONE);
  }
  for (movep=last[0];movep<last[1];movep++)
    if (searched_this_root_move[movep-last[0]]) done++;
  if ((done==1) && searched_this_root_move[0] &&
      (root_value==root_alpha) && !search_failed_high) return(NONE);

  for (movep=last[0];movep<last[1];movep++)
    if (!searched_this_root_move[movep-last[0]]) {
      if (search_move) {
        if (search_move > 0) {
          if(*movep != search_move) {
            searched_this_root_move[movep-last[0]]=1;
            continue;
          }
        }
        else {
          if(*movep == -search_move) {
            searched_this_root_move[movep-last[0]]=1;
            continue;
          }
        }
      }
      current_move[1]=*movep;
      root_move=movep-last[0];
      searched_this_root_move[root_move]=1;
      return(ROOT_MOVES);
    }
  return(NONE);
}

