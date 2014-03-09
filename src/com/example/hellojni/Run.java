package com.example.hellojni;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import com.arieslabs.assetbridge.Assetbridge;


import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class Run extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		System.out.println("first print statement");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_run);
		finalResult=(TextView)findViewById(R.id.tv_result);
		//crafty c=new crafty();
		//c.execute();
	this.execute();
	}


	private TextView finalResult;
	private String resp;
	static{ 
	System.loadLibrary("crafty");System.loadLibrary("craftyO1");System.loadLibrary("craftyO2");	System.loadLibrary("craftyO3");	System.loadLibrary("craftyO3F");
	System.loadLibrary("mcf");System.loadLibrary("mcfO1");System.loadLibrary("mcfO2");System.loadLibrary("mcfO3");System.loadLibrary("mcfO3F");
	System.loadLibrary("vortex");System.loadLibrary("vortexO1");System.loadLibrary("vortexO2");	System.loadLibrary("vortexO3");	System.loadLibrary("vortexO3F");
	System.loadLibrary("bzip2");System.loadLibrary("bzip2O1");System.loadLibrary("bzip2O2");System.loadLibrary("bzip2O3");	System.loadLibrary("bzip2O3F");
	System.loadLibrary("gzip");System.loadLibrary("gzipO1");System.loadLibrary("gzipO2");System.loadLibrary("gzipO3");	System.loadLibrary("gzipO3F");
	System.loadLibrary("parser");System.loadLibrary("parserO1");System.loadLibrary("parserO2");	System.loadLibrary("parserO3");	System.loadLibrary("parserO3F");
	System.loadLibrary("twolf");System.loadLibrary("twolfO1");System.loadLibrary("twolfO2");System.loadLibrary("twolfO3");	System.loadLibrary("twolfO3F");
	System.loadLibrary("vpr");System.loadLibrary("vprO1");System.loadLibrary("vprO2");System.loadLibrary("vprO3");	System.loadLibrary("vprO3F");
	System.loadLibrary("gcc");System.loadLibrary("gccO1");System.loadLibrary("gccO2");System.loadLibrary("gccO3");	System.loadLibrary("gccO3F");
	}
	crafty197 obj = new crafty197();
	
	public native double[] callcrafty(String a,int g);
	public native double[] callcraftyO1(String a,int g);
	public native double[] callcraftyO2(String a,int g);
	public native double[] callcraftyO3(String a,int g);
	public native double[] callcraftyO3F(String a,int g);
	public native double[] callmcf(String a,int g);
	public native double[] callmcfO1(String a,int g);
	public native double[] callmcfO2(String a,int g);
	public native double[] callmcfO3(String a,int g);
	public native double[] callmcfO3F(String a,int g);
	public native double[] callgcc(String a,int g);
	public native double[] callgccO1(String a,int g);
	public native double[] callgccO2(String a,int g);
	public native double[] callgccO3(String a,int g);
	public native double[] callgccO3F(String a,int g);
	public native double[] callgap(String a,int g);
	public native double[] callgapO1(String a,int g);
	public native double[] callgapO2(String a,int g);
	public native double[] callgapO3(String a,int g);
	public native double[] callgapO3F(String a,int g);
	public native String callvortex(String a, int i, int i2);
	public native String callvortexO1(String a, int i, int i2);
	public native String callvortexO2(String a, int i, int i2);
	public native String callvortexO3(String a, int i, int j);
	public native String callvortexO3F(String a, int i, int j);
	public native double[] callbzip2(String a,int g);
	public native double[] callbzip2O1(String a,int g);
	public native double[] callbzip2O2(String a,int g);
	public native double[] callbzip2O3(String a,int g);
	public native double[] callbzip2O3F(String a,int g);
	public native double[] callgzip(String a,int g);
	public native double[] callgzipO1(String a,int g);
	public native double[] callgzipO2(String a,int g);
	public native double[] callgzipO3(String a,int g);
	public native double[] callgzipO3F(String a,int g);
	public native double[] callparser(String a,int g);
	public native double[] callparserO1(String a,int g);
	public native double[] callparserO2(String a,int g);
	public native double[] callparserO3(String a,int g);
	public native double[] callparserO3F(String a,int g);
	public native double[] calltwolf(String a,int g);
	public native double[] calltwolfO1(String a,int g);
	public native double[] calltwolfO2(String a,int g);
	public native double[] calltwolfO3(String a,int g);
	public native double[] calltwolfO3F(String a,int g);
	public native double[] callvpr(String a,int g);
	public native double[] callvprO1(String a,int g);
	public native double[] callvprO2(String a,int g);
	public native double[] callvprO3(String a,int g);
	public native double[] callvprO3F(String a,int g);

	  private void writefile(int a,int b,double[] h) throws IOException
		{	
	    	int c = Testcase.c;
			double ref = h[0];
			double test = h[1];
			double train = h[2];
			boolean bool_ref=(c%2==1)?true:false;
			boolean bool_test=((c>>1)%2==1)?true:false;
			boolean bool_train=((c>>2)%2==1)?true:false;
			String file_string = "";
			String filename = "";
			if(a==0)
	  		{
	  			//MCF
				switch(b){
					case 0: filename = "mcfO"; break;
					case 1: filename = "mcfO1"; break;
					case 2: filename = "mcfO2"; break;
					case 3: filename = "mcfO3"; break;
					case 4: filename = "mcfO3F"; break;
					}
	  		}
			if(a==1)
	  		{
	  			//GAP
				switch(b){
				case 0: filename = "gapO"; break;
				case 1: filename = "gapO1"; break;
				case 2: filename = "gapO2"; break;
				case 3: filename = "gapO3"; break;
				case 4: filename = "gapO3F"; break;
				}
	  		}
			if(a==2)
	  		{
	  			//VORTEX

				switch(b){
					case 0: filename = "vortexO"; break;
					case 1: filename = "vortexO1"; break;
					case 2: filename = "vortexO2"; break;
					case 3: filename = "vortexO3"; break;
					case 4: filename = "vortexO3F"; break;
					}
	  		}
			if(a==3)
	  		{
	  			//CRAFTY

				switch(b){
					case 0: filename = "craftyO"; break;
					case 1: filename = "craftyO1"; break;
					case 2: filename = "craftyO2"; break;
					case 3: filename = "craftyO3"; break;
					case 4: filename = "craftyO3F"; break;
					}	
	  		}
			if(a==4)
	  		{
	  			//BZIP2

				switch(b){
					case 0: filename = "bzip2O"; break;
					case 1: filename = "bzip2O1"; break;
					case 2: filename = "bzip2O2"; break;
					case 3: filename = "bzip2O3"; break;
					case 4: filename = "bzip2O3F"; break;
					}	
	  		}
			if(a==5)
	  		{
	  			//GZIP

				switch(b){
					case 0: filename = "gzipO"; break;
					case 1: filename = "gzipO1"; break;
					case 2: filename = "gzipO2"; break;
					case 3: filename = "gzipO3"; break;
					case 4: filename = "gzipO3F"; break;
					}
			}
			if(a==6)
	  		{
	  			//PARSER

				switch(b){
					case 0: filename = "parserO"; break;
					case 1: filename = "parserO1"; break;
					case 2: filename = "parserO2"; break;
					case 3: filename = "parserO3"; break;
					case 4: filename = "parserO3F"; break;
					}	
	  		}
			if(a==7)
	  		{
	  			//TWOLF

				switch(b){
					case 0: filename = "twolfO"; break;
					case 1: filename = "twolfO1"; break;
					case 2: filename = "twolfO2"; break;
					case 3: filename = "twolfO3"; break;
					case 4: filename = "twolfO3F"; break;
					}	
	  		}
			if(a==8)
	  		{
	  			//VPR

				switch(b){
					case 0: filename = "vprO"; break;
					case 1: filename = "vprO1"; break;
					case 2: filename = "vprO2"; break;
					case 3: filename = "vprO3"; break;
					case 4: filename = "vprO3F"; break;
					}	
	  		}
			if(a==9)
	  		{
	  			//GCC

				switch(b){
					case 0: filename = "gccO"; break;
					case 1: filename = "gccO1"; break;
					case 2: filename = "gccO2"; break;
					case 3: filename = "gccO3"; break;
					case 4: filename = "gccO3F"; break;
					}
	  		}
				try
				{
			    	File file = new File(this.getFilesDir(), filename);
			    	if(file.exists())
			    	{
			    		FileInputStream fis = new FileInputStream(file);
				    	InputStreamReader isr = new InputStreamReader(fis);
				    	BufferedReader br = new BufferedReader(isr);
				    	if(!bool_ref)
				    	{
				    		ref = Double.parseDouble(br.readLine());
				    	}
				    	if(!bool_test)
				    	{
				    		test = Double.parseDouble(br.readLine());
				    	}
				    	if(!bool_train)
				    	{
				    		train = Double.parseDouble(br.readLine());
				    	}
				    	br.close();
		    		}
			    	else
			    	{
						file.createNewFile();
			    	}
			    	file_string = ref + "\n" + test + "\n" + train;
			    	FileOutputStream OutputStream;
			    	OutputStream = openFileOutput(filename, Context.MODE_PRIVATE);
			    	OutputStream.write(file_string.getBytes());
			    	OutputStream.close();	
				}
			   	catch(Exception e)
			   	{
			    		System.out.println("IOE");
			    }
			}
		
