package com.example.luisarosa.opoappihm;


import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.RadioGroup;
import android.widget.Toast;


public class QuadroClinicoActivity extends AppCompatActivity {


    String hospital, pupilas,ao,mrv, mrm, sias, dias, informacoesAdd, rbsedado, nome, idade, dados;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quadro_clinico);


        Intent intent = getIntent();
        Bundle bundle = new Bundle();
        bundle = intent.getExtras();
        final  EditText tfxPupilas = (EditText)findViewById(R.id.txfPupilas);
        final  EditText tfxAo = (EditText)findViewById(R.id.txfAo);
        final  EditText tfxMrv = (EditText)findViewById(R.id.txfMRV);
        final  EditText tfxMrm = (EditText)findViewById(R.id.txfMRM);
        final  EditText tfxDiastolica = (EditText)findViewById(R.id.diastolica);
        final  EditText tfxSistolica = (EditText)findViewById(R.id.sistolica);
        final  EditText txfInfomacoesAdd = (EditText) findViewById(R.id.txfInformacoesAdd);

        dados = bundle.getString("dados").toString();
       final String[]dado = dados.split(";");


        final Button btnAvancar = (Button) findViewById(R.id.btnAvancar);

        btnAvancar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if((tfxPupilas.getText().toString().equalsIgnoreCase(""))|| (tfxAo.getText().toString().equalsIgnoreCase("")) ||(tfxMrm.getText().toString().equalsIgnoreCase(""))||
                        (tfxMrv.getText().toString().equalsIgnoreCase(""))||(tfxSistolica.getText().toString().equalsIgnoreCase("")) ||(tfxDiastolica.getText().toString().equalsIgnoreCase(""))
                    ||(txfInfomacoesAdd.getText().toString().equalsIgnoreCase(""))){

                    Toast toast = Toast.makeText(getApplication(),"Um ou mais campos não foram preechidos, Campos obrigatórios:" +
                            "\n Pupilas,\n AO, \n MRV,\n MRM,\n Pressão Arterial,\n Informações Adicionais", Toast.LENGTH_LONG);
                    toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();

                }else {

                    pupilas = tfxPupilas.getText().toString();

                    ao = tfxAo.getText().toString();

                    mrm = tfxMrm.getText().toString();

                    mrv = tfxMrv.getText().toString();

                    sias = tfxSistolica.getText().toString();
                    dias = tfxDiastolica.getText().toString();


                    RadioGroup rg = (RadioGroup) findViewById(R.id.rgSedado);
                    int sedado = rg.getCheckedRadioButtonId();
                    if (sedado == R.id.rbSim)
                        rbsedado = "sim";
                    else
                        rbsedado = "não";


                    informacoesAdd = txfInfomacoesAdd.getText().toString();

                    dados = dados + ";" + pupilas + ";" + ao + ";" + mrm + ";" + mrv + ";" + sias + ";" + dias + ";" + rbsedado + ";" + informacoesAdd;

                    startSecondActivity(btnAvancar, dados);

                }
            }
        });




    }

    public boolean onOptionsItemSelected(MenuItem item){
        Intent myIntent = new Intent(getApplicationContext(), ConfirmacaoActivity.class);
        startActivityForResult(myIntent, 0);
        return true;

    }

    public void startSecondActivity(View view,String dados) {


        Intent secondActivity = new Intent(this, ConfirmacaoActivity.class );
        Bundle bundle = new Bundle();
        bundle.putString("dados",dados);
        secondActivity.putExtras(bundle);
        startActivity(secondActivity);
    }



}
