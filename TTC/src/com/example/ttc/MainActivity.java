package com.example.ttc;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        final Button button=(Button)findViewById(R.id.btnTtc);
        button.setOnClickListener(new View.OnClickListener() 
        {
        @Override
        public void onClick(View v) 
        {

            switch (v.getId()) {
            case R.id.btnTtc:
                Intent intent = new Intent ("android.intent.action.VIEW",
                        Uri.parse("http://student.sinseer.com/"));
                startActivity (intent);
                break;
            default:
                break;
                }
            }
         }
      );
    }
}
