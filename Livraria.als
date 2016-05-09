module livraria

sig Livraria{
	funcionarios: set Funcionario,
	livros: set Livro,
	revistas: set Revista,
	clientes: set Cliente
}
abstract sig Funcionario{
	caixas: set Caixa,
	atendentes: set Atendente
}
sig Caixa extends Funcionario{}
sig Atendente extends Funcionario{}
sig Cliente{}
sig Pagamento{}

abstract sig Livro{}
sig LivroDidatico extends Livro{}
sig LivroNaoDidatico extends Livro{}
sig Ebook extends Livro{}
sig Revista{}

fact{
	#Livraria = 1
	#funcionarios = 5
	#atendentes = 3
	#caixas = 2

}


pred promocoes{}

pred show[]{}

run show for 5
