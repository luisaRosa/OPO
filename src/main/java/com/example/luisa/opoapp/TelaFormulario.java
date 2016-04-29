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
import android.widget.Spinner;
import android.widget.Toast;
import javax.mail.MessagingException;

/**
 * Created by Luisa on 21/04/2016.
 */
public class TelaFormulario extends Activity {

    MailService mailService;
    String hospital, nome,idade, pupilas,ao,mrv, mrm, pressaoArterial, informacoesAdd, rbsedado;






    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tela_formulario);

        Intent intent = getIntent();
        Bundle bundle = new Bundle();
        bundle = intent.getExtras();
        final EditText tfxNome = (EditText)findViewById(R.id.txtNome);
        final  EditText tfxIdade = (EditText)findViewById(R.id.txtIdade);
        final  EditText tfxPupilas = (EditText)findViewById(R.id.txfPupilas);
        final  EditText tfxAo = (EditText)findViewById(R.id.txfAo);
        final  EditText tfxMrv = (EditText)findViewById(R.id.txfMRV);
        final  EditText tfxMrm = (EditText)findViewById(R.id.txfMRM);
        final  EditText tfxpressaoArterial = (EditText)findViewById(R.id.txfPressaoArterial);
        final  EditText txfInfomacoesAdd = (EditText) findViewById(R.id.txfInformacoesAdd);

        hospital = bundle.getString("hospital").toString();



        Button btnEnviar = (Button) findViewById(R.id.btnEnviar);



        btnEnviar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                nome = tfxNome.getText().toString();
                pupilas = tfxPupilas.getText().toString();
                idade = tfxIdade.getText().toString();
                ao = tfxAo.getText().toString();
                mrm = tfxMrm.getText().toString();
                mrv = tfxMrv.getText().toString();
                pressaoArterial = tfxpressaoArterial.getText().toString();
                pupilas = tfxPupilas.getText().toString();
                informacoesAdd = txfInfomacoesAdd.getText().toString();

                RadioGroup rg = (RadioGroup) findViewById(R.id.rgSedado);
                int sedado = rg.getCheckedRadioButtonId();
                if(sedado == R.id.rbSim)
                    rbsedado = "sim";
                else
                    rbsedado = "não";





                mailService = new MailService(hospital, nome, idade, ao,mrv,mrm,pressaoArterial, pupilas,rbsedado, informacoesAdd );

                mailService.sendEmail();
                Toast toast = Toast.makeText(getApplication(),"Dados enviados", Toast.LENGTH_LONG);
                toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();
            }
        });
    }
}
