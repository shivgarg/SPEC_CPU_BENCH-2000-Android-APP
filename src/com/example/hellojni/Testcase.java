package com.example.hellojni;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.CheckBox;

public class Testcase extends Activity {
	public static int c=0;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_testcase);
		((CheckBox) findViewById(R.id.check1)).setChecked(false);
		((CheckBox) findViewById(R.id.check2)).setChecked(false);
		((CheckBox) findViewById(R.id.check3)).setChecked(false);
		((CheckBox) findViewById(R.id.check4)).setChecked(false);
	}
	int d = 0;
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.testcase, menu);
		return true;
	}
	public void onCheck(View view)
	{
		if(d==1)
		{
			c = 0;
			d=0;
		}
		boolean checked = ((CheckBox) view).isChecked();
	    // Check which checkbox was clicked
	    switch(view.getId()) {
	        case R.id.check1:
	            if ((checked) && (c>>2)%2!=1){
	            	c+=4;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.check4)).setChecked(false);
	            	if((c>>2)%2==1)
	            		c-=4;
	            }	            
	            break;
	        case R.id.check2:
	        	if ((checked) && (c>>1)%2!=1){
	            	c+=2;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.check4)).setChecked(false);
	            	if((c>>1)%2==1)
	            		c-=2;
	            }	            
	            break;
	        case R.id.check3:
	        	if ((checked) && (c)%2!=1){
	            	c+=1;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.check4)).setChecked(false);
	            	if((c)%2==1)
	            		c-=1;
	            }	            
	            break;
	        case R.id.check4:
	        	if(checked){
	        		c=7;
		        	((CheckBox) findViewById(R.id.check1)).setChecked(true);
		    		((CheckBox) findViewById(R.id.check2)).setChecked(true);
		    		((CheckBox) findViewById(R.id.check3)).setChecked(true);
		    		((CheckBox) findViewById(R.id.check4)).setChecked(true);
		    		break;
	        	}
		
	    }
	    System.out.println("sswsdwdwd  "+c);
	}
	public void next(View view)
	{
		if(d==1)
		{
			c = 0;
		}
		System.out.println(c);
		if(c==0)
		{
			d = 0;
			return;
		}
		d=1;
		((CheckBox) findViewById(R.id.check1)).setChecked(false);
		((CheckBox) findViewById(R.id.check2)).setChecked(false);
		((CheckBox) findViewById(R.id.check3)).setChecked(false);
		((CheckBox) findViewById(R.id.check4)).setChecked(false);
		Intent intent =new Intent(this,Run.class);
		startActivity(intent);
		
	}
	public void back(View view)
	{
		finish();	
	}
	

}
