-- Tema: Livraria
-- Alunos: Dandara Maria, Hugo Gabriel, Joao Targino, Marcus Tenorio, Paulo Vinicius
module livraria

open util/ordering[Time]

//--Assinaturas

sig Time{}

-- Definicao da Livraria e seus atributos --
sig Livraria{
	funcionarios: set Funcionario,
	livros: set Livro,
	revistas: set Revista,
	clientes: set Cliente -> Time,

	livrosDisponiveis: set Livro -> Time,
	livrosVendidos: set Livro -> Time,
	revistasDisponiveis: set Revista -> Time,
	revistasVendidas: set Revista -> Time
}

-- Definicao de Funcionarios e suas subclasses --
abstract sig Funcionario{}

sig Caixa extends Funcionario{}
sig Atendente extends Funcionario{}

------------------------------------------------------------------------------

-- Definicao de Cliente -- 

sig Cliente{
	livrosComprados: set Livro -> Time,
	revistasCompradas: set Revista -> Time,
	cartaoFidelidade: lone CartaoFidelidade 
}
-------------------------------------------------------

-- Definicao dos tipos de pagamento -- 
abstract sig Pagamento{}
sig Dinheiro{}
sig Cartao{}
------------------------------------------------------------

-- Definicao dos tipos de livro --
abstract sig Livro{}
sig LivroDidatico extends Livro{}
sig LivroNaoDidatico extends Livro{}
sig Ebook extends Livro{}
sig Revista{}
-------------------------------------------------------------

-- Definicao do cartao fidelidade --
sig CartaoFidelidade {}


//--Fatos
fact fatosDaLivraria{
	#Livraria = 1 -- No modelo so existe uma livraria
	#funcionarios = 5 -- A livraria tem exatamente 5 funcionarios
	#Atendente = 3 -- Dentres os funcionarios, 3 sao atendentes
	#Caixa = 2 -- Os outros 2 funcionarios sao caixas
}

fact fatosDoCliente{
	all t:Time|  clientePertenceALivraria[t]
}

pred clientePertenceALivraria[t: Time] { -- Todo cliente esta associado a uma livraria.
	all cli:Cliente,liv:Livraria | cli in liv.clientes.t
}

//-- Funcoes --//
fun livrosNaLivraria[liv: Livraria]: Livro -> Time{
	liv.livrosDisponiveis
}

fun revistasNaLivraria[liv: Livraria]: Revista -> Time{
	liv.revistasDisponiveis
}

fun livrosDoCliente[cli: Cliente, t: Time]: set Livro{
	cli.livrosComprados.t
}

fun revistasDoCliente[cli: Cliente, t: Time]: set Revista{
	cli.revistasCompradas.t
}

pred vendaLivro[c: Cliente, l: Livro, t, t': Time] {
	l in Livraria.livrosDisponiveis.t => Livraria.livrosDisponiveis.t' = Livraria.livrosDisponiveis.t - l

}

-- Predicados --
pred init[t: Time]{
	no (Livraria.clientes).t -- Nao existe clientes no tempo inicial
	no (Livraria.livrosVendidos).t -- Nenhum livro foi vendido no tempo inicial
	no (Livraria.revistasVendidas).t -- Nenhuma revista foi vendida no tempo inicial
}

pred promocoes{}


-- Traces --
--fact traces {

--init [first]	
-- all pre: Time-last | let pos = pre.next

--}

pred show[]{}

run show for 5
