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

public class Mcf extends Activity  {
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_mcf);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "A benchmark derived from a program used for single-depot vehicle scheduling in public mass transportation. The program is written in C, the benchmark version uses almost exclusively integer arithmetic.The program is designed for the solution of single-depot vehicle scheduling (sub-)problems occurring in the planning process of public transportation companies. It considers one single depot and a homogeneous vehicle fleet. Based on a line plan and service frequenciesd, so-called timetabled trips with fixed departure/arrival locations and times are derived. Each of this timetabled trip has to be serviced by exactly one vehicle. The links between these trips are so-called dead-head trips. In addition, there are pull-out and pull-in trips for leaving and entering the depot.Cost coefficients are given for all dead-head, pull-out, and pull-in trips. It is the task to schedule all timetabled trips to so-called blocks such that the number of necessary vehicles is as small as possible and, subordinate, the operational costs among all minimal fleet solutions are minimized.For simplification in the benchmark test, we assume that each pull-out and pull-in trip is defined implicitly with a duration of 15 minutes and a cost coefficient of 15.For the considered single-depot case, the problem can be formulated as a large-scale minimum-cost flow problem that we solve with a network simplex algorithm accelerated with a column generation. The core of the benchmark 181.mcf is the network simplex code 'MCF Version 1.2 -- A network simplex implementation', For this benchmark, MCF is embedded in the column generation process.The network simplex algorithm is a specialized version of the well known simplex algorithm for network flow problems. The linear algebra of the general algorithm is replaced by simple network operations such as finding cycles or modifying spanning trees that can be performed very quickly. The main work of our network simplex implementation is pointer and integer arithmetic.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "The input file contains line by line.The number of timetabled and dead-head trips (first line), for each timetabled trip its starting and ending time,for each dead-head trip its starting and ending timetabled trip and its cost.Worst case execution time is pseudo-polynomial in the number timetabled and dead-head trips and in the amount of the maximal cost coefficient. The expected execution time, however, is in the order of a low-order polynomial.The benchmark requires about 100 and 190 megabyte for a 32 and a 64 bit architecture, respectively.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(1,31, 7, this);
     
		
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
	/*public void onBackPressed()
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
		
	}*/
	