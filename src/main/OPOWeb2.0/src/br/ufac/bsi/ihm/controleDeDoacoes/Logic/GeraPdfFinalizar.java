package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class GeraPdfFinalizar {

	public void geraPdf(String titulo, String corpo, String nomeArquivo)
			throws MalformedURLException, IOException, DocumentException {

		Font fontPadrao = new Font(Font.FontFamily.HELVETICA, 10);

		Document doc = null;

		FileOutputStream os = null;

		try {

			// cria o documento tamanho A4, margens de 2,54cm

			doc = new Document(PageSize.A4, 72, 72, 72, 72);

			// cria a stream de saída

			try {
				os = new FileOutputStream("C:/Users/Luisa Rosa/Desktop/"+nomeArquivo);
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			}

			// associa a stream de saída ao

			try {
				PdfWriter.getInstance(doc, os);
			} catch (DocumentException e) {

				e.printStackTrace();
			}

			// abre o documento

			doc.open();

			// adiciona o texto ao PDF
			
			String[]dados = corpo.split(";");
			System.out.print(dados[0]+"," +dados[1]+","+ dados[3]);

			Image cabeçalho = Image
					.getInstance("C:/Users/Luisa Rosa/Dropbox/Faculdade/7º Período/Engenharia de Software II/logo.jpg");

			cabeçalho.scaleAbsolute(150, 70);
			cabeçalho.setAlignment(Image.ALIGN_CENTER);

			Paragraph p = new Paragraph(10);
			p.setAlignment(Element.ALIGN_CENTER);
			p.setSpacingBefore(10);
			p.add("Organização de Procura de Órgãos");
//
			PdfPTable table = new PdfPTable(3); // 3 columns.
			PdfPTable table1 = new PdfPTable(2);
			PdfPTable table2 = new PdfPTable(3);
			PdfPTable table3 = new PdfPTable(3);
			PdfPTable table4 = new PdfPTable(3);
			PdfPTable table5 = new PdfPTable(3);
			PdfPTable table6 = new PdfPTable(2);
			PdfPTable table7 = new PdfPTable(3);
			PdfPTable table8 = new PdfPTable(3);
			PdfPTable table9 = new PdfPTable(2);
			PdfPTable table10 = new PdfPTable(2);
			PdfPTable table11 = new PdfPTable(1);
//
			PdfPCell nome = new PdfPCell();
			nome.addElement(new Phrase("Nome: " + dados[0], fontPadrao));
			// nome.setBorder(Rectangle.NO_BORDER);

			PdfPCell idade = new PdfPCell();
			idade.addElement(new Phrase("Idade: "+ dados[1], fontPadrao));
			// idade.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell rgct = new PdfPCell();
			rgct.addElement(new Phrase("RG CT: "+ dados[2], fontPadrao));
			// rgct.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell cObito = new PdfPCell();
			cObito.addElement(new Phrase("Causa do Óbito: "+ dados[3], fontPadrao));
			// cObito.setBorder(Rectangle.NO_BORDER);

			PdfPCell hNotificador = new PdfPCell();
			hNotificador.addElement(new Phrase("Hospital Notificador: "+ dados[4], fontPadrao));
			// hNotificador.setBorder(Rectangle.NO_BORDER);

			PdfPCell endereco = new PdfPCell();
			endereco.addElement(new Phrase("Endereço: " +dados[5], fontPadrao));
			// endereco.setBorder(Rectangle.NO_BORDER);

			PdfPCell num = new PdfPCell();
			num.addElement(new Phrase("nº: "+ dados[6], fontPadrao));
			// num.setBorder(Rectangle.NO_BORDER);

			PdfPCell complemento = new PdfPCell();
			complemento.addElement(new Phrase("Complemento: " +dados[7], fontPadrao));
			// complemento.setBorder(Rectangle.NO_BORDER);

			PdfPCell bairro = new PdfPCell();
			bairro.addElement(new Phrase("Bairro: " + dados[8], fontPadrao));
			// bairro.setBorder(Rectangle.NO_BORDER);

			PdfPCell cep = new PdfPCell();
			cep.addElement(new Phrase("CEP: " + dados[9], fontPadrao));
			// cep.setBorder(Rectangle.NO_BORDER);

			PdfPCell cidade = new PdfPCell();
			cidade.addElement(new Phrase("Cidade: "+ dados[10], fontPadrao));
			// cidade.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell dtNascimento = new PdfPCell();
			dtNascimento.addElement(new Phrase("Data de Nascimento: " + dados[11], fontPadrao));
			// dtNascimento.setBorder(Rectangle.NO_BORDER);

			PdfPCell hospitalOrigem = new PdfPCell();
			hospitalOrigem.addElement(new Phrase("RH(Hospital de Origem): "+ dados[12], fontPadrao));
			// hospitalOrigem.setBorder(Rectangle.NO_BORDER);

			PdfPCell dtInternacao = new PdfPCell();
			dtInternacao.addElement(new Phrase("Data de Internação: "+ dados[13], fontPadrao));
			// dtInternacao.setBorder(Rectangle.NO_BORDER);

			PdfPCell rg = new PdfPCell();
			rg.addElement(new Phrase("Rg: " + dados[14], fontPadrao));
			// rg.setBorder(Rectangle.NO_BORDER);

			PdfPCell cpf = new PdfPCell();
			cpf.addElement(new Phrase("CPF: " + dados[15], fontPadrao));
			// cpf.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell cns = new PdfPCell();
			cns.addElement(new Phrase("CNS: " + dados[16], fontPadrao));
			// cns.setBorder(Rectangle.NO_BORDER);

			PdfPCell nomePai = new PdfPCell();
			nomePai.addElement(new Phrase("Nome do Pai: " + dados[17], fontPadrao));
			// nomePai.setBorder(Rectangle.NO_BORDER);

			PdfPCell nomeMae = new PdfPCell();
			nomeMae.addElement(new Paragraph("Nome da mãe: " + dados[18], fontPadrao));
			// nomeMae.setBorder(Rectangle.NO_BORDER);

			PdfPCell religiao = new PdfPCell();
			religiao.addElement(new Paragraph("Religião: " + dados[19], fontPadrao));
			// religiao.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell ME = new PdfPCell();
			ME.addElement(new Paragraph("Morte Encefálica: "+ dados[20], fontPadrao));
//			// ME.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell doador = new PdfPCell();
			doador.addElement(new Paragraph("Doador: "+ dados[22], fontPadrao));
//			// ME.setBorder(Rectangle.NO_BORDER);
//
			PdfPCell pcr = new PdfPCell();
			pcr.addElement(new Paragraph("PCR: " +dados[21], fontPadrao));
//			// pcr.setBorder(Rectangle.NO_BORDER);
//			
			PdfPCell pcrND = new PdfPCell();
			pcrND.addElement(new Paragraph("PCR: " +dados[30], fontPadrao));
			
//			// semCondicoesClinicas.setBorder(Rectangle.NO_BORDER);
			
			PdfPCell meND = new PdfPCell();
			meND.addElement(new Paragraph("ME: " +dados[20], fontPadrao));
			
			PdfPCell ND = new PdfPCell();
			ND.addElement(new Paragraph("Motivo da não doação: " +dados[29], fontPadrao));
			
			
//			
//					
			PdfPCell contatosFamiliares1 = new PdfPCell();
			contatosFamiliares1.addElement(new Paragraph("Nome: "+ dados[23], fontPadrao));
			contatosFamiliares1.addElement(new Paragraph("Parentesco: "+ dados[24], fontPadrao));
			contatosFamiliares1.addElement(new Paragraph("Telefone: "+ dados[25], fontPadrao));
////			// pcr.setBorder(Rectangle.NO_BORDER);
////			
			PdfPCell contatosFamiliares2 = new PdfPCell();
			contatosFamiliares2.addElement(new Paragraph("Nome: "+ dados[26], fontPadrao));
			contatosFamiliares2.addElement(new Paragraph("Parentesco: "+ dados[27], fontPadrao));
			contatosFamiliares2.addElement(new Paragraph("Telefone: "+ dados[28], fontPadrao));
//////
			table.addCell(nome);
			table.addCell(idade);
			table.addCell(rgct);
//
			table1.addCell(cObito);
			table1.addCell(hNotificador);

			table2.addCell(endereco);
			table2.addCell(num);
			table2.addCell(complemento);

			table3.addCell(bairro);
			table3.addCell(cep);
			table3.addCell(cidade);
//
			table4.addCell(dtNascimento);
			table4.addCell(hospitalOrigem);
			table4.addCell(dtInternacao);

			table5.addCell(rg);
			table5.addCell(cpf);
			table5.addCell(cns);

			table6.addCell(nomePai);
			table6.addCell(nomeMae);

			table7.addCell(religiao);
			table7.addCell(ME);
			table7.addCell(doador);

			table8.addCell("");
			table8.addCell(pcr);
			table8.addCell(doador);
//			
			table9.addCell(pcrND);
			table9.addCell(meND);

			table10.addCell(contatosFamiliares1);
			table10.addCell(contatosFamiliares2);
			
			table11.addCell(ND);
//			
//			
			float[] columnWidths = { 2, 1, 1 };

			table.setWidths(columnWidths);
			table.setSpacingBefore(50);
			table.setWidthPercentage(100);
//
			float[] columnWidths2 = { 1, 1 };
			table1.setWidths(columnWidths2);
			table1.setWidthPercentage(100);
			
			table9.setWidths(columnWidths2);
			table9.setWidthPercentage(100);
			table9.setSpacingBefore(5);
			
			table10.setWidths(columnWidths2);
			table10.setWidthPercentage(100);
			table10.setSpacingBefore(5);
////
			table6.setWidths(columnWidths2);
			table6.setWidthPercentage(100);
//
			float[] columnWidths3 = { 2.1f, 0.4f, 1 };
			table2.setWidths(columnWidths3);
			table2.setWidthPercentage(100);
//
			float[] columnWidths4 = { 1, 1, 1 };
			table3.setWidths(columnWidths4);
			table3.setWidthPercentage(100);
			table4.setWidths(columnWidths4);
			table4.setWidthPercentage(100);
			table5.setWidths(columnWidths4);
			table5.setWidthPercentage(100);
			table7.setWidths(columnWidths4);
			table7.setWidthPercentage(100);
			table8.setWidths(columnWidths4);
			table8.setWidthPercentage(100);
			
			table11.setWidthPercentage(100);
			

			try {
				doc.add(cabeçalho);
				doc.add(p);
				doc.add(table);
				doc.add(table1);
				doc.add(table2);
				doc.add(table3);
				doc.add(table4);
				doc.add(table5);
				doc.add(table6);
				doc.add(table7);
				doc.add(table8);
				doc.add(new Paragraph("SE NÃO DOADOR ", fontPadrao));
				doc.add(table9);
				doc.add(table11);
				doc.add(new Paragraph("CONTATOS FAMILIARES ", fontPadrao));				
				doc.add(table10);
;
			} catch (DocumentException e) {

				e.printStackTrace();
			}

		
				// fechamento do documento

				doc.close();

			

			if (os != null) {

				// fechamento da stream de saída

				try {
					os.close();
				} catch (IOException e) {

					e.printStackTrace();
				}

			}

		

		File file = new File("C:/Users/Luisa Rosa/Desktop/" + nomeArquivo);
		try {
			Desktop.getDesktop().open(file);
		} catch (IOException e) {

			e.printStackTrace();
		}

	

}finally {
	
}
	}
}
