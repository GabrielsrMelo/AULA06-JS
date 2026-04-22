/***********************************************************************************
 * Objetivo: Arquivo responsavel pelo CRUD no Banco de Dados MySQL na tabela filme
 * Data: 15/04/2026
 * Autor: Gabriel Sousa
 * Versão: 1.0
 ***********************************************************************************/

// Import da biblioteca para gerenciar o banco de dados MySQL no node.JS
const knex = require('knex')

// Import do arquivo de configuração para conexão do BD MySQL
const knexConfig = require('../../database_config_knex/KnexFile.js')

// Criar a conexão com o BD MySQL
const knexConex = knex(knexConfig.development)

// Função para inserir dados na tabela de filme 
const insertFilme = async function (filme) {
    try {
        let sql = `insert into tbl_filme (
                            nome,
                            data_lancamento,
                            duracao, 
                            sinopse,
                            avaliacao, 
                            valor,
                            capa
                            )
                    values (
                            '${filme.nome}', 
                            '${filme.data_lancamento}', 
                            '${filme.duracao}', 
                            '${filme.sinopse}', 
                            if('${filme.avaliacao}' = '', null, '${filme.avaliacao}'),
                            '${filme.valor}',
                            '${filme.capa}'
        );`

        //executar o ScriptSQL no banco de dados
        let result = await knexConex.raw(sql)

        if (result)
            return true
        else
            return false
    } catch(error) {
        // console.log(error)
        return false
    }
}

// Função para atualizar um filme existente na tabela 
const updateFilme = async function (filme) {

}

// Função para retornar todos os dados da tabela de filme 
const selectAllFilme = async function () {

}

// Função para retornar os dados do filme filtrando pelo ID
const selectByIdFilme = async function (id) {

}

// Função para excluir um filme pelo ID
const deleteFilme = async function (id) {

}


module.exports = {
    insertFilme,
    updateFilme,
    selectAllFilme,
    selectByIdFilme,
    deleteFilme
}