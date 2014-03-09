package com.example.hellojni;

import com.arieslabs.assetbridge.Assetbridge;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.CheckBox;

public class CheckMain extends Activity {
	private static final String EXTRA_MESSAGE = null;
	public static int a=0;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_check_main);
		((CheckBox) findViewById(R.id.checkBox1)).setChecked(false);
		//((CheckBox) findViewById(R.id.checkBox2)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox3)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox4)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox5)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox6)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox7)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox8)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox9)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox10)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
		a=0;
	}

	int d = 0;
	public void onCheckboxClicked(View view) {
		if(d==1)
		{
			a = 0;
			d=0;
		}
	    // Is the view now checked?
	    boolean checked = ((CheckBox) view).isChecked();
	    // Check which checkbox was clicked
	    switch(view.getId()) {
	        case R.id.checkBox1:
	            if ((checked) && a%2!=1){
	            	a+=1;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if(a%2==1)
	            		a-=1;
	            }	            
	            break;
	        case R.id.checkBox3:
	        	if ((checked) && (a>>2)%2!=1){
	            	a+=4;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>2)%2==1)
	            		a-=4;
	            }	            
	            break;
	        case R.id.checkBox4:
	        	if ((checked) && (a>>3)%2!=1){
	            	a+=8;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>3)%2==1)
	            		a-=8;
	            }	            
	            break;
	        case R.id.checkBox5:
	        	if ((checked) && (a>>4)%2!=1){
	            	a+=16;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>4)%2==1)
	            		a-=16;
	            }	            
	            break;
	        case R.id.checkBox6:
	        	if ((checked) && (a>>5)%2!=1){
	            	a+=32;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>5)%2==1)
	            		a-=32;
	            }	            
	            break;
	        case R.id.checkBox7:
	        	if ((checked) && (a>>6)%2!=1){
	            	a+=64;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>6)%2==1)
	            		a-=64;
	            }	            
	            break;
	        case R.id.checkBox8:
	        	if ((checked) && (a>>7)%2!=1){
	            	a+=128;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>7)%2==1)
	            		a-=128;
	            }	            
	            break;
	        case R.id.checkBox9:
	        	if ((checked) && (a>>8)%2!=1){
	            	a+=256;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>8)%2==1)
	            		a-=256;
	            }	            
	            break;
	        case R.id.checkBox10:
	        	if ((checked) && (a>>9)%2!=1){
	            	a+=512;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
	            	if((a>>9)%2==1)
	            		a-=512;
	            }	            
	            break;
	        case R.id.checkBox11:
	        	if(checked){
	        		a=1021;
		        	((CheckBox) findViewById(R.id.checkBox1)).setChecked(true);
		    		//((CheckBox) findViewById(R.id.checkBox2)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox3)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox4)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox5)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox6)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox7)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox8)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox9)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkBox10)).setChecked(true);
		        	break;
	        	}	        
	        
	    }
	    System.out.println(a);
	}
	public void next(View view)
	{
		if(d == 1)
		{
			a = 0;
		}
		System.out.println(a);
		if(a==0)
		{
			d = 0;
			return;
		}
		d=1;
		Next.b=0;
		((CheckBox) findViewById(R.id.checkBox1)).setChecked(false);
		//((CheckBox) findViewById(R.id.checkBox2)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox3)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox4)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox5)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox6)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox7)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox8)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox9)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox10)).setChecked(false);
		((CheckBox) findViewById(R.id.checkBox11)).setChecked(false);
		Intent intent = new Intent(this, Next.class);
		//String message = Assetbridge.path;
		//intent.putExtra(EXTRA_MESSAGE, a);
		startActivity(intent);
	}
	public void back(View view)
	{
		finish();
	}
	

}
