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

import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;


public class Parser extends Activity  {
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_parser);
		WebView finalResult1;
		WebView finalResult2;
		String html1 = "<html><body>"+"<p align=\"justify\">";
        String S1 = "The Link Grammar Parser is a syntactic parser of English, based on link grammar, an original theory of English syntax. Given a sentence, the system assigns to it a syntactic structure, which consists of set of labeled links connecting pairs of words.The parser has a dictionary of about 60000 word forms. It has coverage of a wide variety of syntactic constructions, including many rare and idiomatic ones. The parser is robust; it is able to skip over portions of the sentence that it cannot understand, and assign some structure to the rest of the sentence. It is able to handle unknown vocabulary, and make intelligent guesses from context about the syntactic categories of unknown words.";
        html1 = html1 + S1 + "</p>"+"</body></html>";
        finalResult1 = (WebView) findViewById(R.id.webView1);
        finalResult1.loadData(html1,"text/html","utf-8");
		String html2 = "<html><body>"+"<p align=\"justify\">";
        String S2 = "The input is a sequence of proposed sentences, one per line. Punctuation and case matter.";
        html2 = html2 + S2 + "</p>"+"</body></html>";
        finalResult2 = (WebView) findViewById(R.id.webView2);
        finalResult2.loadData(html2,"text/html","utf-8");a.fileCreator(64, 31, 7, this);
    
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