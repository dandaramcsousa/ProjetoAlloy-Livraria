module livraria

sig Livraria{
	funcionarios: set Funcionario,
	livros: set Livro,
	revistas: set Revista,
	clientes: set Cliente
}
sig Funcionario{}
sig Cliente{}
sig Pagamento{}

abstract sig Livro{}
sig LivroDidatico extends Livro{}
sig LivroNaoDidatico extends Livro{}
sig Ebook extends Livro{}
sig Revista{}


pred promocoes{}

pred show[]{}

run show
