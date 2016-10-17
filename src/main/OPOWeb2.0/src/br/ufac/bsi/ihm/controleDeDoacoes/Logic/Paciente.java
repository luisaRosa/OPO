package br.ufac.bsi.ihm.controleDeDoacoes.Logic;



public class Paciente {

	private String nome;
	private long rgCT;
	private long cpf;
	private long cns;
	private int idade;
	private String dt_nascimento;
	private String dt_internacao;
	private String nomeMae;
	private String nomePai;
	private String religiao;
	private String doador;
	private Hospital hospital;
	private QuadroClinico quadroClinico;
	private Notificacao notificacao;
	private CausaMorte causaMorte;
	private MotivoNaoDoacao mNaoDoacao;
	private Endereco endereco;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public long getRgCT() {
		return rgCT;
	}

	public void setRgCT(long rgCT) {
		this.rgCT = rgCT;
	}

	public long getCpf() {
		return cpf;
	}

	public void setCpf(long cpf) {
		this.cpf = cpf;
	}

	public long getCns() {
		return cns;
	}

	public void setCns(long cns) {
		this.cns = cns;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getDt_nascimento() {
		return dt_nascimento;
	}

	public void setDt_nascimento(String dt_nascimento) {
		this.dt_nascimento = dt_nascimento;
	}

	public String getDt_internacao() {
		return dt_internacao;
	}

	public void setDt_internacao(String dt_internacao) {
		this.dt_internacao = dt_internacao;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public String getNomePai() {
		return nomePai;
	}

	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}

	public String getReligiao() {
		return religiao;
	}

	public void setReligiao(String religiao) {
		this.religiao = religiao;
	}

	public String getDoador() {
		return doador;
	}

	public void setDoador(String doador) {
		this.doador = doador;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public QuadroClinico getQuadroClinico() {
		return quadroClinico;
	}

	public void setQuadroClinico(QuadroClinico quadroClinico) {
		this.quadroClinico = quadroClinico;
	}

	public Notificacao getNotificacao() {
		return notificacao;
	}

	public void setNotificacao(Notificacao notificacao) {
		this.notificacao = notificacao;
	}

	public CausaMorte getCausaMorte() {
		return causaMorte;
	}

	public void setCausaMorte(CausaMorte causaMorte) {
		this.causaMorte = causaMorte;
	}

	public MotivoNaoDoacao getmNaoDoacao() {
		return mNaoDoacao;
	}

	public void setmNaoDoacao(MotivoNaoDoacao mNaoDoacao) {
		this.mNaoDoacao = mNaoDoacao;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

}
