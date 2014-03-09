#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chess.h"
#include "data.h"

/* modified 09/23/97 */
/*
********************************************************************************
*                                                                              *
*   SearchRoot() is the recursive routine used to implement the alpha/beta     *
*   negamax search (similar to minimax but simpler to code.)  SearchRoot() is  *
*   only called when ply=1.  it is somewhat different from Search() in that    *
*   some things (null move search, hash lookup, etc.) are not useful at the    *
*   root of the tree.  SearchRoot() calls Search() to search any positions     *
*   that are below ply=1.                                                      *
*                                                                              *
********************************************************************************
*/
int SearchRoot(int alpha, int beta, int wtm, int depth)
{
  register int first_move=1;
  register int initial_alpha, value;
  register int extensions, begin_root_nodes;
/*
 ----------------------------------------------------------
|                                                          |
|   initialize.  set NextMove() status to 0 so it will     |
|   know what has to be done.                              |
|                                                          |
 ----------------------------------------------------------
*/
  in_check[2]=0;
  extended_reason[2]=no_extension;
  initial_alpha=alpha;
  RepetitionCheck(1,wtm);
  in_check[1]=Check(wtm);
  next_status[1].phase=ROOT_MOVES;
  killer_count1[2]=0;
  killer_count2[2]=0;
/*
 ----------------------------------------------------------
|                                                          |
|   now iterate through the move list and search the       |
|   resulting positions.  note that Search() culls any     |
|   move that is not legal by using Check().  the special  |
|   case is that we must find one legal move to search to  |
|   confirm that it's not a mate or draw.                  |
|                                                          |
 ----------------------------------------------------------
*/
  while ((current_phase[1]=NextRootMove(wtm))) {
    extended_reason[1]=0;
#if !defined(FAST)
    if (1 <= trace_level)
      SearchTrace(1,depth,wtm,alpha,beta,"SearchRoot",current_phase[1]);
#endif
/*
 ----------------------------------------------------------
|                                                          |
|   if we push a pawn to the 7th rank, we need to look     |
|   deeper to see if it can promote.                       |
|                                                          |
 ----------------------------------------------------------
*/
    extensions=-INCREMENT_PLY;
    if (Piece(current_move[1])==pawn &&
        ((wtm && To(current_move[1]) > H5 && TotalBlackPieces<16 &&
         !And(mask_pawn_passed_w[To(current_move[1])],BlackPawns)) ||
        (!wtm && To(current_move[1]) < A4 && TotalWhitePieces<16 &&
         !And(mask_pawn_passed_b[To(current_move[1])],WhitePawns)) ||
        push_extensions[To(current_move[1])]) &&
        Swap(From(current_move[1]),To(current_move[1]),wtm) >= 0) {
      extended_reason[1]|=passed_pawn_extension;
      passed_pawn_extensions_done++;
      extensions=0;
    }
/*
 ----------------------------------------------------------
|                                                          |
|   now make the move and search the resulting position.   |
|                                                          |
 ----------------------------------------------------------
*/
    MakeMove(1,current_move[1],wtm);
/*
 ----------------------------------------------------------
|                                                          |
|   if the move to be made checks the opponent, then we    |
|   need to remember that he's in check and also extend    |
|   the depth by one ply for him to get out.               |
|                                                          |
 ----------------------------------------------------------
*/
    if (Check(ChangeSide(wtm))) {
      in_check[2]=1;
      if (extensions < 0) {
        extended_reason[2]=check_extension;
        check_extensions_done++;
        extensions=0;
      }
    }
    else {
      in_check[2]=0;
      extended_reason[2]=no_extension;
    }
/*
 ----------------------------------------------------------
|                                                          |
|   now call Search to produce a value for this move.      |
|                                                          |
 ----------------------------------------------------------
*/
    begin_root_nodes=nodes_searched;
    if (first_move) {
      value=-ABSearch(-beta,-alpha,ChangeSide(wtm),
                      depth+extensions,2,DO_NULL);
      if (abort_search) {
        UnMakeMove(1,current_move[1],wtm);
        return(alpha);
      }
      first_move=0;
    }
    else {
      value=-ABSearch(-alpha-1,-alpha,ChangeSide(wtm),
                      depth+extensions,2,DO_NULL);
      if (abort_search) {
        UnMakeMove(1,current_move[1],wtm);
        return(alpha);
      }
      if ((value > alpha) && (value < beta)) {
        value=-ABSearch(-beta,-alpha,ChangeSide(wtm),
                        depth+extensions,2,DO_NULL);
        if (abort_search) {
          UnMakeMove(1,current_move[1],wtm);
          return(alpha);
        }
      }
    }
    root_nodes[root_move]=nodes_searched-begin_root_nodes;
    if (value > alpha) {
      SearchOutput(value,beta);
      if(value >= beta) {
        HistoryRefutation(1,depth,wtm);
        UnMakeMove(1,current_move[1],wtm);
        StoreRefutation(1,depth,wtm,value);
        return(value);
      }
      alpha=value;
      root_value=alpha;
    }
    UnMakeMove(1,current_move[1],wtm);
  }
/*
 ----------------------------------------------------------
|                                                          |
|   all moves have been searched.  if none were legal,     |
|   return either MATE or DRAW depending on whether the    |
|   side to move is in check or not.                       |
|                                                          |
 ----------------------------------------------------------
*/
  if (first_move == 1) {
    value=(Check(wtm)) ? -(MATE-1) :
                             ((wtm==root_wtm) ? DrawScore() : -DrawScore());
    if (value >=alpha && value <beta) {
      SavePVS(1,value,0);
#if !defined(FAST)
      if (1 <= trace_level) printf("Search() no moves!  ply=1\n");
#endif
    }
    return(value);
  }
  else {
    if (alpha != initial_alpha) {
      memcpy(&pv[0].path[1],&pv[1].path[1],(pv[1].path_length)*4);
      memcpy(&pv[0].path_hashed,&pv[1].path_hashed,3);
      pv[0].path[0]=current_move[0];
      HistoryBest(1,depth,wtm);
    }
    StoreBest(1,depth,wtm,alpha,initial_alpha);
    return(alpha);
  }
}

