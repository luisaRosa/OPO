package com.example.luisarosa.opoappihm;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.os.Handler;
import android.view.Window;

public class MainSplash extends AppCompatActivity implements Runnable {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        Handler handler = new Handler();
        handler.postDelayed(this, 2000);
    }

    @Override
    public void run() {
        startActivity(new Intent(this, InicialActivity.class));
        finish();
    }
}
