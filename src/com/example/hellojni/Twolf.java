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

public class Twolf extends Activity  {
	Result a=new Result();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_twolf);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "The TimberWolfSC placement and global routing package is used in the process of creating the lithography artwork needed for the production of microchips. Specifically, it determines the placement and global connections for groups of transistors (known as standard cells) which constitute the microchip. The placement problem is a permutation. Therefore, a simple or brute force exploration of the state space would take an execution time proportional to the factorial of the input size. For problems as small as 70 cells, a brute force algorithm would take longer than the age of the universe on the world's fastest computer. Instead, the TimberWolfSC program uses simulated annealing as a heuristic to find very good solutions for the row-based standard cell design style. In this design style, transistors are grouped together to form standard cells. These standard cells are placed in rows so that all cells of a row may share power and ground connections by abutment. The simulated annealing algorithm has found the best known solutions to a large group of placement problems. The global router which follows the placement step interconnects the microchip design. It utilizes a constructive algorithm followed by iterative improvement.The basic simulated annealing algorithm has not changed since its inception in 1983. The version in the SPEC suite is the most numerically intensive version. Recent versions have reduced runtimes by clever reductions in the search space. However, the move strategy and cost functions are identical to later versions.The version of TimberWolfSC that has been submitted to SPEC has been customized for SPEC. It has been modified specifically for the benchmark suite so that it would have a behavior that captures the flavor of many implementations of simulated annealing. The submitted program spends most of its time in the inner loop calculations. By doing this, this version traverses memory often creating cache misses. In fact, this version running small jobs looks like later simulated annealing versions running on large jobs. This was to insure that the benchmark would be applicable to future versions of the program running large instances. The submitted version should be a computers worst nightmare, yet realistic for future problems.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "Three test problems are provided for SPEC benchmark. The first problem is a small synchronous circuit which is being placed and routed as a subchip. The second test circuit is the MCNC primary 1 benchmark circuit, one of the most frequently executed benchmark circuits. The third test case is a structured circuit found in the MCNC benchmark suite. In all cases, the TimberWolf program is required to determine the position of the standard cells and determine the interconnection of the netlist. In addition, the global router must add extra cells known as feedthrus to complete the route if not enough space is present between two adjacent standard cells. The input files consist of the block description file or 'designName'.blk file, the netlist file or 'designName'.cel file, the net weighting file or 'designName'.net file and the parameter file or 'designName'.par file. The block file describes the number and position of the rows where standard cells are to be placed. A valid placement is one in which all of the cells are placed within the specified rows without any overlap between cells. The netlist file contains a description of the standard cells as well as the connection network between cells. At this time the physical location of these connections has not been determined.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");
        a.fileCreator(128, 31, 7, this);
        
	
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