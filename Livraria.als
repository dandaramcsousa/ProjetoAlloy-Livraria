-- Tema: Livraria
-- Alunos: Dandara Maria, Hugo Gabriel, Joao, Marcus Tenorio, Paulo Vinicius
module livraria

open util/ordering[Time]

--Assinaturas

sig Time{}

sig Livraria{
	funcionarios: set Funcionario,
	livros: set Livro,
	revistas: set Revista,
	clientes: set Cliente,

	livrosDisponiveis: set Livro -> Time,
	livrosVendidos: set Livro -> Time,
	revistasDisponiveis: set Revista -> Time,
	revistasVendidas: set Revista -> Time
}

abstract sig Funcionario{
	caixas: set Caixa,
	atendentes: set Atendente
}

sig Caixa extends Funcionario{}
sig Atendente extends Funcionario{}

sig Cliente{
	livrosComprados: set Livro -> Time,
	revistasCompradas: set Revista -> Time
}

abstract sig Pagamento{}
sig Dinheiro{}
sig Cartao{}

abstract sig Livro{}
sig LivroDidatico extends Livro{}
sig LivroNaoDidatico extends Livro{}
sig Ebook extends Livro{}
sig Revista{}

--Fatos
fact fatosDaLivraria{
	#Livraria = 1 -- No modelo so existe uma livraria
	#funcionarios = 5 -- A livraria tem exatamente 5 funcionarios
	#atendentes = 3 -- Dentres os funcionarios, 3 sao atendentes
	#caixas = 2 -- Os outros 2 funcionarios sao caixas
}

fact fatosDoCliente{}

--Funcoes
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

--Predicados
//pred init[t: Time]{
	//no (Livraria.clientes).t -- Nao existe clientes no tempo inicial
	//no (Livraria.livrosVendidos).t -- Nenhum livro foi vendido no tempo inicial
	//no (Livraria.revistasVendidas).t -- Nenhuma revista foi vendida no tempo inicial
//}
pred promocoes{}


-- Traces
--fact traces {
--	init [first]	
-- 	all pre: Time-last | let pos = pre.next |
			
--}

pred show[]{}

run show for 5
