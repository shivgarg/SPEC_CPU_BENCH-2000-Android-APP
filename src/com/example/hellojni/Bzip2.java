package com.example.hellojni;

import java.io.File;

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
import android.content.res.AssetManager;

import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;

public class Bzip2 extends Activity  {
	
	public int b=0,c=0;
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_bzip2);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "256.bzip2 is based on Julian Seward&apos;s bzip2 version 0.1. The only difference between bzip2 0.1 and 256.bzip2 is that SPEC&apos;s version of bzip2 performs no file I/O other than reading the input. All compression and decompression happens entirely in memory. This is to help isolate the work done to only the CPU and memory subsystem.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "256.bzip2's reference workload has three components: a large TIFF image, a program binary, and a source tar file. These components were selected as a reasonably representative set of things that bzip2 might most often be used on.Each input set is compressed and decompressed at two different blocking factors (compression levels), with the end result of the process being compared to the original data after each decompression step.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
		a.fileCreator(16, 31, 7, this);
       	
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
	/*public void onBackPressed()
	{
		/*if(obj.getStatus()!= AsyncTask.Status.FINISHED)
		{
			finalResult.setText("Please Wait");
		}
		else
		{
			Assetbridge.trimCache(this);
			this.finish();
		}*/
		
	//}
}
	