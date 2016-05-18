package br.ufac.bsi.es1.controleDeDoacoes.Logic;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.codec.Base64.OutputStream;

public class GeraPdf {

	public  void geraPdf(String titulo, String corpo, String nomeArquivo) {

		Document doc = null;

		FileOutputStream os = null;

		try {

			// cria o documento tamanho A4, margens de 2,54cm

			doc = new Document(PageSize.A4, 72, 72, 72, 72);

			// cria a stream de saída

			try {
				os = new FileOutputStream(nomeArquivo);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// associa a stream de saída ao

			try {
				PdfWriter.getInstance(doc, os);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// abre o documento

			doc.open();

			// adiciona o texto ao PDF

			Paragraph p = new Paragraph(titulo);
			Paragraph p1 = new Paragraph(corpo);

			try {
				doc.add(p);
				doc.add(p1);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} finally {

			if (doc != null) {

				// fechamento do documento

				doc.close();

			}

			if (os != null) {

				// fechamento da stream de saída

				try {
					os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}

	}
}
