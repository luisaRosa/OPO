package com.example.luisa.opoapp;

import android.os.Environment;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Flags;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Created by Luisa on 01/05/2016.
 */
public class MailService {


    final String username = "aplicativo.opo@gmail.com";
    final String password = "engenhariadesoftwarei";
    String mensagem;
    AddFile addFile ;

    public MailService(String hospital, String nome, String idade, String Ao, String Mrv, String Mrm, String sias
            , String dias, String pupilas,String rbsedado, String informacoesAdd){


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
                "Pressão Arterial: "+sias+"/"+ dias+" \n\n" +
                "Sedado: "+ rbsedado+"\n\n" +
                "Informações Adicionais: \n" +
                "   "+informacoesAdd +
                "";
                String dados = nome +";"+idade +";"+hospital +";"+pupilas
                        +";"+Ao +";"+Mrv +";"+Mrm +";"+ sias+";"+dias+";"
                        +rbsedado +";"+informacoesAdd;
                addFile = new AddFile();
               addFile.writeFile(dados);

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




            public boolean enviarEmailImap() throws Exception {


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
                final Message msg = new MimeMessage(session);

                msg.setFrom(new InternetAddress("aplicativo.opo@gmail.com"));

                msg.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse("luisasilveirarosa@gmail.com"));


                MimeBodyPart anexo = new MimeBodyPart();
                FileDataSource source = new FileDataSource(Environment.getExternalStorageDirectory().getAbsolutePath() + "/Notificacao/notificacao.txt");
                anexo.setDataHandler(new DataHandler(source));
                anexo.setFileName("notificacao.txt");
                MimeBodyPart messagePart = new MimeBodyPart();
                messagePart.setContent(mensagem, "text/plain");
                Multipart multi = new MimeMultipart();
                multi.addBodyPart(messagePart);
                multi.addBodyPart(anexo);
                msg.setSubject("Notificacao Opo App");
                msg.setContent(multi);
                msg.setFlag(Flags.Flag.SEEN, true);

                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            Transport.send(msg);

                        } catch (MessagingException e) {
                            e.printStackTrace();
                        }
                    }
                }).start();

                return true;
            }
        }





