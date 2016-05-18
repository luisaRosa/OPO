package com.example.luisa.opoapp;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Toast;

/**
 * Created by Luisa on 01/05/2016.
 */
public class TelaFormulario extends Activity {

    MailService mailService;
    String hospital, nome,idade, pupilas,ao,mrv, mrm, sias, dias, informacoesAdd, rbsedado;







    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_formulario);

        Intent intent = getIntent();
        Bundle bundle = new Bundle();
        bundle = intent.getExtras();
        final EditText tfxNome = (EditText)findViewById(R.id.txtNome);
        final  EditText tfxIdade = (EditText)findViewById(R.id.txtIdade);
        final  EditText tfxPupilas = (EditText)findViewById(R.id.txfPupilas);
        final  EditText tfxAo = (EditText)findViewById(R.id.txfAo);
        final  EditText tfxMrv = (EditText)findViewById(R.id.txfMRV);
        final  EditText tfxMrm = (EditText)findViewById(R.id.txfMRM);
        final  EditText tfxDiastolica = (EditText)findViewById(R.id.diastolica);
        final  EditText tfxSistolica = (EditText)findViewById(R.id.sistolica);
        final  EditText txfInfomacoesAdd = (EditText) findViewById(R.id.txfInformacoesAdd);

        hospital = bundle.getString("hospital").toString();



        Button btnEnviar = (Button) findViewById(R.id.btnEnviar);



        btnEnviar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                nome = tfxNome.getText().toString();

                idade = tfxIdade.getText().toString();

                pupilas = tfxPupilas.getText().toString();

                ao = tfxAo.getText().toString();

                mrm = tfxMrm.getText().toString();

                mrv = tfxMrv.getText().toString();

               sias = tfxSistolica.getText().toString();
               dias = tfxDiastolica.getText().toString();



                RadioGroup rg = (RadioGroup) findViewById(R.id.rgSedado);
                int sedado = rg.getCheckedRadioButtonId();
                if(sedado == R.id.rbSim)
                    rbsedado = "sim";
                else
                    rbsedado = "não";



                informacoesAdd = txfInfomacoesAdd.getText().toString();






                mailService = new MailService(hospital, nome, idade, ao,mrv,mrm, sias,dias,  pupilas,rbsedado, informacoesAdd );

               // mailService.sendEmail();
                try {
                    mailService.enviarEmailImap();
                    Toast toast = Toast.makeText(getApplication(),"Dados enviados", Toast.LENGTH_LONG);
                    toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();

                } catch (Exception e) {
                    e.printStackTrace();
                }


            }
        });
    }
}