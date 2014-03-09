package com.example.hellojni;

import java.io.File;
import java.io.FileOutputStream;

import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.app.Activity;
import android.widget.*;
import android.content.Context;
import android.content.Intent;
import android.view.*;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.content.*;
import com.arieslabs.assetbridge.Assetbridge;
import com.example.hellojni.R;
public class MainActivity extends Activity {

	public final static String EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE";
	Result a=new Result();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
			
        }
	public void res(View view)
	{
		a.fileCreator(1021, 31, 7, this);
		Intent intent=new Intent();
		intent.setAction(android.content.Intent.ACTION_VIEW);
		File sdCard = Environment.getExternalStorageDirectory();
		File file = new File (sdCard.getAbsolutePath() + "/SPEC_CPU_Bench/Result/results.html");
		intent.setDataAndType(Uri.fromFile(file),"text/*");
		startActivity(intent);
	}
	public void exp(View view)
	{
		a.fileCreator(1021, 31, 7, this);
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
	public void gzip(View view) {
		Intent intent = new Intent(this, Gzip.class);
		startActivity(intent);
	}

	public void gcc(View view) {
		/*Intent intent = new Intent(this, Gcc.class);
		String message = Assetbridge.path;
		intent.putExtra(EXTRA_MESSAGE, message);
		startActivity(intent);*/

		/*File newFile = new File(this.getFilesDir(), "result.html");
		//Uri contentUri = getUriForFile(MainActivity.this, "com.mydomain.fileprovider", newFile);
		Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("file:///sdcard/ShareViaWifi/As.mp3"));
		startActivity(browserIntent);*/
		Intent intent = new Intent(this, Gcc.class);
		startActivity(intent);

	}
		public void bzip2(View view) {
		Intent intent = new Intent(this, Bzip2.class);
		startActivity(intent);
		/*Intent intent=new Intent();
		intent.setAction(android.content.Intent.ACTION_VIEW);
		File file = new File("/sdcard/SPECS/Results/results.txt");
		intent.setDataAndType(Uri.fromFile(file),"text/*");
		startActivity(intent);*/
		}
	public void vpr(View view) {
		Intent intent = new Intent(this, Vpr.class);
		startActivity(intent);
	}
	public void mcf(View view) {
		Intent intent = new Intent(this, Mcf.class);
		startActivity(intent);
	}
	public void crafty(View view) {
		final Intent intent = new Intent(this, Crafty.class);
		startActivity(intent);
		}
	/*public void gap(View view) {
		Intent intent = new Intent(this, Gap.class);
		startActivity(intent);
	}*/
	public void run(View view)
	{
		CheckMain.a=0;
		Intent intent =new Intent(this,CheckMain.class);
		startActivity(intent);
	}
	public void vortex(View view) {
		Intent intent = new Intent(this, Vortex.class);
		startActivity(intent);
	}
	public void twolf(View view) {
		Intent intent = new Intent(this, Twolf.class);
		startActivity(intent);
	}
	public void parser(View view) {
		Intent intent = new Intent(this, Parser.class);
		startActivity(intent);
	}
	
	

	
}
