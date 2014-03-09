#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int linenum;  /* line in file being parsed */

#ifndef TRUE       /* Some compilers predefine TRUE, FALSE */
typedef enum {FALSE, TRUE} boolean;
#else
typedef int boolean;
#endif

struct s_linked_vptr {void *data_vptr; struct s_linked_vptr *next;};

struct s_linked_int {int data; struct s_linked_int *next;};
typedef struct s_linked_int t_linked_int; 
/* Linked lists of void pointers and integers, respectively.                */

struct s_ivec {int nelem; int *list;};
/* Integer vector.  nelem stores length, list[0..nelem-1] stores list of    *
 * integers.                                                                */


#define BUFSIZE 300     /* Maximum line length for various parsing proc. */
#define max(a,b) (((a) > (b))? (a) : (b))
#define min(a,b) ((a) > (b)? (b) : (a))
#define nint(a) ((int) floor (a + 0.5))

FILE *my_fopen (char *fname, char *flag, int prompt);
void *my_calloc (size_t nelem, size_t size); 
void *my_malloc (size_t size);
void *my_realloc (void *ptr, size_t size);
void *my_chunk_malloc (size_t size, struct s_linked_vptr **chunk_ptr_head,
         int *mem_avail_ptr, char **next_mem_loc_ptr); 
void free_chunk_memory (struct s_linked_vptr *chunk_ptr_head); 

struct s_linked_vptr *insert_in_vptr_list (struct s_linked_vptr *head,
         void *vptr_to_add); 
t_linked_int *insert_in_int_list (t_linked_int *head, int data, t_linked_int **
         free_list_head_ptr); 
void free_int_list (t_linked_int **int_list_head_ptr); 


char *my_strtok(char *ptr, char *tokens, FILE *fp, char *buf);
char *my_fgets(char *buf, int max_size, FILE *fp); 


void free_ivec_vector (struct s_ivec *ivec_vector, int nrmin, int nrmax);
void free_ivec_matrix (struct s_ivec **ivec_matrix, int nrmin, int nrmax,
         int ncmin, int ncmax);
void free_ivec_matrix3 (struct s_ivec ***ivec_matrix3, int nrmin, int nrmax,
         int ncmin, int ncmax, int ndmin, int ndmax); 

void **alloc_matrix (int nrmin, int nrmax, int ncmin, int ncmax, 
      size_t elsize);
void ***alloc_matrix3 (int nrmin, int nrmax, int ncmin, int ncmax, int ndmin,
      int ndmax, size_t elsize); 
void free_matrix (void *vptr, int nrmin, int nrmax, int ncmin, size_t elsize);
void free_matrix3 (void *vptr, int nrmin, int nrmax, int ncmin, int ncmax,
      int ndmin, size_t elsize);

void my_srandom (int seed);
int my_irand (int imax);
float my_frand (void);
