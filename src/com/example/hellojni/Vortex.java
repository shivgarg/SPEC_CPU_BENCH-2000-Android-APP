package com.example.hellojni;

import java.io.File;
import java.io.FileOutputStream;

import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.view.Menu;
import android.view.View;
import android.content.*;
import android.webkit.WebView;
import android.widget.TextView;
import android.content.res.AssetManager;

import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;

public class Vortex extends Activity  {
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_vortex);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "VORTEx is a single-user object-oriented database transaction benchmark which which exercises a system kernel coded in integer C. The VORTEx benchmark is a derivative of a full OODBMS that has been customized to conform to SPEC CINT2000 (component measurement) guidelines.The benchmark 255.vortex is a subset of a full object oriented database program called VORTEx. (VORTEx stands for 'Virtual Object Runtime EXpository.')Transactions to and from the database are translated though a schema. (A schema provides the necessary information to generate the mapping of the internally stored data block to a model viewable in the context of the application.)";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "The schema as provided with the benchmark is pre-configured to manipulate three different databases: mailing list, parts list, and geometric data.Both little-endian and big-endian binaries for the schema are provided.The benchmark builds and manipulates three separate, but inter-related databases based on the schema. The size of the database is scalable, and for CINT2000 guidelines has been restricted to about 200 Mbytes.VORTEx been modified to not commit transactions to memory in order to remove input-output activity from this CINT2000 (component) benchmark.The workload of VORTEx has been modeled after common object-oriented database benchmarks with modifications to vary the mix of transactions.The 255.vortex benchmark is run three different times, each time a different mix of database inserts, deletes and lookups is used to simulate different database usage patterns.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(4, 31, 7, this);
       /*thd g=new thd();
       g.arg=message;
       g.start();
       String z=g.b;
       finalResult.setText(z);*/
		//String h=this.getFilesDir().getName();
        //System.out.println("qwxuyun             "+h);
        
	}
	
	/*public void onDestroy() {
	    super.onDestroy();
	    Runtime.getRuntime().gc();      
	}
	public native String callvortex(String a);*/
	
	
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
	{
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
	/*private class thd extends Thread{
		String[] arg;
		String b="Still running";
		public void run(){
			long start=System.nanoTime();
			callvortex(arg[0]);	  		
			long diff=System.nanoTime()-start;
			b=""+diff;
			}
		
		public void end(){
			currentThread().interrupt();
			
			return;
			
			//currentThread().stop();
			}
			
		}
		
		
	
	
*/
	/*@SuppressLint("NewApi")
	public void onBackPressed()
	{
		if(obj.getStatus()!= AsyncTask.Status.FINISHED)
		{
			finalResult.setText("Please Wait");
		}
		else
		{
			Assetbridge.trimCache(this);
			File file = new File(this.getFilesDir(), "256Vortex");
			FileOutputStream outputStream;
			finalResult.setText("BACK PRESEED");
	//		g.end();
			String string=resp;
			try {
			  outputStream = openFileOutput("256Vortex", Context.MODE_PRIVATE);
			  outputStream.write(string.getBytes());
			  outputStream.close();
			} catch (Exception e) {
			  e.printStackTrace();
			}
			onTrimMemory(TRIM_MEMORY_COMPLETE);
			Runtime.getRuntime().gc();
			System.gc();
			this.finish();
		}
		
	}
	private class Vortex255 extends AsyncTask<String,String,String> 
	{
		// Do the long-running work in here	
		 
		//private ActivityManager activityManager;
		private boolean n=false;long available;
		
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
			final ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
			publishProgress("Running Benchmark");
	  		Thread t=new Thread(){
	  			public void run(){
	  				trial(activityManager);
	  			}
	  		};
	  		t.start();
	  
			long start=System.nanoTime();
			n=true;
			System.out.println("yxwuiywenfcrywe yewnrycwqocxryqywucxyrry3q47nxc7qryx8");
	  		callvortex(arg[0]);
	  		n=false;
			long diff=System.nanoTime()-start;
			diff=available;
			resp = ""+diff;
			
	  		return resp;
		}
		private void trial(ActivityManager activityManager)
		{
			
			int g=android.os.Process.myPid();
			int process_pid[]          = new int[] {g};
			long tmp=0;
			while(n){
				
		        android.os.Debug.MemoryInfo[] memoryInfo = activityManager.getProcessMemoryInfo(process_pid);
		        tmp=memoryInfo[0].dalvikPrivateDirty;
		        System.out.println(available);
				if(tmp>available)
				{
					available=tmp;
				}
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
			}
		@Override
		protected void onPostExecute(String result) 
		{
			finalResult.setText(result);
		}
	}	
}*/
}