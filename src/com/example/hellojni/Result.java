package com.example.hellojni;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;


	import junit.framework.TestCase;
import android.os.Bundle;
import android.os.Environment;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.view.Menu;
import android.widget.TextView;
import android.content.Context;
public class Result {
	

		    
	   @SuppressLint("NewApi")
	   public  void fileCreator(int a, int b, int c,Activity s) 	// Simply call the function with correct inputs // for all (2047,31,7)
	    {
	    
	    	//Booleans to tell the choices of the user
		   boolean O_0,O_1,O_2,O_3,O_3_F,ref,test,train;
	    	
			O_0=(b%2==1)?true:false;
			O_1=((b>>1)%2==1)?true:false;
			O_2=((b>>2)%2==1)?true:false;
			O_3=((b>>3)%2==1)?true:false;
			O_3_F=((b>>4)%2==1)?true:false;
			
			
			ref=(c%2==1)?true:false;
			test=((c>>1)%2==1)?true:false;
			train=((c>>2)%2==1)?true:false;
			//Ref inputs
	    	double Gzip_1_1 = 0.0,Gzip_2_1 = 0.0,Gzip_3_1 = 0.0,Gzip_4_1 = 0.0,Gzip_5_1 = 0.0,Gzip_6_1 = 138.884, Gzip_7_1 = 112.97, Gzip_8_1 = 84.766, Gzip_9_1 = 83.781, Gzip_10_1 = 89.219;
	    	double Bzip2_1_1 = 0.0,Bzip2_2_1 = 0.0,Bzip2_3_1 = 0.0,Bzip2_4_1 = 0.0,Bzip2_5_1 = 0.0,Bzip2_6_1 = 140.886, Bzip2_7_1 = 105.48, Bzip2_8_1 = 84.316, Bzip2_9_1 = 86.169, Bzip2_10_1 = 81.138;
	    	double Parser_1_1 = 0.0,Parser_2_1 = 0.0,Parser_3_1 = 0.0,Parser_4_1 = 0.0,Parser_5_1 = 0.0,Parser_6_1 = 208.95, Parser_7_1 = 131.0, Parser_8_1 = 129.09, Parser_9_1 = 110.69, Parser_10_1 = 113.12;
	    	double Gcc_1_1 = 0.0,Gcc_2_1 = 0.0,Gcc_3_1 = 0.0,Gcc_4_1 = 0.0,Gcc_5_1 = 0.0,Gcc_6_1 = 71.24, Gcc_7_1 = 43.36, Gcc_8_1 = 44.88, Gcc_9_1 = 42.63, Gcc_10_1 = 42.62;
	    	double Mcf_1_1 = 0.0,Mcf_2_1 = 0.0,Mcf_3_1 = 0.0,Mcf_4_1 = 0.0,Mcf_5_1 = 0.0,Mcf_6_1 = 74.81, Mcf_7_1 = 115.23, Mcf_8_1 = 59.04, Mcf_9_1 = 54.52, Mcf_10_1 = 58.27;
	    	double Vortex_1_1 = 0.0,Vortex_2_1 = 0.0,Vortex_3_1 = 0.0,Vortex_4_1 = 0.0,Vortex_5_1 = 0.0,Vortex_6_1 = 2588.79, Vortex_7_1 = 1916.20, Vortex_8_1 = 1914.09, Vortex_9_1 = 1813.57, Vortex_10_1 = 1823.17;
	    	double Twolf_1_1 = 0.0,Twolf_2_1 = 0.0,Twolf_3_1 = 0.0,Twolf_4_1 = 0.0,Twolf_5_1 = 0.0,Twolf_6_1 = 205.81, Twolf_7_1 = 118.89, Twolf_8_1 = 123.64, Twolf_9_1 = 121.94, Twolf_10_1 = 123.61;
	    	double Vpr_1_1 = 0.0,Vpr_2_1 = 0.0,Vpr_3_1 = 0.0,Vpr_4_1 = 0.0,Vpr_5_1 = 0.0,Vpr_6_1 = 72.55, Vpr_7_1 = 48.82, Vpr_8_1 = 41.92, Vpr_9_1 = 41.05, Vpr_10_1 = 41.47;
	    	double Crafty_1_1 = 0.0,Crafty_2_1 = 0.0,Crafty_3_1 = 0.0,Crafty_4_1 = 0.0,Crafty_5_1 = 0.0,Crafty_6_1 = 82.84, Crafty_7_1 = 39.24, Crafty_8_1 = 58.62, Crafty_9_1 = 58.34, Crafty_10_1 = 60.03;
	    	double Gap_1_1 = 0.0,Gap_2_1 = 0.0,Gap_3_1 = 0.0,Gap_4_1 = 0.0,Gap_5_1 = 0.0,Gap_6_1 = 116.9, Gap_7_1 = 117.21, Gap_8_1 = 54.99, Gap_9_1 = 54.69, Gap_10_1 = 54.44;
	    	
	    	//Test inputs
	    	double Gzip_1_2 = 0.0,Gzip_2_2 = 0.0,Gzip_3_2 = 0.0,Gzip_4_2 = 0.0,Gzip_5_2 = 0.0,Gzip_6_2 = 0.878, Gzip_7_2 = 0.654, Gzip_8_2 = 0.554, Gzip_9_2 = 0.544, Gzip_10_2 = 0.551;
	    	double Bzip2_1_2 = 0.0,Bzip2_2_2 = 0.0,Bzip2_3_2 = 0.0,Bzip2_4_2 = 0.0,Bzip2_5_2 = 0.0,Bzip2_6_2 = 3.595, Bzip2_7_2 = 1.876, Bzip2_8_2 = 1.523, Bzip2_9_2 = 1.812, Bzip2_10_2 = 1.799;
	    	double Parser_1_2 = 0.0,Parser_2_2 = 0.0,Parser_3_2 = 0.0,Parser_4_2 = 0.0,Parser_5_2 = 0.0,Parser_6_2 = 1.98, Parser_7_2 = 1.0, Parser_8_2 = 1.04, Parser_9_2 = 0.95, Parser_10_2 = 0.97;
	    	double Gcc_1_2 = 0.0,Gcc_2_2 = 0.0,Gcc_3_2 = 0.0,Gcc_4_2 = 0.0,Gcc_5_2 = 0.0,Gcc_6_2 = 0.98, Gcc_7_2 = 0.61, Gcc_8_2 = 0.69, Gcc_9_2 = 0.58, Gcc_10_2 = 0.69;
	    	double Mcf_1_2 = 0.0,Mcf_2_2 = 0.0,Mcf_3_2 = 0.0,Mcf_4_2 = 0.0,Mcf_5_2 = 0.0,Mcf_6_2 = 0.14, Mcf_7_2 = 0.33, Mcf_8_2 = 0.10, Mcf_9_2 = 0.09, Mcf_10_2 = 0.10;
	    	double Vortex_1_2 = 0.0,Vortex_2_2 = 0.0,Vortex_3_2 = 0.0,Vortex_4_2 = 0.0,Vortex_5_2 = 0.0,Vortex_6_2 = 33.80, Vortex_7_2 = 23.04, Vortex_8_2 = 22.49, Vortex_9_2 = 21.27, Vortex_10_2 = 22.01;
	    	double Twolf_1_2 = 0.0,Twolf_2_2 = 0.0,Twolf_3_2 = 0.0,Twolf_4_2 = 0.0,Twolf_5_2 = 0.0,Twolf_6_2 = 0.17, Twolf_7_2 = 0.25, Twolf_8_2 = 0.09, Twolf_9_2 = 0.09, Twolf_10_2 = 0.10;
	    	double Vpr_1_2 = 0.0,Vpr_2_2 = 0.0,Vpr_3_2 = 0.0,Vpr_4_2 = 0.0,Vpr_5_2 = 0.0,Vpr_6_2 = 0.54, Vpr_7_2 = 0.26, Vpr_8_2 = 0.28, Vpr_9_2 = 0.24, Vpr_10_2 = 0.27;
	    	double Crafty_1_2 = 0.0,Crafty_2_2 = 0.0,Crafty_3_2 = 0.0,Crafty_4_2 = 0.0,Crafty_5_2 = 0.0,Crafty_6_2 = 1.96, Crafty_7_2 = 0.93, Crafty_8_2 = 1.43, Crafty_9_2 = 1.37, Crafty_10_2 = 1.61;
	    	double Gap_1_2 = 0.0,Gap_2_2 = 0.0,Gap_3_2 = 0.0,Gap_4_2 = 0.0,Gap_5_2 = 0.0,Gap_6_2 = 0.48, Gap_7_2 = 0.48, Gap_8_2 = 0.27, Gap_9_2 = 0.26, Gap_10_2 = 0.30;
	    	
	    	//Train inputs
	    	double Gzip_1_3 = 0.0,Gzip_2_3 = 0.0,Gzip_3_3 = 0.0,Gzip_4_3 = 0.0,Gzip_5_3 = 0.0,Gzip_6_3 = 15.768, Gzip_7_3 = 10.254, Gzip_8_3 = 9.554, Gzip_9_3 = 9.494, Gzip_10_3 = 9.527;
	    	double Bzip2_1_3 = 0.0,Bzip2_2_3 = 0.0,Bzip2_3_3 = 0.0,Bzip2_4_3 = 0.0,Bzip2_5_3 = 0.0,Bzip2_6_3 = 26.007, Bzip2_7_3 = 10.265, Bzip2_8_3 = 8.437, Bzip2_9_3 = 11.088, Bzip2_10_3 = 9.228;
	    	double Parser_1_3 = 0.0,Parser_2_3 = 0.0,Parser_3_3 = 0.0,Parser_4_3 = 0.0,Parser_5_3 = 0.0,Parser_6_3 = 5.2, Parser_7_3 = 3.02, Parser_8_3 = 2.98, Parser_9_3 = 2.52, Parser_10_3 = 2.63;
	    	double Gcc_1_3 = 0.0,Gcc_2_3 = 0.0,Gcc_3_3 = 0.0,Gcc_4_3 = 0.0,Gcc_5_3 = 0.0,Gcc_6_3 = 1.69, Gcc_7_3 = 1.02, Gcc_8_3 = 1.05, Gcc_9_3 = 1.03, Gcc_10_3 = 1.04;
	    	double Mcf_1_3 = 0.0,Mcf_2_3 = 0.0,Mcf_3_3 = 0.0,Mcf_4_3 = 0.0,Mcf_5_3 = 0.0,Mcf_6_3 = 7.9, Mcf_7_3 = 7.32, Mcf_8_3 = 5.63, Mcf_9_3 = 5.29, Mcf_10_3 = 5.55;
	    	double Vortex_1_3 = 0.0,Vortex_2_3 = 0.0,Vortex_3_3 = 0.0,Vortex_4_3 = 0.0,Vortex_5_3 = 0.0,Vortex_6_3 = 35.47, Vortex_7_3 = 25.08, Vortex_8_3 = 23.91, Vortex_9_3 = 23.44, Vortex_10_3 = 23.45;
	    	double Twolf_1_3 = 0.0,Twolf_2_3 = 0.0,Twolf_3_3 = 0.0,Twolf_4_3 = 0.0,Twolf_5_3 = 0.0,Twolf_6_3 = 8.07, Twolf_7_3 = 4.69, Twolf_8_3 = 4.79, Twolf_9_3 = 4.47, Twolf_10_3 = 4.50;
	    	double Vpr_1_3 = 0.0,Vpr_2_3 = 0.0,Vpr_3_3 = 0.0,Vpr_4_3 = 0.0,Vpr_5_3 = 0.0,Vpr_6_3 = 7.52, Vpr_7_3 = 5.17, Vpr_8_3 = 4.99, Vpr_9_3 = 4.37, Vpr_10_3 = 4.40;
	    	double Crafty_1_3 = 0.0,Crafty_2_3 = 0.0,Crafty_3_3 = 0.0,Crafty_4_3 = 0.0,Crafty_5_3 = 0.0,Crafty_6_3 = 12.78, Crafty_7_3 = 5.58, Crafty_8_3 = 8.98, Crafty_9_3 = 8.49, Crafty_10_3 = 9.81;
	    	double Gap_1_3 = 0.0,Gap_2_3 = 0.0,Gap_3_3 = 0.0,Gap_4_3 = 0.0,Gap_5_3 = 0.0,Gap_6_3 = 4.07, Gap_7_3 = 4.10, Gap_8_3 = 1.96, Gap_9_3 = 1.92, Gap_10_3 = 1.95;
	    	

			//1.MCF
	    	try 
	    	{	
	    		File file_mcf1 = new File(s.getFilesDir(), "mcfO");
		    	FileInputStream fis_mcf1 = new FileInputStream(file_mcf1);
		    	InputStreamReader isr_mcf1 = new InputStreamReader(fis_mcf1);
		    	BufferedReader br_mcf1 = new BufferedReader(isr_mcf1);
		    	Mcf_1_1 =  Double.parseDouble(br_mcf1.readLine());
		    	Mcf_1_2 =  Double.parseDouble(br_mcf1.readLine());
		    	Mcf_1_3 =  Double.parseDouble(br_mcf1.readLine());
		    	br_mcf1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Mcf_1_1 = 0.0;
		    	Mcf_1_2 = 0.0;
		    	Mcf_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	File file_mcf2 = new File(s.getFilesDir(), "mcfO1");
		    	FileInputStream fis_mcf2 = new FileInputStream(file_mcf2);
		    	InputStreamReader isr_mcf2 = new InputStreamReader(fis_mcf2);
		    	BufferedReader br_mcf2 = new BufferedReader(isr_mcf2);
		    	Mcf_2_1 =  Double.parseDouble(br_mcf2.readLine());
		    	Mcf_2_2 =  Double.parseDouble(br_mcf2.readLine());
		    	Mcf_2_3 =  Double.parseDouble(br_mcf2.readLine());
		    	br_mcf2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Mcf_2_1 = 0.0;
		    	Mcf_2_2 = 0.0;
		    	Mcf_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{	
		    	File file_mcf3 = new File(s.getFilesDir(), "mcfO2");
		    	FileInputStream fis_mcf3 = new FileInputStream(file_mcf3);
		    	InputStreamReader isr_mcf3 = new InputStreamReader(fis_mcf3);
		    	BufferedReader br_mcf3 = new BufferedReader(isr_mcf3);
		    	Mcf_3_1 =  Double.parseDouble(br_mcf3.readLine());
		    	Mcf_3_2 =  Double.parseDouble(br_mcf3.readLine());
		    	Mcf_3_3 =  Double.parseDouble(br_mcf3.readLine());
		    	br_mcf3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Mcf_3_1 = 0.0;
		    	Mcf_3_2 = 0.0;
		    	Mcf_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{	
		    	File file_mcf4 = new File(s.getFilesDir(), "mcfO3");
		    	FileInputStream fis_mcf4 = new FileInputStream(file_mcf4);
		    	InputStreamReader isr_mcf4 = new InputStreamReader(fis_mcf4);
		    	BufferedReader br_mcf4 = new BufferedReader(isr_mcf4);
		    	Mcf_4_1 =  Double.parseDouble(br_mcf4.readLine());
		    	Mcf_4_2 =  Double.parseDouble(br_mcf4.readLine());
		    	Mcf_4_3 =  Double.parseDouble(br_mcf4.readLine());
		    	br_mcf4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Mcf_4_1 = 0.0;
		    	Mcf_4_2 = 0.0;
		    	Mcf_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_mcf5 = new File(s.getFilesDir(), "mcfO3F");
		    	FileInputStream fis_mcf5 = new FileInputStream(file_mcf5);
		    	InputStreamReader isr_mcf5 = new InputStreamReader(fis_mcf5);
		    	BufferedReader br_mcf5 = new BufferedReader(isr_mcf5);
		    	Mcf_5_1 =  Double.parseDouble(br_mcf5.readLine());
		    	Mcf_5_2 =  Double.parseDouble(br_mcf5.readLine());
		    	Mcf_5_3 =  Double.parseDouble(br_mcf5.readLine());
		    	br_mcf5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Mcf_5_1 = 0.0;
		    	Mcf_5_2 = 0.0;
		    	Mcf_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//2.GAP
	    	try 
	    	{
		    	File file_gap1 = new File(s.getFilesDir(), "gapO");
		    	FileInputStream fis_gap1 = new FileInputStream(file_gap1);
		    	InputStreamReader isr_gap1 = new InputStreamReader(fis_gap1);
		    	BufferedReader br_gap1 = new BufferedReader(isr_gap1);
		    	Gap_1_1 =  Double.parseDouble(br_gap1.readLine());
		    	Gap_1_2 =  Double.parseDouble(br_gap1.readLine());
		    	Gap_1_3 =  Double.parseDouble(br_gap1.readLine());
		    	br_gap1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gap_1_1 = 0.0;
		    	Gap_1_2 = 0.0;
		    	Gap_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gap2 = new File(s.getFilesDir(), "gapO1");
		    	FileInputStream fis_gap2 = new FileInputStream(file_gap2);
		    	InputStreamReader isr_gap2 = new InputStreamReader(fis_gap2);
		    	BufferedReader br_gap2 = new BufferedReader(isr_gap2);
		    	Gap_2_1 =  Double.parseDouble(br_gap2.readLine());
		    	Gap_2_2 =  Double.parseDouble(br_gap2.readLine());
		    	Gap_2_3 =  Double.parseDouble(br_gap2.readLine());
		    	br_gap2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gap_2_1 = 0.0;
		    	Gap_2_2 = 0.0;
		    	Gap_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gap3 = new File(s.getFilesDir(), "gapO2");
		    	FileInputStream fis_gap3 = new FileInputStream(file_gap3);
		    	InputStreamReader isr_gap3 = new InputStreamReader(fis_gap3);
		    	BufferedReader br_gap3 = new BufferedReader(isr_gap3);
		    	Gap_3_1 =  Double.parseDouble(br_gap3.readLine());
		    	Gap_3_2 =  Double.parseDouble(br_gap3.readLine());
		    	Gap_3_3 =  Double.parseDouble(br_gap3.readLine());
		    	br_gap3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gap_3_1 = 0.0;
		    	Gap_3_2 = 0.0;
		    	Gap_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gap4 = new File(s.getFilesDir(), "gapO3");
		    	FileInputStream fis_gap4 = new FileInputStream(file_gap4);
		    	InputStreamReader isr_gap4 = new InputStreamReader(fis_gap4);
		    	BufferedReader br_gap4 = new BufferedReader(isr_gap4);
		    	Gap_4_1 =  Double.parseDouble(br_gap4.readLine());
		    	Gap_4_2 =  Double.parseDouble(br_gap4.readLine());
		    	Gap_4_3 =  Double.parseDouble(br_gap4.readLine());
		    	br_gap4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gap_4_1 = 0.0;
		    	Gap_4_2 = 0.0;
		    	Gap_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gap5 = new File(s.getFilesDir(), "gapO3F");
		    	FileInputStream fis_gap5 = new FileInputStream(file_gap5);
		    	InputStreamReader isr_gap5 = new InputStreamReader(fis_gap5);
		    	BufferedReader br_gap5 = new BufferedReader(isr_gap5);
		    	Gap_5_1 =  Double.parseDouble(br_gap5.readLine());
		    	Gap_5_2 =  Double.parseDouble(br_gap5.readLine());
		    	Gap_5_3 =  Double.parseDouble(br_gap5.readLine());
		    	br_gap5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gap_5_1 = 0.0;
		    	Gap_5_2 = 0.0;
		    	Gap_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//3.GCC
	    	try 
	    	{
		    	File file_gcc1 = new File(s.getFilesDir(), "gccO");
		    	FileInputStream fis_gcc1 = new FileInputStream(file_gcc1);
		    	InputStreamReader isr_gcc1 = new InputStreamReader(fis_gcc1);
		    	BufferedReader br_gcc1 = new BufferedReader(isr_gcc1);
		    	Gcc_1_1 =  Double.parseDouble(br_gcc1.readLine());
		    	Gcc_1_2 =  Double.parseDouble(br_gcc1.readLine());
		    	Gcc_1_3 =  Double.parseDouble(br_gcc1.readLine());
		    	br_gcc1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gcc_1_1 = 0.0;
		    	Gcc_1_2 = 0.0;
		    	Gcc_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gcc2 = new File(s.getFilesDir(), "gccO1");
		    	FileInputStream fis_gcc2 = new FileInputStream(file_gcc2);
		    	InputStreamReader isr_gcc2 = new InputStreamReader(fis_gcc2);
		    	BufferedReader br_gcc2 = new BufferedReader(isr_gcc2);
		    	Gcc_2_1 =  Double.parseDouble(br_gcc2.readLine());
		    	Gcc_2_2 =  Double.parseDouble(br_gcc2.readLine());
		    	Gcc_2_3 =  Double.parseDouble(br_gcc2.readLine());
		    	br_gcc2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gcc_2_1 = 0.0;
		    	Gcc_2_2 = 0.0;
		    	Gcc_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gcc3 = new File(s.getFilesDir(), "gccO2");
		    	FileInputStream fis_gcc3 = new FileInputStream(file_gcc3);
		    	InputStreamReader isr_gcc3 = new InputStreamReader(fis_gcc3);
		    	BufferedReader br_gcc3 = new BufferedReader(isr_gcc3);
		    	Gcc_3_1 =  Double.parseDouble(br_gcc3.readLine());
		    	Gcc_3_2 =  Double.parseDouble(br_gcc3.readLine());
		    	Gcc_3_3 =  Double.parseDouble(br_gcc3.readLine());
		    	br_gcc3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gcc_3_1 = 0.0;
		    	Gcc_3_2 = 0.0;
		    	Gcc_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gcc4 = new File(s.getFilesDir(), "gccO3");
		    	FileInputStream fis_gcc4 = new FileInputStream(file_gcc4);
		    	InputStreamReader isr_gcc4 = new InputStreamReader(fis_gcc4);
		    	BufferedReader br_gcc4 = new BufferedReader(isr_gcc4);
		    	Gcc_4_1 =  Double.parseDouble(br_gcc4.readLine());
		    	Gcc_4_2 =  Double.parseDouble(br_gcc4.readLine());
		    	Gcc_4_3 =  Double.parseDouble(br_gcc4.readLine());
		    	br_gcc4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gcc_4_1 = 0.0;
		    	Gcc_4_2 = 0.0;
		    	Gcc_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gcc5 = new File(s.getFilesDir(), "gccO3F");
		    	FileInputStream fis_gcc5 = new FileInputStream(file_gcc5);
		    	InputStreamReader isr_gcc5 = new InputStreamReader(fis_gcc5);
		    	BufferedReader br_gcc5 = new BufferedReader(isr_gcc5);
		    	Gcc_5_1 =  Double.parseDouble(br_gcc5.readLine());
		    	Gcc_5_2 =  Double.parseDouble(br_gcc5.readLine());
		    	Gcc_5_3 =  Double.parseDouble(br_gcc5.readLine());
		    	br_gcc5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gcc_5_1 = 0.0;
		    	Gcc_5_2 = 0.0;
		    	Gcc_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//4.GZIP
	    	try 
	    	{
		    	File file_gzip1 = new File(s.getFilesDir(), "gzipO");
		    	FileInputStream fis_gzip1 = new FileInputStream(file_gzip1);
		    	InputStreamReader isr_gzip1 = new InputStreamReader(fis_gzip1);
		    	BufferedReader br_gzip1 = new BufferedReader(isr_gzip1);
		    	Gzip_1_1 =  Double.parseDouble(br_gzip1.readLine());
		    	Gzip_1_2 =  Double.parseDouble(br_gzip1.readLine());
		    	Gzip_1_3 =  Double.parseDouble(br_gzip1.readLine());
		    	br_gzip1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gzip_1_1 = 0.0;
		    	Gzip_1_2 = 0.0;
		    	Gzip_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gzip2 = new File(s.getFilesDir(), "gzipO1");
		    	FileInputStream fis_gzip2 = new FileInputStream(file_gzip2);
		    	InputStreamReader isr_gzip2 = new InputStreamReader(fis_gzip2);
		    	BufferedReader br_gzip2 = new BufferedReader(isr_gzip2);
		    	Gzip_2_1 =  Double.parseDouble(br_gzip2.readLine());
		    	Gzip_2_2 =  Double.parseDouble(br_gzip2.readLine());
		    	Gzip_2_3 =  Double.parseDouble(br_gzip2.readLine());
		    	br_gzip2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gzip_2_1 = 0.0;
		    	Gzip_2_2 = 0.0;
		    	Gzip_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gzip3 = new File(s.getFilesDir(), "gzipO2");
		    	FileInputStream fis_gzip3 = new FileInputStream(file_gzip3);
		    	InputStreamReader isr_gzip3 = new InputStreamReader(fis_gzip3);
		    	BufferedReader br_gzip3 = new BufferedReader(isr_gzip3);
		    	Gzip_3_1 =  Double.parseDouble(br_gzip3.readLine());
		    	Gzip_3_2 =  Double.parseDouble(br_gzip3.readLine());
		    	Gzip_3_3 =  Double.parseDouble(br_gzip3.readLine());
		    	br_gzip3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gzip_3_1 = 0.0;
		    	Gzip_3_2 = 0.0;
		    	Gzip_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gzip4 = new File(s.getFilesDir(), "gzipO3");
		    	FileInputStream fis_gzip4 = new FileInputStream(file_gzip4);
		    	InputStreamReader isr_gzip4 = new InputStreamReader(fis_gzip4);
		    	BufferedReader br_gzip4 = new BufferedReader(isr_gzip4);
		    	Gzip_4_1 =  Double.parseDouble(br_gzip4.readLine());
		    	Gzip_4_2 =  Double.parseDouble(br_gzip4.readLine());
		    	Gzip_4_3 =  Double.parseDouble(br_gzip4.readLine());
		    	br_gzip4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gzip_4_1 = 0.0;
		    	Gzip_4_2 = 0.0;
		    	Gzip_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_gzip5 = new File(s.getFilesDir(), "gzipO3F");
		    	FileInputStream fis_gzip5 = new FileInputStream(file_gzip5);
		    	InputStreamReader isr_gzip5 = new InputStreamReader(fis_gzip5);
		    	BufferedReader br_gzip5 = new BufferedReader(isr_gzip5);
		    	Gzip_5_1 =  Double.parseDouble(br_gzip5.readLine());
		    	Gzip_5_2 =  Double.parseDouble(br_gzip5.readLine());
		    	Gzip_5_3 =  Double.parseDouble(br_gzip5.readLine());
		    	br_gzip5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Gzip_5_1 = 0.0;
		    	Gzip_5_2 = 0.0;
		    	Gzip_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//5.BZIP2
	    	try 
	    	{
		    	File file_bzip1 = new File(s.getFilesDir(), "bzip2O");
		    	FileInputStream fis_bzip1 = new FileInputStream(file_bzip1);
		    	InputStreamReader isr_bzip1 = new InputStreamReader(fis_bzip1);
		    	BufferedReader br_bzip1 = new BufferedReader(isr_bzip1);
		    	Bzip2_1_1 =  Double.parseDouble(br_bzip1.readLine());
		    	Bzip2_1_2 =  Double.parseDouble(br_bzip1.readLine());
		    	Bzip2_1_3 =  Double.parseDouble(br_bzip1.readLine());
		    	br_bzip1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Bzip2_1_1 = 0.0;
		    	Bzip2_1_2 = 0.0;
		    	Bzip2_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_bzip2 = new File(s.getFilesDir(), "bzip2O1");
		    	FileInputStream fis_bzip2 = new FileInputStream(file_bzip2);
		    	InputStreamReader isr_bzip2 = new InputStreamReader(fis_bzip2);
		    	BufferedReader br_bzip2 = new BufferedReader(isr_bzip2);
		    	Bzip2_2_1 =  Double.parseDouble(br_bzip2.readLine());
		    	Bzip2_2_2 =  Double.parseDouble(br_bzip2.readLine());
		    	Bzip2_2_3 =  Double.parseDouble(br_bzip2.readLine());
		    	br_bzip2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Bzip2_2_1 = 0.0;
		    	Bzip2_2_2 = 0.0;
		    	Bzip2_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_bzip3 = new File(s.getFilesDir(), "bzip2O2");
		    	FileInputStream fis_bzip3 = new FileInputStream(file_bzip3);
		    	InputStreamReader isr_bzip3 = new InputStreamReader(fis_bzip3);
		    	BufferedReader br_bzip3 = new BufferedReader(isr_bzip3);
		    	Bzip2_3_1 =  Double.parseDouble(br_bzip3.readLine());
		    	Bzip2_3_2 =  Double.parseDouble(br_bzip3.readLine());
		    	Bzip2_3_3 =  Double.parseDouble(br_bzip3.readLine());
		    	br_bzip3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Bzip2_3_1 = 0.0;
		    	Bzip2_3_2 = 0.0;
		    	Bzip2_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_bzip4 = new File(s.getFilesDir(), "bzip2O3");
		    	FileInputStream fis_bzip4 = new FileInputStream(file_bzip4);
		    	InputStreamReader isr_bzip4 = new InputStreamReader(fis_bzip4);
		    	BufferedReader br_bzip4 = new BufferedReader(isr_bzip4);
		    	Bzip2_4_1 =  Double.parseDouble(br_bzip4.readLine());
		    	Bzip2_4_2 =  Double.parseDouble(br_bzip4.readLine());
		    	Bzip2_4_3 =  Double.parseDouble(br_bzip4.readLine());
		    	br_bzip4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Bzip2_4_1 = 0.0;
		    	Bzip2_4_2 = 0.0;
		    	Bzip2_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_bzip5 = new File(s.getFilesDir(), "bzip2O3F");
		    	FileInputStream fis_bzip5 = new FileInputStream(file_bzip5);
		    	InputStreamReader isr_bzip5 = new InputStreamReader(fis_bzip5);
		    	BufferedReader br_bzip5 = new BufferedReader(isr_bzip5);
		    	Bzip2_5_1 =  Double.parseDouble(br_bzip5.readLine());
		    	Bzip2_5_2 =  Double.parseDouble(br_bzip5.readLine());
		    	Bzip2_5_3 =  Double.parseDouble(br_bzip5.readLine());
		    	br_bzip5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Bzip2_5_1 = 0.0;
		    	Bzip2_5_2 = 0.0;
		    	Bzip2_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//6.CRAFTY
	    	try 
	    	{
		    	File file_crafty1 = new File(s.getFilesDir(), "craftyO");
		    	FileInputStream fis_crafty1 = new FileInputStream(file_crafty1);
		    	InputStreamReader isr_crafty1 = new InputStreamReader(fis_crafty1);
		    	BufferedReader br_crafty1 = new BufferedReader(isr_crafty1);
		    	Crafty_1_1 =  Double.parseDouble(br_crafty1.readLine());
		    	Crafty_1_2 =  Double.parseDouble(br_crafty1.readLine());
		    	Crafty_1_3 =  Double.parseDouble(br_crafty1.readLine());
		    	br_crafty1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Crafty_1_1 = 0.0;
		    	Crafty_1_2 = 0.0;
		    	Crafty_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_crafty2 = new File(s.getFilesDir(), "craftyO1");
		    	FileInputStream fis_crafty2 = new FileInputStream(file_crafty2);
		    	InputStreamReader isr_crafty2 = new InputStreamReader(fis_crafty2);
		    	BufferedReader br_crafty2 = new BufferedReader(isr_crafty2);
		    	Crafty_2_1 =  Double.parseDouble(br_crafty2.readLine());
		    	Crafty_2_2 =  Double.parseDouble(br_crafty2.readLine());
		    	Crafty_2_3 =  Double.parseDouble(br_crafty2.readLine());
		    	br_crafty2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Crafty_2_1 = 0.0;
		    	Crafty_2_2 = 0.0;
		    	Crafty_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_crafty3 = new File(s.getFilesDir(), "craftyO2");
		    	FileInputStream fis_crafty3 = new FileInputStream(file_crafty3);
		    	InputStreamReader isr_crafty3 = new InputStreamReader(fis_crafty3);
		    	BufferedReader br_crafty3 = new BufferedReader(isr_crafty3);
		    	Crafty_3_1 =  Double.parseDouble(br_crafty3.readLine());
		    	Crafty_3_2 =  Double.parseDouble(br_crafty3.readLine());
		    	Crafty_3_3 =  Double.parseDouble(br_crafty3.readLine());
		    	br_crafty3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Crafty_3_1 = 0.0;
		    	Crafty_3_2 = 0.0;
		    	Crafty_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_crafty4 = new File(s.getFilesDir(), "craftyO3");
		    	FileInputStream fis_crafty4 = new FileInputStream(file_crafty4);
		    	InputStreamReader isr_crafty4 = new InputStreamReader(fis_crafty4);
		    	BufferedReader br_crafty4 = new BufferedReader(isr_crafty4);
		    	Crafty_4_1 =  Double.parseDouble(br_crafty4.readLine());
		    	Crafty_4_2 =  Double.parseDouble(br_crafty4.readLine());
		    	Crafty_4_3 =  Double.parseDouble(br_crafty4.readLine());
		    	br_crafty4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Crafty_4_1 = 0.0;
		    	Crafty_4_2 = 0.0;
		    	Crafty_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_crafty5 = new File(s.getFilesDir(), "craftyO3F");
		    	FileInputStream fis_crafty5 = new FileInputStream(file_crafty5);
		    	InputStreamReader isr_crafty5 = new InputStreamReader(fis_crafty5);
		    	BufferedReader br_crafty5 = new BufferedReader(isr_crafty5);
		    	Crafty_5_1 =  Double.parseDouble(br_crafty5.readLine());
		    	Crafty_5_2 =  Double.parseDouble(br_crafty5.readLine());
		    	Crafty_5_3 =  Double.parseDouble(br_crafty5.readLine());
		    	br_crafty5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Crafty_5_1 = 0.0;
		    	Crafty_5_2 = 0.0;
		    	Crafty_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//7.VORTEX
	    	try 
	    	{
		    	File file_vortex1 = new File(s.getFilesDir(), "vortexO");
		    	FileInputStream fis_vortex1 = new FileInputStream(file_vortex1);
		    	InputStreamReader isr_vortex1 = new InputStreamReader(fis_vortex1);
		    	BufferedReader br_vortex1 = new BufferedReader(isr_vortex1);
		    	Vortex_1_1 =  Double.parseDouble(br_vortex1.readLine());
		    	Vortex_1_2 =  Double.parseDouble(br_vortex1.readLine());
		    	Vortex_1_3 =  Double.parseDouble(br_vortex1.readLine());
		    	br_vortex1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vortex_1_1 = 0.0;
	    		Vortex_1_2 = 0.0;
		    	Vortex_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vortex2 = new File(s.getFilesDir(), "vortexO1");
		    	FileInputStream fis_vortex2 = new FileInputStream(file_vortex2);
		    	InputStreamReader isr_vortex2 = new InputStreamReader(fis_vortex2);
		    	BufferedReader br_vortex2 = new BufferedReader(isr_vortex2);
		    	Vortex_2_1 =  Double.parseDouble(br_vortex2.readLine());
		    	Vortex_2_2 =  Double.parseDouble(br_vortex2.readLine());
		    	Vortex_2_3 =  Double.parseDouble(br_vortex2.readLine());
		    	br_vortex2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vortex_2_1 = 0.0;
		    	Vortex_2_2 = 0.0;
		    	Vortex_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vortex3 = new File(s.getFilesDir(), "vortexO2");
		    	FileInputStream fis_vortex3 = new FileInputStream(file_vortex3);
		    	InputStreamReader isr_vortex3 = new InputStreamReader(fis_vortex3);
		    	BufferedReader br_vortex3 = new BufferedReader(isr_vortex3);
		    	Vortex_3_1 =  Double.parseDouble(br_vortex3.readLine());
		    	Vortex_3_2 =  Double.parseDouble(br_vortex3.readLine());
		    	Vortex_3_3 =  Double.parseDouble(br_vortex3.readLine());
		    	br_vortex3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vortex_3_1 = 0.0;
		    	Vortex_3_2 = 0.0;
		    	Vortex_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vortex4 = new File(s.getFilesDir(), "vortexO3");
		    	FileInputStream fis_vortex4 = new FileInputStream(file_vortex4);
		    	InputStreamReader isr_vortex4 = new InputStreamReader(fis_vortex4);
		    	BufferedReader br_vortex4 = new BufferedReader(isr_vortex4);
		    	Vortex_4_1 =  Double.parseDouble(br_vortex4.readLine());
		    	Vortex_4_2 =  Double.parseDouble(br_vortex4.readLine());
		    	Vortex_4_3 =  Double.parseDouble(br_vortex4.readLine());
		    	br_vortex4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vortex_4_1 = 0.0;
		    	Vortex_4_2 = 0.0;
		    	Vortex_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vortex5 = new File(s.getFilesDir(), "vortexO3F");
		    	FileInputStream fis_vortex5 = new FileInputStream(file_vortex5);
		    	InputStreamReader isr_vortex5 = new InputStreamReader(fis_vortex5);
		    	BufferedReader br_vortex5 = new BufferedReader(isr_vortex5);
		    	Vortex_5_1 =  Double.parseDouble(br_vortex5.readLine());
		    	Vortex_5_2 =  Double.parseDouble(br_vortex5.readLine());
		    	Vortex_5_3 =  Double.parseDouble(br_vortex5.readLine());
		    	br_vortex5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vortex_5_1 = 0.0;
		    	Vortex_5_2 = 0.0;
		    	Vortex_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//8.PARSER
	    	try 
	    	{
		    	File file_parser1 = new File(s.getFilesDir(), "parserO");
		    	FileInputStream fis_parser1 = new FileInputStream(file_parser1);
		    	InputStreamReader isr_parser1 = new InputStreamReader(fis_parser1);
		    	BufferedReader br_parser1 = new BufferedReader(isr_parser1);
		    	Parser_1_1 =  Double.parseDouble(br_parser1.readLine());
		    	Parser_1_2 =  Double.parseDouble(br_parser1.readLine());
		    	Parser_1_3 =  Double.parseDouble(br_parser1.readLine());
		    	br_parser1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Parser_1_1 = 0.0;
		    	Parser_1_2 = 0.0;
		    	Parser_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_parser2 = new File(s.getFilesDir(), "parserO1");
		    	FileInputStream fis_parser2 = new FileInputStream(file_parser2);
		    	InputStreamReader isr_parser2 = new InputStreamReader(fis_parser2);
		    	BufferedReader br_parser2 = new BufferedReader(isr_parser2);
		    	Parser_2_1 =  Double.parseDouble(br_parser2.readLine());
		    	Parser_2_2 =  Double.parseDouble(br_parser2.readLine());
		    	Parser_2_3 =  Double.parseDouble(br_parser2.readLine());
		    	br_parser2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Parser_2_1 = 0.0;
		    	Parser_2_2 = 0.0;
		    	Parser_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_parser3 = new File(s.getFilesDir(), "parserO2");
		    	FileInputStream fis_parser3 = new FileInputStream(file_parser3);
		    	InputStreamReader isr_parser3 = new InputStreamReader(fis_parser3);
		    	BufferedReader br_parser3 = new BufferedReader(isr_parser3);
		    	Parser_3_1 =  Double.parseDouble(br_parser3.readLine());
		    	Parser_3_2 =  Double.parseDouble(br_parser3.readLine());
		    	Parser_3_3 =  Double.parseDouble(br_parser3.readLine());
		    	br_parser3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Parser_3_1 = 0.0;
		    	Parser_3_2 = 0.0;
		    	Parser_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_parser4 = new File(s.getFilesDir(), "parserO3");
		    	FileInputStream fis_parser4 = new FileInputStream(file_parser4);
		    	InputStreamReader isr_parser4 = new InputStreamReader(fis_parser4);
		    	BufferedReader br_parser4 = new BufferedReader(isr_parser4);
		    	Parser_4_1 =  Double.parseDouble(br_parser4.readLine());
		    	Parser_4_2 =  Double.parseDouble(br_parser4.readLine());
		    	Parser_4_3 =  Double.parseDouble(br_parser4.readLine());
		    	br_parser4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Parser_4_1 = 0.0;
		    	Parser_4_2 = 0.0;
		    	Parser_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_parser5 = new File(s.getFilesDir(), "parserO3F");
		    	FileInputStream fis_parser5 = new FileInputStream(file_parser5);
		    	InputStreamReader isr_parser5 = new InputStreamReader(fis_parser5);
		    	BufferedReader br_parser5 = new BufferedReader(isr_parser5);
		    	Parser_5_1 =  Double.parseDouble(br_parser5.readLine());
		    	Parser_5_2 =  Double.parseDouble(br_parser5.readLine());
		    	Parser_5_3 =  Double.parseDouble(br_parser5.readLine());
		    	br_parser5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Parser_5_1 = 0.0;
		    	Parser_5_2 = 0.0;
		    	Parser_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//9.VPR
	    	try 
	    	{
		    	File file_vpr1 = new File(s.getFilesDir(), "vprO");
		    	FileInputStream fis_vpr1 = new FileInputStream(file_vpr1);
		    	InputStreamReader isr_vpr1 = new InputStreamReader(fis_vpr1);
		    	BufferedReader br_vpr1 = new BufferedReader(isr_vpr1);
		    	Vpr_1_1 =  Double.parseDouble(br_vpr1.readLine());
		    	Vpr_1_2 =  Double.parseDouble(br_vpr1.readLine());
		    	Vpr_1_3 =  Double.parseDouble(br_vpr1.readLine());
		    	br_vpr1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vpr_1_1 = 0.0;
		    	Vpr_1_2 = 0.0;
		    	Vpr_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vpr2 = new File(s.getFilesDir(), "vprO1");
		    	FileInputStream fis_vpr2 = new FileInputStream(file_vpr2);
		    	InputStreamReader isr_vpr2 = new InputStreamReader(fis_vpr2);
		    	BufferedReader br_vpr2 = new BufferedReader(isr_vpr2);
		    	Vpr_2_1 =  Double.parseDouble(br_vpr2.readLine());
		    	Vpr_2_2 =  Double.parseDouble(br_vpr2.readLine());
		    	Vpr_2_3 =  Double.parseDouble(br_vpr2.readLine());
		    	br_vpr2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vpr_2_1 = 0.0;
		    	Vpr_2_2 = 0.0;
		    	Vpr_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vpr3 = new File(s.getFilesDir(), "vprO2");
		    	FileInputStream fis_vpr3 = new FileInputStream(file_vpr3);
		    	InputStreamReader isr_vpr3 = new InputStreamReader(fis_vpr3);
		    	BufferedReader br_vpr3 = new BufferedReader(isr_vpr3);
		    	Vpr_3_1 =  Double.parseDouble(br_vpr3.readLine());
		    	Vpr_3_2 =  Double.parseDouble(br_vpr3.readLine());
		    	Vpr_3_3 =  Double.parseDouble(br_vpr3.readLine());
		    	br_vpr3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vpr_3_1 = 0.0;
		    	Vpr_3_2 = 0.0;
		    	Vpr_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vpr4 = new File(s.getFilesDir(), "vprO3");
		    	FileInputStream fis_vpr4 = new FileInputStream(file_vpr4);
		    	InputStreamReader isr_vpr4 = new InputStreamReader(fis_vpr4);
		    	BufferedReader br_vpr4 = new BufferedReader(isr_vpr4);
		    	Vpr_4_1 =  Double.parseDouble(br_vpr4.readLine());
		    	Vpr_4_2 =  Double.parseDouble(br_vpr4.readLine());
		    	Vpr_4_3 =  Double.parseDouble(br_vpr4.readLine());
		    	br_vpr4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vpr_4_1 = 0.0;
		    	Vpr_4_2 = 0.0;
		    	Vpr_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_vpr5 = new File(s.getFilesDir(), "vprO3F");
		    	FileInputStream fis_vpr5 = new FileInputStream(file_vpr5);
		    	InputStreamReader isr_vpr5 = new InputStreamReader(fis_vpr5);
		    	BufferedReader br_vpr5 = new BufferedReader(isr_vpr5);
		    	Vpr_5_1 =  Double.parseDouble(br_vpr5.readLine());
		    	Vpr_5_2 =  Double.parseDouble(br_vpr5.readLine());
		    	Vpr_5_3 =  Double.parseDouble(br_vpr5.readLine());
		    	br_vpr5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Vpr_5_1 = 0.0;
		    	Vpr_5_2 = 0.0;
		    	Vpr_5_3 = 0.0;
	    		e.printStackTrace();
	    	}

	    	
	    	//10.TWOLF
	    	try 
	    	{
		    	File file_twolf1 = new File(s.getFilesDir(), "twolfO");
		    	FileInputStream fis_twolf1 = new FileInputStream(file_twolf1);
		    	InputStreamReader isr_twolf1 = new InputStreamReader(fis_twolf1);
		    	BufferedReader br_twolf1 = new BufferedReader(isr_twolf1);
		    	Twolf_1_1 =  Double.parseDouble(br_twolf1.readLine());
		    	Twolf_1_2 =  Double.parseDouble(br_twolf1.readLine());
		    	Twolf_1_3 =  Double.parseDouble(br_twolf1.readLine());
		    	br_twolf1.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Twolf_1_1 = 0.0;
		    	Twolf_1_2 = 0.0;
		    	Twolf_1_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_twolf2 = new File(s.getFilesDir(), "twolfO1");
		    	FileInputStream fis_twolf2 = new FileInputStream(file_twolf2);
		    	InputStreamReader isr_twolf2 = new InputStreamReader(fis_twolf2);
		    	BufferedReader br_twolf2 = new BufferedReader(isr_twolf2);
		    	Twolf_2_1 =  Double.parseDouble(br_twolf2.readLine());
		    	Twolf_2_2 =  Double.parseDouble(br_twolf2.readLine());
		    	Twolf_2_3 =  Double.parseDouble(br_twolf2.readLine());
		    	br_twolf2.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Twolf_2_1 = 0.0;
		    	Twolf_2_2 = 0.0;
		    	Twolf_2_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_twolf3 = new File(s.getFilesDir(), "twolfO2");
		    	FileInputStream fis_twolf3 = new FileInputStream(file_twolf3);
		    	InputStreamReader isr_twolf3 = new InputStreamReader(fis_twolf3);
		    	BufferedReader br_twolf3 = new BufferedReader(isr_twolf3);
		    	Twolf_3_1 =  Double.parseDouble(br_twolf3.readLine());
		    	Twolf_3_2 =  Double.parseDouble(br_twolf3.readLine());
		    	Twolf_3_3 =  Double.parseDouble(br_twolf3.readLine());
		    	br_twolf3.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Twolf_3_1 = 0.0;
		    	Twolf_3_2 = 0.0;
		    	Twolf_3_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_twolf4 = new File(s.getFilesDir(), "twolfO3");
		    	FileInputStream fis_twolf4 = new FileInputStream(file_twolf4);
		    	InputStreamReader isr_twolf4 = new InputStreamReader(fis_twolf4);
		    	BufferedReader br_twolf4 = new BufferedReader(isr_twolf4);
		    	Twolf_4_1 =  Double.parseDouble(br_twolf4.readLine());
		    	Twolf_4_2 =  Double.parseDouble(br_twolf4.readLine());
		    	Twolf_4_3 =  Double.parseDouble(br_twolf4.readLine());
		    	br_twolf4.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Twolf_4_1 = 0.0;
		    	Twolf_4_2 = 0.0;
		    	Twolf_4_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	try 
	    	{
		    	
		    	File file_twolf5 = new File(s.getFilesDir(), "twolfO3F");
		    	FileInputStream fis_twolf5 = new FileInputStream(file_twolf5);
		    	InputStreamReader isr_twolf5 = new InputStreamReader(fis_twolf5);
		    	BufferedReader br_twolf5 = new BufferedReader(isr_twolf5);
		    	Twolf_5_1 =  Double.parseDouble(br_twolf5.readLine());
		    	Twolf_5_2 =  Double.parseDouble(br_twolf5.readLine());
		    	Twolf_5_3 =  Double.parseDouble(br_twolf5.readLine());
		    	br_twolf5.close();
	    	}
	    	catch (Exception e)
	    	{
	    		Twolf_5_1 = 0.0;
		    	Twolf_5_2 = 0.0;
		    	Twolf_5_3 = 0.0;
	    		e.printStackTrace();
	    	}
	    	
	    	
	    	
	    	String file_string = "<!DOCTYPE html>\n<html>\n<body>\n<h1 style=\"text-align:center;\">SPEC CPU 2000 Benchmark</h1>\n";
	    	if(ref)
	    	{
	    	file_string = file_string + "<h4>Output Times For \"Ref\" input</h4>\n<table border=\"1\">\n<tr>\n";
	    	file_string = file_string + "<td>Benchmark</td>\n";
	    	if(O_0){
	    		file_string = file_string + "<td>Android No Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux No Optimisation</td>\n";
	    	}	
			if(O_1){
				file_string = file_string + "<td>Android O_1 Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_1 Optimisation</td>\n";
				}
			if(O_2){
	        	file_string = file_string + "<td>Android O_2 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_2 Optimisation</td>\n";
	        	}
			if(O_3){
	        	file_string = file_string + "<td>Android O_3 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_3 Optimisation</td>\n";
	        	}
			if(O_3_F){
				file_string = file_string + "<td>Android O_3fast Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_3fast Optimisation</td>\n";
				}
	    	file_string = file_string + "</tr>\n<tr>\n";
	    	
	    	if(a%2==1)
	  		{
	  			//1.MCF
	  			file_string = file_string + "<td>Mcf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_8_1)+"</td>\n";
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>1)%2==1)
	  		{
	  			//2.GAP
	  			file_string = file_string + "<td>Gap</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>2)%2==1)
	  		{
	  			//3.VORTEX
	  			file_string = file_string + "<td>Vortex</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>3)%2==1)
	  		{
	  			//4.CRAFTY	
	  			file_string = file_string + "<td>Crafty</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>4)%2==1)
	  		{
	  			//5.BZIP2
	  			file_string = file_string + "<td>Bzip2</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>5)%2==1)
	  		{
	  			//6.GZIP
	  			file_string = file_string + "<td>Gzip</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>6)%2==1)
	  		{
	  			//7.PARSER
	  			file_string = file_string + "<td>Parser</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>7)%2==1)
	  		{
	  			//8.TWOLF
	  			file_string = file_string + "<td>Twolf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>8)%2==1)
	  		{
	  			//9.VPR
	  			file_string = file_string + "<td>Vpr</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_10_1)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>9)%2==1)
	  		{
	  			//10.GCC
	  			file_string = file_string + "<td>Gcc</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_1_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_6_1)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_2_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_7_1)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_3_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_8_1)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_4_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_9_1)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_5_1)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_10_1)+"</td>\n";
				}
	  		}


	  	    	file_string = file_string + "</tr>\n<tr>\n</table>\n";
	    	}
	    	
	    	if(test)
	    	{
	    	file_string = file_string + "<h4>Output Times For \"Test\" input</h4>\n<table border=\"1\">\n<tr>\n";
	    	file_string = file_string + "<td>Benchmark</td>\n";
	    	if(O_0){
	    		file_string = file_string + "<td>Android No Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux No Optimisation</td>\n";
	    	}	
			if(O_1){
				file_string = file_string + "<td>Android O_1 Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_1 Optimisation</td>\n";
				}
			if(O_2){
	        	file_string = file_string + "<td>Android O_2 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_2 Optimisation</td>\n";
	        	}
			if(O_3){
	        	file_string = file_string + "<td>Android O_3 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_3 Optimisation</td>\n";
	        	}
			if(O_3_F){
				file_string = file_string + "<td>Android O_3fast Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_3fast Optimisation</td>\n";
				}
	    	file_string = file_string + "</tr>\n<tr>\n";
	    	
	    	if(a%2==1)
	  		{
	  			//1.MCF
	  			file_string = file_string + "<td>Mcf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_8_2)+"</td>\n";
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>1)%2==1)
	  		{
	  			//2.GAP
	  			file_string = file_string + "<td>Gap</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>2)%2==1)
	  		{
	  			//3.VORTEX
	  			file_string = file_string + "<td>Vortex</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>3)%2==1)
	  		{
	  			//4.CRAFTY	
	  			file_string = file_string + "<td>Crafty</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>4)%2==1)
	  		{
	  			//5.BZIP2
	  			file_string = file_string + "<td>Bzip2</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>5)%2==1)
	  		{
	  			//6.GZIP
	  			file_string = file_string + "<td>Gzip</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>6)%2==1)
	  		{
	  			//7.PARSER
	  			file_string = file_string + "<td>Parser</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>7)%2==1)
	  		{
	  			//8.TWOLF
	  			file_string = file_string + "<td>Twolf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>8)%2==1)
	  		{
	  			//9.VPR
	  			file_string = file_string + "<td>Vpr</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_10_2)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>9)%2==1)
	  		{
	  			//10.GCC
	  			file_string = file_string + "<td>Gcc</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_1_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_6_2)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_2_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_7_2)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_3_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_8_2)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_4_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_9_2)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_5_2)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_10_2)+"</td>\n";
				}
	  		}

		    	file_string = file_string + "</tr>\n<tr>\n</table>\n";
	    }
	    	
	    if(train)
	    	{
	    	file_string = file_string + "<h4>Output Times For \"Train\" input</h4>\n<table border=\"1\">\n<tr>\n";
	    	file_string = file_string + "<td>Benchmark</td>\n";
	    	if(O_0){
	    		file_string = file_string + "<td>Android No Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux No Optimisation</td>\n";
	    	}	
			if(O_1){
				file_string = file_string + "<td>Android O_1 Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_1 Optimisation</td>\n";
				}
			if(O_2){
	        	file_string = file_string + "<td>Android O_2 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_2 Optimisation</td>\n";
	        	}
			if(O_3){
	        	file_string = file_string + "<td>Android O_3 Optimisation</td>\n";
	        	file_string = file_string + "<td>Linux O_3 Optimisation</td>\n";
	        	}
			if(O_3_F){
				file_string = file_string + "<td>Android O_3fast Optimisation</td>\n";
		    	file_string = file_string + "<td>Linux O_3fast Optimisation</td>\n";
				}
	    	file_string = file_string + "</tr>\n<tr>\n";
	    	
	    	if(a%2==1)
	  		{
	  			//1.MCF
	  			file_string = file_string + "<td>Mcf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_8_3)+"</td>\n";
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Mcf_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Mcf_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Mcf_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>1)%2==1)
	  		{
	  			//2.GAP
	  			file_string = file_string + "<td>Gap</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gap_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gap_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gap_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>2)%2==1)
	  		{
	  			//3.VORTEX
	  			file_string = file_string + "<td>Vortex</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vortex_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vortex_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vortex_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>3)%2==1)
	  		{
	  			//4.CRAFTY	
	  			file_string = file_string + "<td>Crafty</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Crafty_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Crafty_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Crafty_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>4)%2==1)
	  		{
	  			//5.BZIP2
	  			file_string = file_string + "<td>Bzip2</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Bzip2_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Bzip2_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Bzip2_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>5)%2==1)
	  		{
	  			//6.GZIP
	  			file_string = file_string + "<td>Gzip</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gzip_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gzip_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gzip_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>6)%2==1)
	  		{
	  			//7.PARSER
	  			file_string = file_string + "<td>Parser</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Parser_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Parser_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Parser_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>7)%2==1)
	  		{
	  			//8.TWOLF
	  			file_string = file_string + "<td>Twolf</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Twolf_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Twolf_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Twolf_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>8)%2==1)
	  		{
	  			//9.VPR
	  			file_string = file_string + "<td>Vpr</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Vpr_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Vpr_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Vpr_10_3)+"</td>\n";
				}
	  	    	file_string = file_string + "</tr>\n<tr>\n";
	  		}
	  		if((a>>9)%2==1)
	  		{
	  			//10.GCC
	  			file_string = file_string + "<td>Gcc</td>\n";
	  	    	if(O_0){
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_1_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_6_3)+"</td>\n";
		  	    	}
				if(O_1){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_2_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_7_3)+"</td>\n";
				}
				if(O_2){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_3_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_8_3)+"</td>\n";		 
				}
				if(O_3){
					file_string = file_string + "<td>"+String.format("%.6f",Gcc_4_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_9_3)+"</td>\n";
				}
				if(O_3_F){
		  	    	file_string = file_string + "<td>"+String.format("%.6f",Gcc_5_3)+"</td>\n";
	  				file_string = file_string + "<td>"+String.format("%.6f",Gcc_10_3)+"</td>\n";
				}
	  		}

	  		file_string = file_string + "</tr>\n<tr>\n</table>\n";
	  		
	    }
	    	file_string = file_string + "<div id=\"footer\" style=\"background-color:#FFA500;clear:both;text-align:center;\"></div>\n</body>\n</html>";
	    	//HTML script created
	    	//Now writing to file 
	    try
			{
				File sdCard = Environment.getExternalStorageDirectory();
				File dir = new File (sdCard.getAbsolutePath() + "/SPEC_CPU_Bench/Result");
				dir.mkdirs();
				File file = new File(dir, "results.html");
				FileOutputStream outputStream = new FileOutputStream(file);
				outputStream.write(file_string.getBytes());
				outputStream.close();
	        
			} 
			catch (Exception e) 
			{
	    	 e.printStackTrace();
			}
		}

 }
