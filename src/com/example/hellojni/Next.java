package com.example.hellojni;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.CheckBox;

public class Next extends Activity {
	public static int b=0;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_next);
		((CheckBox) findViewById(R.id.checkbox1)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox2)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox3)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox4)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox5)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	}

//	@Override
//	public void onResume() {
//
//	((CheckBox) findViewById(R.id.checkbox1)).setChecked(false);
//	((CheckBox) findViewById(R.id.checkbox2)).setChecked(false);
//	((CheckBox) findViewById(R.id.checkbox3)).setChecked(false);
//	((CheckBox) findViewById(R.id.checkbox4)).setChecked(false);
//	((CheckBox) findViewById(R.id.checkbox5)).setChecked(false);
//	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
//	b = 0;
//		
//	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.next, menu);
		return true;
	}
	int d = 0;
	public void onCheckboxClick(View view)
	{
		if(d == 1)
		{
			b = 0;
			d = 0;
		}
		boolean checked = ((CheckBox) view).isChecked();
	    // Check which checkbox was clicked
	    switch(view.getId()) {
	        case R.id.checkbox1:
	            if ((checked) && b%2!=1){
	            	b+=1;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	            	if(b%2==1)
	            		b-=1;
	            }	            
	            break;
	        case R.id.checkbox2:
	        	if ((checked) && (b>>1)%2!=1){
	            	b+=2;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	            	if((b>>1)%2==1)
	            		b-=2;
	            }	            
	            break;
	        case R.id.checkbox3:
	        	if ((checked) && (b>>2)%2!=1){
	            	b+=4;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	            	if((b>>2)%2==1)
	            		b-=4;
	            }	            
	            break;
	        case R.id.checkbox4:
	        	if ((checked) && (b>>3)%2!=1){
	            	b+=8;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	            	if((b>>3)%2==1)
	            		b-=8;
	            }	            
	            break;
	        case R.id.checkbox5:
	        	if ((checked) && (b>>4)%2!=1){
	            	b+=16;
	            }
	            else if((!checked)){
	            	((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
	            	if((b>>4)%2==1)
	            		b-=16;
	            }	            
	            break;
	        case R.id.checkbox6:
	        	if(checked){
	        		b=31;
		        	((CheckBox) findViewById(R.id.checkbox1)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkbox2)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkbox3)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkbox4)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkbox5)).setChecked(true);
		    		((CheckBox) findViewById(R.id.checkbox6)).setChecked(true);
		    		break;
	        	}
		
	    }}

	public void next(View view)
	{ 
		if(d == 1)
		{
			b = 0;
		}
		System.out.println(b);
		if(b==0)
		{
			d = 0;
			return;
		}
		Testcase.c=0;
		((CheckBox) findViewById(R.id.checkbox1)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox2)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox3)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox4)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox5)).setChecked(false);
		((CheckBox) findViewById(R.id.checkbox6)).setChecked(false);
		Intent intent=new Intent(this,Testcase.class);
		startActivity(intent);

		d = 1;
		
		
	}
	public void back(View view)
	{
		finish();
	}

}