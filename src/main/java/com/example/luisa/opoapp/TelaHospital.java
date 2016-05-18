package com.example.luisa.opoapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.Spinner;

public class TelaHospital extends AppCompatActivity {


    private String[] Hospitais = {"HUERB", "Hospital das Clinicas", "Hospital Santa Juliana", "SASMC"};




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_telahospital);

        final ImageButton btnAvancar = (ImageButton) findViewById(R.id.btnAvancar);
        final Spinner spHospitais = (Spinner) findViewById(R.id.listaHospitais);






        ArrayAdapter adp = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, Hospitais);
        adp.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spHospitais.setAdapter(adp);



        btnAvancar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String hospital = spHospitais.getSelectedItem().toString();

                startSecondActivity(btnAvancar, hospital);

            }
        });

    }

    public void startSecondActivity(View view,String hospital) {


        Intent secondActivity = new Intent(this,TelaFormulario.class );
        Bundle bundle = new Bundle();
        bundle.putString("hospital",hospital);
        secondActivity.putExtras(bundle);
        startActivity(secondActivity);
    }


}
