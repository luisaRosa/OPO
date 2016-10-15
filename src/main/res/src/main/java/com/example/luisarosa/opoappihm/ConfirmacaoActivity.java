package com.example.luisarosa.opoappihm;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Toast;

public class ConfirmacaoActivity extends AppCompatActivity {

    String dados, hospital, nome, idade, ao, mrv, mrm, sias, dias, pupilas, rbsedado, informacoesAdd;
    MailService mailService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_confirmacao);

        final EditText tfxunidade = (EditText)findViewById(R.id.txtunidade);
        final EditText tfxNome = (EditText)findViewById(R.id.txtNome);
        final  EditText tfxIdade = (EditText)findViewById(R.id.txtIdade);
        final  EditText tfxPupilas = (EditText)findViewById(R.id.txfPupilas);
        final  EditText tfxAo = (EditText)findViewById(R.id.txfAo);
        final  EditText tfxMrv = (EditText)findViewById(R.id.txfMRV);
        final  EditText tfxMrm = (EditText)findViewById(R.id.txfMRM);
        final  EditText tfxDiastolica = (EditText)findViewById(R.id.diastolica);
        final  EditText tfxSistolica = (EditText)findViewById(R.id.sistolica);
        final EditText txfSedado = (EditText)findViewById(R.id.txtSedado);
        final  EditText txfInfomacoesAdd = (EditText) findViewById(R.id.txfInformacoesAdd);


        Intent intent = getIntent();
        Bundle bundle = new Bundle();
        bundle = intent.getExtras();

        dados = bundle.getString("dados").toString();
        final String[] dado = dados.split(";");






        final Button btnEnviar = (Button) findViewById(R.id.btnEnviar);

        hospital = dado[0];
        nome = dado[1];
        idade = dado[2];
        pupilas = dado[3];
        ao = dado[4];
        mrm = dado[5];
        mrv = dado[6];
        sias = dado[7];
        dias = dado[8];
        rbsedado = dado[9];
        informacoesAdd = dado[10];


        tfxunidade.setText(hospital);
        tfxNome.setText(nome);
        tfxIdade.setText(idade);
        tfxPupilas.setText(pupilas);
        tfxAo.setText(ao);
        tfxMrm.setText(mrm);
        tfxMrv.setText(mrm);
        tfxDiastolica.setText(dias);
        tfxSistolica.setText(sias);
        txfSedado.setText(rbsedado);
        txfInfomacoesAdd.setText(informacoesAdd);





        btnEnviar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {











                mailService = new MailService(hospital, nome, idade, ao,mrv,mrm, sias,dias,  pupilas,rbsedado, informacoesAdd );

                // mailService.sendEmail();
                try {
                    mailService.enviarEmailImap();
                    Toast toast = Toast.makeText(getApplication(),"Dados enviados", Toast.LENGTH_LONG);
                    toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();
                    startApp(btnEnviar);

                } catch (Exception e) {
                    e.printStackTrace();
                    Toast toast = Toast.makeText(getApplication(),"Erro ao registrar notificação, tente novamente!", Toast.LENGTH_LONG);
                    toast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL, 0, 0); toast.show();
                }



            }
        });


    }

    public void startApp(View view) {

        Intent secondActivity = new Intent(this, InicialActivity.class );
        startActivity(secondActivity);
    }
}
