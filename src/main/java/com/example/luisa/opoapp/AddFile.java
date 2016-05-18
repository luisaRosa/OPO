package com.example.luisa.opoapp;

import android.os.Environment;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Luisa on 16/05/2016.
 */
public class AddFile {

    byte[] dados;
    String linha;
    File diretorio = new File(Environment.getExternalStorageDirectory().getAbsolutePath()+"/Notificacao");





   public void writeFile(String dado){

       if(!diretorio.exists()) {diretorio.mkdir();}
       File fileExt = new File(diretorio,"notificacao.txt" );
       FileOutputStream fos;
       linha = dado + ";";
       dados = linha.getBytes();
       try {
           fos = new FileOutputStream(fileExt);

           fos.write(dados);
           fos.flush();
           fos.close();

       } catch (FileNotFoundException e) {
           e.getMessage();
       }catch (IOException e) {
           e.getMessage();
       }


   }







}
