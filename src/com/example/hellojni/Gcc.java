package com.example.hellojni;

import java.io.File;

import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.webkit.WebView;
import android.widget.TextView;
import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;

public class Gcc extends Activity  {
	
	Result a=new Result();
	
	 @Override
	 protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//Intent intent=getIntent();
		//String message = intent.getStringExtra(MainActivity.EXTRA_MESSAGE);
		setContentView(R.layout.activity_gcc);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "176.gcc is based on gcc Version 2.7.2.2. It generates code for a Motorola 88100 processor. The benchmark runs as a compiler with many of its optimization flags enabled. 176.gcc has had its inlining heuristics altered slightly, so as to inline more code than would be typical on a Unix system in 1997. It is expected that this effect will be more typical of compiler usage in 2002. This was done so that 176.gcc would spend more time analyzing it's source code inputs, and use more memory. Without this effect, 176.gcc would have done less analysis, and needed more input workloads to achieve the run times required for SPECint2000.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "There are 5 input workloads in 176.gcc (compared with 57 in the 126.gcc of SPECint95). All these files are preprocessed C code (.i files); integrate.i and expr.i come from the source files of gcc itself. 166.i is made by concatenating the Fortran source files of a SPECint2000 candidate benchmark, then using the f2c translator to produce C code, and then pre-processing. 200.i comes via the same method from a previous version of the SPECfp2000 benchmark 200.sixtrack, and scilab.i comes via the same method from a version of the Scilab program.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(512, 31, 7,this );
		
	}
	
	
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
	/*@Override
	public void onBackPressed()
	{
		if(obj.getStatus()!= AsyncTask.Status.FINISHED)
		{
			finalResult.setText("Please Wait");
		}
		else
		{
			Assetbridge.trimCache(this);
			this.finish();
		}
		
	}
	private class Gcc176 extends AsyncTask<String,String,String> 
	{
		// Do the long-running work in here	
		private String resp;
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
			long start=System.nanoTime();
	  		callgcc(arg[0]);
			long diff=System.nanoTime()-start;
			
			resp = ""+diff;
	  		return resp;
		}
		@Override
		protected void onPostExecute(String result) 
		{
			finalResult.setText(result);
			//onBackPressed();
			
		}
	}	
}*/
}