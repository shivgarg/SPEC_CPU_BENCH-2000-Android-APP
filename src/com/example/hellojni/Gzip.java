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

public class Gzip extends Activity  {
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_gzip);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "gzip (GNU zip) is a popular data compression program written by Jean-Loup Gailly for the GNU project. `gzip' uses Lempel-Ziv coding (LZ77) as its compression algorithm.SPEC's version of gzip performs no file I/O other than reading the input. All compression and decompression happens entirely in memory. This is to help isolate the work done to just the CPU and the memory subsystem.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "164.gzip's reference workload has five components: a large TIFF image, a webserver log, a program binary, random data, and a source tar file. With the exception of the random data, these components were selected as a reasonably representative set of things that gzip might be most often used on. The random data is present to test gzip's worst-case behavior.Each input set is compressed and decompressed at several different blocking factors ('compression levels'), with the end result of the process being compared to the original data after each step.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(32, 31, 7,this );
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
}