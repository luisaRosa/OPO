package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

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

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;

public class GeraPdfEvolucao {
	
	public void geraPdf(String corpo, String nomeArquivo, Conexao conexao)
			throws MalformedURLException, IOException, DocumentException {

		Font fontPadrao = new Font(Font.FontFamily.HELVETICA, 10);
		Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD);
		Paciente paciente;
		PacienteLogic pacienteLogic = new PacienteLogic();
		EvolucaoPacienteLogic evolucaoPacienteLogic= new EvolucaoPacienteLogic();
				
		pacienteLogic.setConexao(conexao);
		evolucaoPacienteLogic.setConexao(conexao);
		
		

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
			try {
				paciente = pacienteLogic.getPaciente(dados[0]);
				
				List<EvolucaoPaciente> evolucoes = evolucaoPacienteLogic.getEvolucoes();
				
			

			Image cabeçalho = Image
					.getInstance("C:/Users/Luisa Rosa/Dropbox/Faculdade/7º Período/Engenharia de Software II/logo.jpg");

			cabeçalho.scaleAbsolute(150, 70);
			cabeçalho.setAlignment(Image.ALIGN_CENTER);

			Paragraph p = new Paragraph(10);
			p.setAlignment(Element.ALIGN_CENTER);
			p.setSpacingBefore(10);
			p.add("Evolução do Paciente");
			
			
			PdfPTable table1 = new PdfPTable(2);
			PdfPTable table2 = new PdfPTable(2);
			PdfPTable table3 = new PdfPTable(4);
			PdfPTable tableP = new PdfPTable(4);
			PdfPTable tableE = new PdfPTable(4);
			
			PdfPCell nome = new PdfPCell();
			nome.addElement(new Phrase("Nome: " + dados[0], fontPadrao));
			
			PdfPCell idade = new PdfPCell();
			idade.addElement(new Phrase("Idade: "+ dados[1], fontPadrao));
			
			PdfPCell hospital = new PdfPCell();
			hospital.addElement(new Phrase("Hospital Notificador: "+ dados[2], fontPadrao));
			
			PdfPCell dtNotificacao = new PdfPCell();
			dtNotificacao.addElement(new Phrase("Data de notificação: "+ dados[3], fontPadrao));
			
			PdfPCell autor = new PdfPCell();
			autor.addElement(new Phrase("         Autor", fontTitulo));
			autor.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			
			PdfPCell data = new PdfPCell();
			data.addElement(new Phrase("      Data", fontTitulo));
			data.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			
			PdfPCell horario = new PdfPCell();
			horario.addElement(new Phrase("    Horário", fontTitulo));
			horario.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			
			PdfPCell evolucao = new PdfPCell();
			evolucao.addElement(new Phrase("                                   Evolução", fontTitulo));
			evolucao.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			
			
			
			table1.addCell(nome);
			table1.addCell(idade);
			table2.addCell(hospital);
			table2.addCell(dtNotificacao);
			table3.addCell(autor);
			table3.addCell(data);
			table3.addCell(horario);
			table3.addCell(evolucao);
			tableP.addCell(new Phrase(paciente.getNotificacao().getUsuario().getNome(),fontPadrao));
			tableP.addCell(new Phrase(paciente.getNotificacao().getDtNotificacao(), fontPadrao));
			tableP.addCell(new Phrase(paciente.getNotificacao().getHoraNotificacao(), fontPadrao));
			tableP.addCell(new Phrase(paciente.getQuadroClinico().getInformacoesAdd(), fontPadrao));
			
			
			
			

			float[] columnWidths = {2,1 };

			table1.setWidths(columnWidths);
			table1.setSpacingBefore(50);
			table1.setWidthPercentage(100);
			
			table2.setWidths(columnWidths);
			table2.setWidthPercentage(100);
			
			float[] columnWidths1 = {1.5f,1,1,4};
			
			table3.setWidths(columnWidths1);
			table3.setWidthPercentage(100);
			table3.setSpacingBefore(10);;
			
			tableP.setWidths(columnWidths1);
			tableP.setWidthPercentage(100);
			
			tableE.setWidths(columnWidths1);
			tableE.setWidthPercentage(100);
			try{
			doc.add(cabeçalho);
			doc.add(p);
			doc.add(table1);
			doc.add(table2);
			doc.add(table3);
			doc.add(tableP);
			for(EvolucaoPaciente evolucaoP: evolucoes){
				if (evolucaoP.getPaciente().getNome().equals(paciente.getNome())){
					
					autor.setPhrase(new Phrase(evolucaoP.getUsuarioSistema().getNome(), fontPadrao));
					data.setPhrase(new Phrase(evolucaoP.getDataEvolucao(),  fontPadrao));
					horario.setPhrase(new Phrase(evolucaoP.getHoraEvolucao(), fontPadrao));
					evolucao.setPhrase(new Phrase(evolucaoP.getEvolucaoPaciente(), fontPadrao));
					
					
					tableE.addCell(autor);
					tableE.addCell(data);
					tableE.addCell(horario);
					tableE.addCell(evolucao);
					
					doc.add(tableE);
					
				}
				
				
				
			}
			
			}catch(DocumentException e){
				e.printStackTrace();
			}
			
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			File file = new File("C:/Users/Luisa Rosa/Desktop/" + nomeArquivo);
			try {
				Desktop.getDesktop().open(file);
			} catch (IOException e) {

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

					e.printStackTrace();
				}

			}

		}

}
	}