/* modified 11/26/96 */
/*
********************************************************************************
*                                                                              *
*   SearchOutput() is used to print the principal variation whenever it        *
*   changes.  one additional feature is that SearchOutput() will try to do     *
*   something about variations truncated by the transposition table.  if the   *
*   variation was cut short by a transposition table hit, then we can make the *
*   last move, add it to the end of the variation and extend the depth of the  *
*   variation to cover it.                                                     *
*                                                                              *
********************************************************************************
*/
void SearchOutput(int value, int bound)
{
#define PrintOK() (nodes_searched>noise_level || value>(MATE-100))
  char buffer[500], *buffp, *bufftemp;
  register int *mv, *mvp;
  register int i, j, wtm;
  int dummy=0, temp_root_nodes;

/*
 ----------------------------------------------------------
|                                                          |
|   first, move the best move to the top of the ply-1 move |
|   list if it's not already there, so that it will be the |
|   first move tried in the next iteration.                |
|                                                          |
 ----------------------------------------------------------
*/
  wtm=root_wtm;
  if (!abort_search) {
    whisper_value=(analyze_mode && !root_wtm) ? -value : value;
    whisper_depth=iteration_depth;
    for (mvp=last[0];mvp<last[1];mvp++) if(current_move[1]== *mvp) break;
    if (mvp != last[0]) {
      temp_root_nodes=root_nodes[mvp-last[0]];
      for (mv=mvp;mv>last[0];mv--) {
        *mv=*(mv-1);
        root_nodes[mv-last[0]]=root_nodes[mv-1-last[0]];
      }
      root_nodes[0]=temp_root_nodes;
      *last[0]=current_move[1];
      easy_move=0;
    }
    end_time=GetTime(time_type);
/*
 ----------------------------------------------------------
|                                                          |
|   if this is not a fail-high move, then output the PV    |
|   by walking down the path being backed up.              |
|                                                          |
 ----------------------------------------------------------
*/
    if(value < bound) {
      buffer[0]=0;
      UnMakeMove(1,pv[1].path[1],root_wtm);
      for (i=1;i<=(int) pv[1].path_length;i++) {
        sprintf(buffer+strlen(buffer)," %s",OutputMove(&pv[1].path[i],i,wtm));
        MakeMove(i,pv[1].path[i],wtm);
        wtm=ChangeSide(wtm);
      }
/*
 ----------------------------------------------------------
|                                                          |
|   if the pv was terminated prematurely by a trans/ref    |
|   hit, see if any more moves are in the trans/ref table  |
|   and if so, add 'em to the end of the PV so we will     |
|   have better move ordering next iteration.              |
|                                                          |
 ----------------------------------------------------------
*/
      if(pv[1].path_hashed == 1) {
        for (i=pv[1].path_length+1;i<=MAXPLY;i++) {
          LookUp(i,0,wtm,&dummy,&dummy);
          if (hash_move[i] && ValidMove(i,wtm,hash_move[i])) {
            pv[1].path[i]=hash_move[i];
            for (j=1;j<i;j++) 
              if (pv[1].path[i] == pv[1].path[j]) break;
            if (j < i) break;
            pv[1].path_length++;
            sprintf(buffer+strlen(buffer)," %s",OutputMove(&pv[1].path[i],i,wtm));
            MakeMove(i,pv[1].path[i],wtm);
          }
          else break;
          wtm=ChangeSide(wtm);
        }
        sprintf(buffer+strlen(buffer)," <HT>");
      }
      else if(pv[1].path_hashed == 2) 
        sprintf(buffer+strlen(buffer)," <EGTB>");
      strcpy(whisper_text,buffer);
      if (PrintOK()) {
        printf("               %2i   %s%s   ",iteration_depth,
              DisplayTime(end_time-start_time),DisplayEvaluation(value));
        buffp=buffer+1;
        do {
          if ((int) strlen(buffp) > 34) 
            bufftemp=strchr(buffp+34,' ');
          else 
            bufftemp=0;
          if (bufftemp) *bufftemp=0;
          printf("%s\n",buffp);
          buffp=bufftemp+1;
          if (bufftemp) printf("                                    ");
        } while(bufftemp);
        Whisper(6,iteration_depth,end_time-start_time,whisper_value,
                nodes_searched,0,whisper_text);
      }
      for (i=pv[1].path_length;i>1;i--) {
        wtm=ChangeSide(wtm);
        UnMakeMove(i,pv[1].path[i],wtm);
      }
    }
    else {
      if (PrintOK()) {
        printf("               %2i   %s     ++   ",iteration_depth,
        DisplayTime(end_time-start_time));
        UnMakeMove(1,current_move[1],wtm);
        printf("%s!!\n",OutputMove(&current_move[1],1,wtm));
        sprintf(whisper_text," %s!!",OutputMove(&current_move[1],1,wtm));
        MakeMove(1,current_move[1],wtm);
        Whisper(6,iteration_depth,end_time-start_time,whisper_value,
                nodes_searched,-1,whisper_text);
      }
      if (current_move[1] != pv[1].path[1]) {
        pv[1].path[1]=current_move[1];
        pv[1].path_length=1;
        pv[1].path_hashed=0;
        pv[1].path_iteration_depth=iteration_depth;
      }
    }
  }
}

/* modified 05/20/96 */
/*
********************************************************************************
*                                                                              *
*   SearchTrace() is used to print the search trace output each time a node is *
*   traversed in the tree.                                                     *
*                                                                              *
********************************************************************************
*/
void SearchTrace(int ply, int depth, int wtm, int alpha, int beta, char* name,
                 int phase)
{
  int i;
  for (i=1;i<ply;i++) printf("  ");
  printf("%d  %s d:%5.2f [%s,",ply,OutputMove(&current_move[ply],ply,wtm),
         (double) depth/ (double) INCREMENT_PLY,DisplayEvaluation(alpha));
  printf("%s] n:%d %s(%d)\n", DisplayEvaluation(beta),
         (nodes_searched),name,phase);
}
