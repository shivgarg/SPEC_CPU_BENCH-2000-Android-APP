#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chess.h"
#include "data.h"

/* last modified 10/14/97 */
/*
********************************************************************************
*                                                                              *
*   Iterate() is the routine used to drive the iterated search.  it repeatedly *
*   calls search, incrementing the search depth after each call, until either  *
*   time is exhausted or the maximum set search depth is reached.              *
*                                                                              *
********************************************************************************
*/
int Iterate(int wtm, int search_type, int root_list_done)
{
  int *mvp;
  char buffer[500], *buffp, *bufftemp;
  int i, value=0, time_used;
  int twtm, used_w, used_b;
  int cpu_start, cpu_end;
  int correct, correct_count, material=0, sorted, temp;

/*
 ----------------------------------------------------------
|                                                          |
|  initialize.                                             |
|                                                          |
|  produce the root move list, which is ordered and kept   |
|  for the duration of this search (the order may change   |
|  as new best moves are backed up to the root of course.) |
|                                                          |
 ----------------------------------------------------------
*/
  time_abort=0;
  abort_search=0;
  book_move=0;
  program_start_time=GetTime(time_type);
  start_time=GetTime(time_type);
  cpu_start=GetTime(cpu);
  elapsed_start=GetTime(elapsed);
  PreEvaluate(wtm);
    if (!root_list_done) RootMoveList(wtm);
    correct_count=0;
    burp=15*100;
    transposition_id++;
    transposition_id=transposition_id&7;
    if (!transposition_id) transposition_id++;
    program_start_time=GetTime(time_type);
    start_time=GetTime(time_type);
    cpu_start=GetTime(cpu);
    cpu_percent=0;
    elapsed_start=GetTime(elapsed);
    nodes_searched=0;
    next_time_check=nodes_between_time_checks;
    evaluations=0;
#if !defined(FAST)
    transposition_hits=0;
    transposition_probes=0;
    pawn_probes=0;
    pawn_hits=0;
#endif
    tb_probes=0;
    tb_probes_successful=0;
    check_extensions_done=0;
    recapture_extensions_done=0;
    passed_pawn_extensions_done=0;
    one_reply_extensions_done=0;
    root_wtm=wtm;
    root_total_white_pieces=TotalWhitePieces;
    root_total_white_pawns=TotalWhitePawns;
    root_total_black_pieces=TotalBlackPieces;
    root_total_black_pawns=TotalBlackPawns;
/*
 ----------------------------------------------------------
|                                                          |
|  if there are no legal moves, it is either mate or draw  |
|  depending on whether the side to move is in check or    |
|  not (mate or stalemate.)                                |
|                                                          |
 ----------------------------------------------------------
*/
    if (last[0] == last[1]) {
      program_end_time=GetTime(time_type);
      pv[0].path_length=0;
      pv[0].path_iteration_depth=10;
      if (Check(wtm)) {
        root_value=-(MATE-1);
        last_search_value=-(MATE-1);
      }
      else {
        root_value=DrawScore();
        last_search_value=DrawScore();
      }
      printf("\n              depth   time  score   variation\n");
      printf("                                    (no moves)\n");
      nodes_searched=1;
      return(root_value);
    }
    if (last[0]==(last[1]-1) && !booking && !pondering && annotate_mode==0) {
      program_end_time=GetTime(time_type);
      pv[0].path_length=1;
      pv[0].path_hashed=0;
      pv[0].path_iteration_depth=10;
      pv[0].path[1]=*last[0];
      nodes_searched=1;
      printf("\n              depth   time  score   variation\n");
      if (analyze_mode && xboard) {
        printf("                       (only move)   ");
        printf(" %s\n",OutputMove(last[0],1,wtm));
      }
      else {
        printf("                       (only move)   ");
        printf(" %s\n",OutputMove(last[0],1,wtm));
      }
      if (last_search_value > MATE-200) {
        last_search_value+=2;
        return(last_search_value);
      }
      else if (last_search_value < -MATE+200) {
        last_search_value-=2;
        return(last_search_value);
      }
      else
        return(last_search_value);
    }
/*
 ----------------------------------------------------------
|                                                          |
|   now set the search time and iteratively call Search()  |
|   to analyze the position deeper and deeper.  note that  |
|   Search() is called with an alpha/beta window roughly   |
|   1/3 of a pawn on either side of the score last         |
|   returned by search.  also, after the first root move   |
|   is searched, this window is collapsed to n and n+1     |
|   (where n is the value for the first root move.)  often |
|   a better move is found, which causes search to return  |
|   <beta> as the score.  we then relax beta depending on  |
|   its value:  if beta = alpha+1, set beta to alpha+1/3   |
|   of a pawn;  if beta = alpha+1/3 pawn, then set beta to |
|   + infinity.                                            |
|                                                          |
 ----------------------------------------------------------
*/
    TimeSet(search_type);
    iteration_depth=1;
    if (last_pv.path_iteration_depth > 1)
      iteration_depth=last_pv.path_iteration_depth+1;
    printf("\n              depth   time  score   variation (%d)\n",
          iteration_depth);
    time_abort=0;
    abort_search=0;
    program_start_time=GetTime(time_type);
    start_time=GetTime(time_type);
    cpu_start=GetTime(cpu);
    elapsed_start=GetTime(elapsed);
/*
 ----------------------------------------------------------
|                                                          |
|   now install the old PV into the hash table so that     |
|   these moves will be followed first.                    |
|                                                          |
 ----------------------------------------------------------
*/
    if (iteration_depth > 1) {
      twtm=wtm;
      pv[0]=last_pv;
      for (i=1;i<=(int) last_pv.path_length;i++) {
        pv[i]=pv[i-1];
        StorePV(i, twtm);
        MakeMove(i,last_pv.path[i],twtm);
        twtm=ChangeSide(twtm);
      }
      for (i=last_pv.path_length;i>0;i--) {
        twtm=ChangeSide(twtm);
        UnMakeMove(i,last_pv.path[i],twtm);
      }
      root_alpha=last_value-30;
      root_value=last_value-30;
      root_beta=last_value+30;
    }
    else {
      root_alpha=-MATE-1;
      root_value=-MATE-1;
      root_beta=MATE+1;
    }
    for (i=0;i<256;i++) root_nodes[i]=0;
    for (;iteration_depth<=60;iteration_depth++) {
      if (trace_level) {
        printf("==================================\n");
        printf("=      search iteration %2d       =\n",iteration_depth);
        printf("==================================\n");
      }
      for (mvp=last[0];mvp<last[1];mvp++)
        searched_this_root_move[mvp-last[0]]=0;
      search_failed_high=0;
      search_failed_low=0;
      if (nodes_searched) {
        nodes_between_time_checks=nodes_per_second;
        nodes_between_time_checks=Min(nodes_between_time_checks,200000);
        if (!analyze_mode) {
          if (time_limit>300 && !auto232);
          else if (time_limit>100 || auto232) nodes_between_time_checks/=10;
          else if (time_limit > 50) nodes_between_time_checks/=20;
          else nodes_between_time_checks/=100;
        } else {
/*
   Do this to get fast response time in analyze mode
*/
          nodes_between_time_checks=4000;
        }
      }
      while (!time_abort && !abort_search) {
        value=SearchRoot(root_alpha, root_beta, wtm,
                         iteration_depth*INCREMENT_PLY);
        if (value >= root_beta) {
          search_failed_high=1;
          root_alpha=root_beta-1;
          root_value=root_alpha;
          root_beta=MATE+1;
          searched_this_root_move[0]=0;
        }
        else if (value <= root_alpha) {
          if (!search_failed_high) {
            for (mvp=last[0];mvp<last[1];mvp++)
              searched_this_root_move[mvp-last[0]]=0;
            search_failed_low=1;
            root_alpha=-MATE-1;
            root_value=root_alpha;
            easy_move=0;
            if (nodes_searched>noise_level && !time_abort && !abort_search) {
              printf("               %2i   %s     --   ",iteration_depth,
                    DisplayTime(GetTime(time_type)-start_time));
              printf("%s\n",OutputMove(last[0],1,wtm));
            }
          }
          else break;
        }
        else
          break;
      }
      if (root_value>root_alpha && root_value<root_beta) 
        last_search_value=root_value;
/*
 ----------------------------------------------------------
|                                                          |
|   if we are running a test suite, check to see if we can |
|   exit the search.  this happens when N successive       |
|   iterations produce the correct solution.  N is set by  |
|   the test command in Option().                          |
|                                                          |
 ----------------------------------------------------------
*/
      correct=solution_type;
      for (i=0;i<number_of_solutions;i++) {
        if (!solution_type) {
          if (solutions[i] == pv[1].path[1]) correct=1;
        }
        else
          if (solutions[i] == pv[1].path[1]) correct=0;
      }
      if (correct) correct_count++;
      else correct_count=0;
/*
 ----------------------------------------------------------
|                                                          |
|   if the search terminated normally, then dump the PV    |
|   and search statistics (we don't do this if the search  |
|   aborts because the opponent doesn't make the predicted |
|   move...)                                               |
|                                                          |
 ----------------------------------------------------------
*/
      twtm=wtm;
      end_time=GetTime(time_type);
      cpu_end=GetTime(cpu)-cpu_start;
      cpu_end=(cpu_end > 0) ? cpu_end : 1;
      if (cpu_end > 100)
        nodes_per_second=(BITBOARD) nodes_searched*100/(BITBOARD) cpu_end;
      if (value != -(MATE-1)) {
        buffer[0]=0;
        for (i=1;i<=(int) pv[1].path_length;i++) {
          pv[i+1]=pv[i];
          if (!time_abort && !abort_search && (nodes_searched>noise_level ||
               abs(value)>MATE-100 || correct_count>=early_exit ||
               pv[1].path_hashed==2)) {
            sprintf(buffer+strlen(buffer)," %s",OutputMove(&pv[1].path[i],i,twtm));
          }
          if(!time_abort && !abort_search) StorePV(i, twtm);
          MakeMove(i,pv[1].path[i],twtm);
          twtm=ChangeSide(twtm);
        }
        material=0;
        for (i=0;i<64;i++)
          switch (PieceOnSquare(i)) {
          case 0:
            break;
          case pawn:
            material+=1;
            break;
          case knight:
            material+=3;
            break;
          case king:
            break;
          case bishop:
            material+=3;
            break;
          case rook:
            material+=5;
            break;
          case queen:
            material+=9;
            break;
          case -pawn:
            material-=1;
            break;
          case -knight:
            material-=3;
            break;
          case -king:
            break;
          case -bishop:
            material-=3;
            break;
          case -rook:
            material-=5;
            break;
          case -queen:
            material-=9;
          }
        for (i=pv[1].path_length;i>0;i--) {
          twtm=ChangeSide(twtm);
          UnMakeMove(i,pv[1].path[i],twtm);
        }
      }
      if (pv[1].path_hashed == 1)
        sprintf(buffer+strlen(buffer)," <HT>");
      else if(pv[1].path_hashed == 2) 
        sprintf(buffer+strlen(buffer)," <EGTB>");
      if (!time_abort && !abort_search && (nodes_searched>noise_level ||
          correct_count>=early_exit || value>MATE-100 || pv[1].path_hashed==2)) {
        Whisper(5,iteration_depth,end_time-start_time,whisper_value,
                nodes_searched,0,buffer);
        printf("               %2i-> %s%s   ",iteration_depth,
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
          if (bufftemp) 
            printf("                                    ");
        } while(bufftemp);
      }
      root_alpha=value-30;
      root_value=root_alpha;
      root_beta=value+30;
      if ((iteration_depth > 1) && (value > MATE-100) &&
          (value > last_mate_score)) break;
      if ((iteration_depth >= search_depth) && search_depth) break;
      if (time_abort || abort_search) break;
      end_time=GetTime(time_type)-start_time;
      if (thinking && ((int) end_time >= time_limit)) break;
      if (correct_count >= early_exit) break;
      do {
        sorted=1;
        for (mvp=last[0]+1;mvp<last[1]-1;mvp++) {
          if (root_nodes[mvp-last[0]] < root_nodes[mvp-last[0]+1]) {
            temp=*mvp;
            *mvp=*(mvp+1);
            *(mvp+1)=temp;
            temp=root_nodes[mvp-last[0]];
            root_nodes[mvp-last[0]]=root_nodes[mvp-last[0]+1];
            root_nodes[mvp-last[0]+1]=temp;
            sorted=0;
          }
        }
      } while(!sorted);
/*
      for (mvp=last[0];mvp<last[1];mvp++) {
        printf(" %10s  %10d\n",OutputMove(mvp,1,wtm),root_nodes[mvp-last[0]]);
      }
*/
    }
/*
 ----------------------------------------------------------
|                                                          |
|   search done, now display statistics, depending on the  |
|   verbosity level set.                                   |
|                                                          |
 ----------------------------------------------------------
*/
    used_w=0;
    used_b=0;
#if !defined(FAST)
    for (i=0;i<hash_table_size;i++) {
      if (Shiftr((trans_ref_ba+i)->word1,61) == transposition_id) used_b++;
      if (Shiftr((trans_ref_wa+i)->word1,61) == transposition_id) used_w++;
    }
#endif
    end_time=GetTime(time_type);
    time_used=(end_time-start_time);
    if (time_used < 10) time_used=10;
    cpu_end=GetTime(cpu)-cpu_start;
    cpu_end=(cpu_end > 0) ? cpu_end : 1;
    elapsed_end=GetTime(elapsed)-elapsed_start;
    if (elapsed_end) cpu_percent=Min(100*cpu_end/elapsed_end,100);
    else cpu_percent=100;
    if (time_used > 100)
      nodes_per_second=(BITBOARD) nodes_searched*100/(BITBOARD) cpu_end;
    evaluations=(evaluations) ? evaluations : 1;
    if ((!abort_search || time_abort) && !puzzling) {
      if (ChangeSide(wtm)) material=-material;
/*      printf("              time:%s  cpu:%d%%  mat:%d", */
/*            DisplayTime(end_time-start_time), cpu_percent, material);  */
      printf("              time:###  cpu:###  mat:%d",
             material); 
      printf("  n:%u", nodes_searched);
/*      printf("  nps:%d\n", nodes_per_second); */
      printf("  nps: ####\n");
      printf("              ext-> checks:%d recaps:%d pawns:%d 1rep:%d\n",
            check_extensions_done, recapture_extensions_done,
            passed_pawn_extensions_done,one_reply_extensions_done);
      printf("              predicted:%d  nodes:%u  evals:%u\n", 
             predicted,nodes_searched, evaluations);
      printf("              endgame tablebase-> probes done: %d  successful: %d\n",
            tb_probes, tb_probes_successful);
#if !defined(FAST)
      printf("              hashing-> trans/ref:%d%%  pawn:%d%%  used:w%d%% b%d%%\n",
            100*transposition_hits/(transposition_probes+1),
            100*pawn_hits/(pawn_probes+1),
            used_w*100/(hash_table_size+1), used_b*100/(hash_table_size+1));
#endif
    }
  program_end_time=GetTime(time_type);
  pv[0]=pv[1];
  return(last_search_value);
}
