package com.example.luisarosa.opoappihm;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class InicialActivity extends AppCompatActivity {

    private String[] Hospitais = {"HUERB", "Hospital das Clinicas", "Hospital Santa Juliana", "SASMC"};
    String nome, idade;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inicial);

        final Button btnAvancar = (Button) findViewById(R.id.btnAvancar);
        final Spinner spHospitais = (Spinner) findViewById(R.id.listaHospitais);
        final TextView txtNome = (TextView) findViewById(R.id.txtNome);
        final TextView txtIdade = (TextView) findViewById(R.id.txtIdade);

        ArrayAdapter adp = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, Hospitais);
        adp.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spHospitais.setAdapter(adp);





        btnAvancar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if((txtNome.getText().toString().equalsIgnoreCase(""))||(txtIdade.getText().toString().equalsIgnoreCase(""))) {

                    Toast toast = Toast.makeText(getApplication(),"Campos Nome e/ou Idade  não formam preenchidos", Toast.LENGTH_LONG);
                    toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();
                }
                else{
                    nome = txtNome.getText().toString();
                    idade = txtIdade.getText().toString();

                    String dados = spHospitais.getSelectedItem().toString() + ";" + nome + ";" + idade;


                    startSecondActivity(btnAvancar, dados);

                }
            }
        });

    }

    public void startSecondActivity(View view,String dados) {


        Intent secondActivity = new Intent(this, QuadroClinicoActivity.class );
        Bundle bundle = new Bundle();
        bundle.putString("dados",dados);
        secondActivity.putExtras(bundle);
        startActivity(secondActivity);
    }
}