boolean o,o1,o2,o3,o3f;
	Result a=new Result();

	public void res(View view)
	{
		
		Intent intent=new Intent();
		intent.setAction(android.content.Intent.ACTION_VIEW);
		File sdCard = Environment.getExternalStorageDirectory();
		File file = new File (sdCard.getAbsolutePath() + "/SPEC_CPU_Bench/Result/results.html");
		intent.setDataAndType(Uri.fromFile(file),"text/*");
		startActivity(intent);
	}
	public void exp(View view)
	{	//Called to send the file
		Intent intent = new Intent();
		intent.setAction(Intent.ACTION_SEND);
		intent.setFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
		intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
		File sdCard = Environment.getExternalStorageDirectory();
		File file = new File (sdCard.getAbsolutePath() + "/SPEC_CPU_Bench/Result/results.html");
		intent.putExtra(Intent.EXTRA_STREAM,
		  Uri.parse("file://"+file.getAbsolutePath()));
		intent.setType("text/html");
		startActivity(intent);
		
	}
	@Override
	public void onBackPressed()
	{
		if(obj.getStatus()!= AsyncTask.Status.FINISHED)
		{
			//finalResult.setText("Please Wait! BenchMarks are running. To close application kill app");
			Context context=getApplicationContext();
			CharSequence text="Please Wait! BenchMarks are running. To close kill the app";
			int duration =Toast.LENGTH_SHORT;
			Toast toast=Toast.makeText(context, text, duration);
			toast.show();
		}
		else
		{
						this.finish();
		}
		
	}
	public void execute()
	{
		int b=Next.b;
		System.out.println("ssffdfdsfsdfsdfsdfdsfsdfsd      "+CheckMain.a);
		System.out.println("ssffdfdsfsdfsdfsdfdsfsdfsd      "+b);
		System.out.println("ssffdfdsfsdfsdfsdfdsfsdfsd      "+Testcase.c);
		
		
		//Assetbridge.unpack(this,"crafty");
		//String message = Assetbridge.path;
		finalResult=(TextView)findViewById(R.id.tv_result);
		System.out.println("value of b is "+b);
		o=(b%2==1)?true:false;
		System.out.println("o is "+o);
		o1=((b>>1)%2==1)?true:false;
		System.out.println("o is "+o1);
		o2=((b>>2)%2==1)?true:false;
		System.out.println("o is "+o2);
		o3=((b>>3)%2==1)?true:false;
		System.out.println("o is "+o3);
		o3f=((b>>4)%2==1)?true:false;
		System.out.println("o is "+o3f);
		x=this;
		obj.execute("asdfvcxz");
		
		
		
		
		
	}

	static Activity x;

	public void onBackPressed(View view)
	{
		Testcase.c=0;
		finish();
	}
	
	private class crafty197 extends AsyncTask<String,String,String>
	{
		// This is called each time you call publishProgress()
		@Override 
		protected void onProgressUpdate(String... progress) 
		{
			finalResult.setText(progress[0]);		
		}
		// This is called when doInBackground() is finished
		@Override
		protected String doInBackground(String... arg) 
		{
			// TODO Auto-generated method stub
	  		publishProgress("Running Benchmark");
	  		System.out.println("here in ");
	  		double[] a=new double[3];
	  		int c = Testcase.c;
	  		boolean bool_ref=(c%2==1)?true:false;
			boolean bool_test=((c>>1)%2==1)?true:false;
			boolean bool_train=((c>>2)%2==1)?true:false;
			
	  		if(CheckMain.a%2==1)
	  		{
	  			
	  			Assetbridge.unpack(Run.x, "mcf");
  				String m=Assetbridge.path;
	  			//MCF
	  			if(o){
					publishProgress("Mcf with no Optimization running");
					a=callmcf(m,Testcase.c);
					try {
						writefile(0,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}}
				if(o1){
					publishProgress("Mcf with O1 Optimization flag running");
					a=callmcfO1(m,Testcase.c);
					try {
						writefile(0,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o2){
					publishProgress("Mcf with O2 Optimization flag running");
					a=callmcfO2(m,Testcase.c);
					try {
						writefile(0,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3){
					publishProgress("Mcf with O3 Optimization flag running");
					a=callmcfO3(m,Testcase.c);
					try {
						writefile(0,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3f){
					publishProgress("Mcf with Ofast Optimization flag running");
					a=callmcfO3F(m,Testcase.c);
					try {
						writefile(0,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				Assetbridge.trimCache(x);
			
	  		}
	  		if((CheckMain.a>>1)%2==1)
	  		{
	  			Assetbridge.unpack(Run.x, "gap");
  				String m=Assetbridge.path;
	  			//gap
	  			if(o){
					publishProgress("gap with no Optimization running");
					a=callgap(m,Testcase.c);
					try {
						writefile(1,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}}
				if(o1){
					publishProgress("gap with O1 Optimization flag running");
					a=callgapO1(m,Testcase.c);
					try {
						writefile(1,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o2){
					publishProgress("gap with O2 Optimization flag running");
					a=callgapO2(m,Testcase.c);
					try {
						writefile(1,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3){
					publishProgress("gap with O3 Optimization flag running");
					a=callgapO3(m,Testcase.c);
					try {
						writefile(1,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3f){
					publishProgress("gap with Ofast Optimization flag running");
					a=callgapO3F(m,Testcase.c);
					try {
						writefile(1,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>2)%2==1)
	  		{
	  			Assetbridge.unpack(Run.x, "vortex");
  				String m=Assetbridge.path;
				a=new double[3];
	  			//vortex
	  			if(o){
					publishProgress("vortex with no Optimization running");
					long s=System.currentTimeMillis();long v = 0;
					if(Testcase.c%2==1){
						s=System.currentTimeMillis();
						for(int i=0;i<3;i++){
							callvortex(m,1,i);
							Assetbridge.trimCache(x);
								}
					a[0]=((double)(v-s))/1000;
					}
					v=System.currentTimeMillis();
					
					s=System.currentTimeMillis();
					if((Testcase.c>>1)%2==1)
					{						
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortex(m,2,0);
						v=System.currentTimeMillis();
						a[1]=((double)(v-s))/1000;
						Assetbridge.trimCache(x);
					}
					
					
					if((Testcase.c>>2)%2==1)
					{
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortex(m,4,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[2]=((double)(v-s))/1000;

					}
					System.out.println(a[0]+"  "+a[1]+"   "+a[2]);
					try {
						writefile(2,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}}
				if(o1){
					publishProgress("vortex with O1 Optimization flag running");
					long s=System.currentTimeMillis();long v = 0;
					if(Testcase.c%2==1){
						s=System.currentTimeMillis();
						for(int i=0;i<3;i++){
							
							Assetbridge.unpack(Run.x, "vortex");
					
							callvortexO1(m,1,i);
							
							Assetbridge.trimCache(x);}
					v=System.currentTimeMillis();

						a[0]=((double)(v-s))/1000;}
					
					if((Testcase.c>>1)%2==1)
					{						
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO1(m,2,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[1]=((double)(v-s))/1000;
					}
					
					
					if((Testcase.c>>2)%2==1)
					{
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO1(m,4,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[2]=((double)(v-s))/1000;
					}
					try {
						writefile(2,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o2){
					publishProgress("vortex with O2 Optimization flag running");
					long s=System.currentTimeMillis();long v = 0;
					if(Testcase.c%2==1){
						s=System.currentTimeMillis();
						for(int i=0;i<3;i++){
							
							Assetbridge.unpack(Run.x, "vortex");
							
							callvortexO2(m,1,i);
							
							Assetbridge.trimCache(x);}
						v=System.currentTimeMillis();
						a[0]=((double)(v-s))/1000;}
					
					s=System.currentTimeMillis();
					if((Testcase.c>>1)%2==1)
					{						
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO2(m,2,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[1]=((double)(v-s))/1000;
					}
					
				
					if((Testcase.c>>2)%2==1)
					{
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO2(m,4,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[2]=((double)(v-s))/1000;
					}
					
					try {
						writefile(2,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3){
					publishProgress("vortex with O3 Optimization flag running");
					long s=System.currentTimeMillis();long v = 0;
					if(Testcase.c%2==1){
						s=System.currentTimeMillis();
						for(int i=0;i<3;i++){
							
							Assetbridge.unpack(Run.x, "vortex");
							
							callvortexO3(m,1,i);
							
							Assetbridge.trimCache(x);}
						v=System.currentTimeMillis();
						a[0]=((double)(v-s))/1000;}
					
					s=System.currentTimeMillis();
					if((Testcase.c>>1)%2==1)
					{						
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO3(m,2,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[1]=((double)(v-s))/1000;
					}
					
					
					if((Testcase.c>>2)%2==1)
					{
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO3(m,4,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[2]=((double)(v-s))/1000;
					}
					
					try {
						writefile(2,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(o3f){
					publishProgress("vortex with Ofast Optimization flag running");
					long s=System.currentTimeMillis();long v = 0;
					if(Testcase.c%2==1){
						s=System.currentTimeMillis();
						for(int i=0;i<3;i++){
							
							Assetbridge.unpack(Run.x, "vortex");
							callvortexO3F(m,1,i);
							
							Assetbridge.trimCache(x);}
						v=System.currentTimeMillis();
						a[0]=((double)(v-s))/1000;}
					
					s=System.currentTimeMillis();
					if((Testcase.c>>1)%2==1)
					{						
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO3F(m,2,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[1]=((double)(v-s))/1000;
					}
					
					
					if((Testcase.c>>2)%2==1)
					{
						Assetbridge.unpack(Run.x, "vortex");
						s=System.currentTimeMillis();
						callvortexO3F(m,4,0);
						v=System.currentTimeMillis();
						Assetbridge.trimCache(x);
						a[2]=((double)(v-s))/1000;
					}
					
					try {
						writefile(2,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>3)%2==1)
	  		{
	  			
	  			Assetbridge.unpack(Run.x, "crafty");
  				String m=Assetbridge.path;
	  			if(o){
	  				System.out.println("running crafty before asset");
	  				a=new double[3];
	  				System.out.println("running crafty   "+m);
	  				publishProgress("Crafty with no Optimization flag running");
	  				System.out.println(Testcase.c+   "   wdweiewfhiwe");
	  				a=callcrafty(m,Testcase.c);
	  				
	  				try {
						writefile(3,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				//publishProgress();
	  				}
	  			if(o1){
	  				publishProgress("Crafty with 01 Optimization flag running");
	  				a=callcraftyO1(m,Testcase.c);
	  				try {
						writefile(3,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("Crafty with O2 Optimization flag running");
	  				a=callcraftyO2(m,Testcase.c);
	  				try {
						writefile(3,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("Crafty with O3 Optimization flag running");
	  				a=callcraftyO3(m,Testcase.c);
	  				try {
						writefile(3,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("Crafty with Ofast Optimization flag running");
	  				a=callcraftyO3F(m,Testcase.c);
	  				try {
						writefile(3,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>4)%2==1)
	  		{
	  			Assetbridge.unpack(Run.x, "bzip2");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("bzip2 with no Optimization flag running");
	  				a=callbzip2(m,Testcase.c);
	  				try {
						writefile(4,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("bzip2 with 01 Optimization flag running");
	  				a=callbzip2O1(m,Testcase.c);
	  				try {
						writefile(4,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("bzip2 with O2 Optimization flag running");
	  				a=callbzip2O2(m,Testcase.c);
	  				try {
						writefile(4,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("bzip2 with O3 Optimization flag running");
	  				a=callbzip2O3(m,Testcase.c);
	  				try {
						writefile(4,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("bzip2 with Ofast Optimization flag running");
	  				a=callbzip2O3F(m,Testcase.c);
	  				try {
						writefile(4,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>5)%2==1)
	  		{
	  			//GZIP
	  			Assetbridge.unpack(Run.x, "gzip");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("gzip with no Optimization flag running");
	  				a=callgzip(m,Testcase.c);
	  				try {
						writefile(5,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("gzip with 01 Optimization flag running");
	  				a=callgzipO1(m,Testcase.c);
	  				try {
						writefile(5,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("gzip with O2 Optimization flag running");
	  				a=callgzipO2(m,Testcase.c);
	  				try {
						writefile(5,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("gzip with O3 Optimization flag running");
	  				a=callgzipO3(m,Testcase.c);
	  				try {
						writefile(5,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("gzip with Ofast Optimization flag running");
	  				a=callgzipO3F(m,Testcase.c);
	  				try {
						writefile(5,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>6)%2==1)
	  		{
	  			//PARSER
	  			Assetbridge.unpack(Run.x, "parser");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("parser with no Optimization flag running");
	  				a=callparser(m,Testcase.c);
	  				try {
						writefile(6,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("parser with 01 Optimization flag running");
	  				a=callparserO1(m,Testcase.c);
	  				try {
						writefile(6,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("parser with O2 Optimization flag running");
	  				a=callparserO2(m,Testcase.c);
	  				try {
						writefile(6,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("parser with O3 Optimization flag running");
	  				a=callparserO3(m,Testcase.c);
	  				try {
						writefile(6,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("parser with Ofast Optimization flag running");
	  				a=callparserO3F(m,Testcase.c);
	  				try {
						writefile(6,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>7)%2==1)
	  		{
	  			
	  			Assetbridge.unpack(Run.x, "twolf");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("twolf with no Optimization flag running");
	  				a=calltwolf(m,Testcase.c);
	  				try {
						writefile(7,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("twolf with 01 Optimization flag running");
	  				a=calltwolfO1(m,Testcase.c);
	  				try {
						writefile(7,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("twolf with O2 Optimization flag running");
	  				a=calltwolfO2(m,Testcase.c);
	  				try {
						writefile(7,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("twolf with O3 Optimization flag running");
	  				a=calltwolfO3(m,Testcase.c);
	  				try {
						writefile(7,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("twolf with Ofast Optimization flag running");
	  				a=calltwolfO3F(m,Testcase.c);
	  				try {
						writefile(7,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>8)%2==1)
	  		{
	  			//VPR
	  			Assetbridge.unpack(Run.x, "vpr");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("vpr with no Optimization flag running");
	  				a=callvpr(m,Testcase.c);
	  				System.out.println(a[1]);
	  				try {
						writefile(8,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("vpr with 01 Optimization flag running");
	  				a=callvprO1(m,Testcase.c);
	  				
	  				try {
						writefile(8,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("vpr with O2 Optimization flag running");
	  				a=callvprO2(m,Testcase.c);
	  				try {
						writefile(8,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("vpr with O3 Optimization flag running");
	  				a=callvprO3(m,Testcase.c);
	  				try {
						writefile(8,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("vpr with Ofast Optimization flag running");
	  				a=callvprO3F(m,Testcase.c);
	  				try {
						writefile(8,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}
	  		if((CheckMain.a>>9)%2==1)
	  		{
	  			//GCC
	  			Assetbridge.unpack(Run.x, "gcc");
  				String m=Assetbridge.path;
	  			if(o){
	  				publishProgress("gcc with no Optimization flag running");
	  				a=callgcc(m,Testcase.c);
	  				try {
						writefile(9,0,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o1){
	  				publishProgress("gcc with 01 Optimization flag running");
	  				a=callgccO1(m,Testcase.c);
	  				try {
						writefile(9,1,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o2){
	  				publishProgress("gcc with O2 Optimization flag running");
	  				a=callgccO2(m,Testcase.c);
	  				try {
						writefile(9,2,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3){
	  				publishProgress("gcc with O3 Optimization flag running");
	  				a=callgccO3(m,Testcase.c);
	  				try {
						writefile(9,3,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  				}
	  			if(o3f){
	  				publishProgress("gcc with Ofast Optimization flag running");
	  				a=callgccO3F(m,Testcase.c);
	  				try {
						writefile(9,4,a);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  			}
	  			Assetbridge.trimCache(x);
	  		}


	  		return "All selected BenchMarks have completed";
		}
		@Override
		protected void onPostExecute(String result) 
		{
			finalResult.setText(result);
			a.fileCreator(CheckMain.a, Next.b, Testcase.c,x);
			Testcase.c = 0;
			//a.fileCreator(2047,31,7,x);
			Button bn=(Button)findViewById(R.id.but1);
			bn.setVisibility(View.VISIBLE);
			bn=(Button)findViewById(R.id.but2);
			bn.setVisibility(View.VISIBLE);
		}
	}	


}