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

public class GerarPdfAtividades {
	
	public void geraPdf(String corpo, String nomeArquivo, Conexao conexao)
			throws MalformedURLException, IOException, DocumentException {
		Font fontPadrao = new Font(Font.FontFamily.HELVETICA, 10);
		Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD);
		RegistroAtividades registro;
		RegistroAtividadesLogic regsitroLogic = new RegistroAtividadesLogic();
		AtividadeLogic atividadeLogic= new AtividadeLogic();
				
		regsitroLogic.setConexao(conexao);
		atividadeLogic.setConexao(conexao);
		
		

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
				registro= regsitroLogic.getAtividades(Integer.parseInt(dados[0]));
				
				List<Atividade> atividades = atividadeLogic.getAtividades();
				PdfPTable table1 = new PdfPTable(2);
				PdfPTable table2 = new PdfPTable(2);
				PdfPTable table3 = new PdfPTable(4);
				
				
				for(Atividade atividade1 : atividades){
					if(atividade1.getRegistro().getId() == registro.getId()){
						
						PdfPCell id = new PdfPCell(new Phrase(String.valueOf(atividade1.getId()), fontPadrao));
						PdfPCell atividade = new PdfPCell(new Phrase(atividade1.getAtividade(), fontPadrao));
						PdfPCell quantidade = new PdfPCell(new Phrase(String.valueOf(atividade1.getQuantidade()), fontPadrao));
						PdfPCell hospital = new PdfPCell(new Phrase(atividade1.getLocal(), fontPadrao));
						PdfPCell evolucao = new PdfPCell(new Phrase(atividade1.getAtividade(), fontPadrao));
						
						table1.addCell(id);
						table1.addCell(atividade);
				        table2.addCell(hospital);
				        table2.addCell(quantidade);
				        table2.addCell (evolucao)
	;					
					}
					
					
					}
				
				

			}catch (Exception e) {
				// TODO: handle exception
			}
			
		}finally {
			
		}
	}
}
			
			
			

			
			


	
			


	
			
