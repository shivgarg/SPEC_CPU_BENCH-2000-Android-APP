package com.example.hellojni;

import java.io.File;
import java.io.FileOutputStream;

import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.content.*;
import android.webkit.WebView;
import android.widget.TextView;

import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;


public class Crafty extends Activity{
	Result a=new Result();
	
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_crafty);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "Crafty is a high-performance Computer Chess program that is designed around a 64-bit word. It runs on 32 bit machines using the &apos;long long&apos; (or similar, as _int64 in Microsoft C) data type. It is primarily an integer code, with a significant number of logical operations such as and, or, exclusive or and shift. It can be configured to run a reproducible set of searches to compare the integer/branch prediction/pipe-lining facilities of a processor.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "The reference input solves 5 different chess board layouts, with varying &apos;depths&apos; to which it will search the tree of possible moves, for the next move.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(8, 31, 7, this);
        //System.out.println(android.os.Process.myPid());
	}
	
	/*public void onDestroy() {
	    super.onDestroy();
	    Runtime.getRuntime().gc(); 
	    System.gc();
	    finish();

	}*/
	
	
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
	/*public void onBackPressed()
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
			
			String string=resp;
			try {
			  outputStream = openFileOutput("256Vortex", Context.MODE_PRIVATE);
			  outputStream.write(string.getBytes());
			  outputStream.close();
			} catch (Exception e) {
			  e.printStackTrace();
			}
			Runtime.getRuntime().gc(); 
		    System.gc();
			this.finish();
			Runtime.getRuntime().gc(); 
		    System.gc();
		    finish();
		}
		
	}*/}