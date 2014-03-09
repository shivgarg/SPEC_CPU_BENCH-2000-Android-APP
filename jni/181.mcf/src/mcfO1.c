/**************************************************************************
FILE: mcf.c (main for the mcf submission to SPEC)

AUTHOR: Andreas Loebel

    Konrad-Zuse-Zentrum fuer Informationstechnik Berlin (ZIB)
    Takustr. 7
    14195 Berlin-Dahlem

Copyright (c) 1998,1999   ZIB Berlin   All Rights Reserved
**************************************************************************/
/*  LAST EDIT: Thu Mar 18 11:04:24 1999 by Loebel/Borndoerfer (opt0)  */




#include "mcf.h"
#include <jni.h>
#include <time.h>
#define REPORT

extern long min_impl_duration;
network_t net;





#ifdef _PROTO_
long global_opt( void )
#else
long global_opt( )
#endif
{
    long new_arcs;
    
    new_arcs = -1;

        
    while( new_arcs )
    {
#ifdef REPORT
        printf( "active arcs                : %ld\n", net.m );
#endif

        primal_net_simplex( &net );


#ifdef REPORT
        printf( "simplex iterations         : %ld\n", net.iterations );
        printf( "flow value                 : %0.0f\n", flow_cost(&net) );
#endif


        new_arcs = price_out_impl( &net );

#ifdef REPORT
        if( new_arcs )
            printf( "new implicit arcs          : %ld\n", new_arcs );
#endif
        
        if( new_arcs < 0 )
        {
#ifdef REPORT
            printf( "not enough memory, exit(-1)\n" );
#endif

            exit(-1);
        }

#ifndef REPORT
        printf( "\n" );
#endif

    }

    printf( "checksum                   : %ld\n", net.checksum );

    return 0;
}






#ifdef _PROTO_
int main181( int argc, char *argv[] )
#else
int main181( argc, argv )
    int argc;
    char *argv[];
#endif
{
    if( argc < 2 )
        return -1;


    printf( "\nMCF SPEC version 1.6.%s\n", ARITHMETIC_TYPE );
    printf( "by  Andreas Loebel\n" );
    printf( "Copyright (c) 1998,1999   ZIB Berlin\n" );
    printf( "All Rights Reserved.\n" );
    printf( "\n" );


    memset( (void *)(&net), 0, (size_t)sizeof(network_t) );
    net.bigM = (long)BIGM;

    strcpy( net.inputfile, argv[1] );
    
    if( read_min( &net ) )
    {
        printf( "read error, exit\n" );
        getfree( &net );
        return -1;
    }


#ifdef REPORT
    printf( "nodes                      : %ld\n", net.n_trips );
#endif


    primal_start_artificial( &net );
    global_opt( );

    /*
    suspend_impl( &net, (cost_t)(-1), 0 );
    */

#ifdef REPORT
    printf( "optimal\n" );
#endif

    

    if( write_circulations( "mcf.out", &net ) )
    {
        getfree( &net );
        return -1;    
    }


    getfree( &net );
    return 0;
}

jdoubleArray Java_com_example_hellojni_Run_callmcfO1(JNIEnv * env , jobject thiz, jstring path,jint a)
{
	//__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "hsduwdiwdwdeudei");
	double as[3];
	const char * str=(*env)->GetStringUTFChars(env,path,0);
	const char * ref="/ref";
	const char * train="/train";
	//__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "zxcvbnmcxcxbncvzcn");
	const char * test="/test";
	//char * ans="";
	int c=(int)a;
	jdoubleArray result = (*env)->NewDoubleArray(env,3);
	jboolean isCopy1;	double time_spent;
    jdouble* dest = (*env)->GetDoubleArrayElements(env, result, &isCopy1);
	//__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "878967856746536 ");
	dest[0]=0;dest[1]=0;dest[2]=0;
	if(c%2==1)
	{//	__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "34wer89uy89y98yioi");
		char * h=(char *)malloc(strlen(str)+strlen(ref)+1);
		h[0]='\0';
		strcat(h,str);strcat(h,ref);
		chdir(h);
		char * arg[3];
	arg[0]="dummy";
	arg[1]="inp.in";
	arg[2]=NULL;
	clock_t begin, end;
	begin=clock();
	main181(2,arg);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		dest[0]=time_spent;
   	}
	if((c>>1)%2==1)
	{
		char * h=(char *)malloc(strlen(str)+strlen(test)+1);
		h[0]='\0';
		strcat(h,str);strcat(h,test);
		//__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "yuyniyiyuiomuooi");
		chdir(h);
			char * arg[3];
	arg[0]="dummy";
	arg[1]="inp.in";
	arg[2]=NULL;
	clock_t begin, end;
	begin=clock();
	main181(2,arg);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		dest[1]=time_spent;
	}
	if((c>>2)%2==1)
	{
		char * h=(char *)malloc(strlen(str)+strlen(train)+1);
		h[0]='\0';
		strcat(h,str);strcat(h,train);
		//__android_log_print(ANDROID_LOG_WARN, "NATIVE CODE", "yuyniyiyuiomuooi");
		chdir(h);
			char * arg[3];
	arg[0]="dummy";
	arg[1]="inp.in";
	arg[2]=NULL;
	clock_t begin, end;
	begin=clock();
	main181(2,arg);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		dest[2]=time_spent;
	}
	return result;

}
