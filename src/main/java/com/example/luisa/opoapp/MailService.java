package com.example.luisa.opoapp;

import android.view.Gravity;
import android.widget.Toast;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {


        final String username = "aplicativo.opo@gmail.com";
        final String password = "engenhariadesoftwarei";
        String mensagem;

        public MailService(String hospital, String nome, String idade, String Ao, String Mrv, String Mrm, String
                           pressaoArterial, String pupilas,String rbsedado, String informacoesAdd){

            mensagem =  "Central de Trasplantes Help Center:\n\n " +
                    "Unidade de Saúde: " + hospital+"  \n\n\n" +
                    "Dados Pessoais \n\n" +
                    "Nome: "+ nome+"\n\n" +
                    "Idade: "+idade+"\n\n\n" +
                    "Quadro Clínico\n\n" +
                    "Pulpilas: "+ pupilas+" \n\n" +
                    "Escala de Glasgow: \n\n" +
                    "  AO: "+Ao+"\n\n" +
                    "  MRV: "+Mrv+" \n\n" +
                    "  MRM: "+ Mrm+"\n\n" +
                    "Pressão Arterial: "+pressaoArterial+" \n\n" +
                    "Sedado: "+ rbsedado+"\n\n" +
                    "Informações Adicionais: \n" +
                    "   "+informacoesAdd +
                    "";
        }

        public void sendEmail() {

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            try {

                final Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("aplicativo.opo@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse("luisasilveirarosa@gmail.com"));
                message.setSubject("teste Opo app");
                message.setText(mensagem);

                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            Transport.send(message);

                        } catch (MessagingException e) {
                            e.printStackTrace();
                        }
                    }
                }).start();

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
}




