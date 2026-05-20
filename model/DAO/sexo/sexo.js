/***********************************************************************************
 * Objetivo: Arquivo responsavel pelo CRUD no Banco de Dados MySQL na tabela sexo
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
const insertSexo = async function(sexo) {

    try {
        let sql = `insert into tbl_sexo(
					  sigla
                      )
				values(
					  '${sexo.sigla}'
                );`

        let result = await knexConex.raw(sql)

        if (result)
            return result[0].insertId
        else
            return false

    } catch(error) {
        // console.log(error)
        return false
    }
}

const updateSexo = async function (sexo) {
    try {
    //Script para atualizar os dados do BD
    let sql = `update tbl_sexo set 
                    sigla    ='${sexo.sigla}'
                    where id = ${sexo.id}`

    //Executa o sript SQL no BD
    let result = await knexConex.raw(sql)

    if(result)
        return true
    else 
        return false

    } catch (error){
        return false

    }
}

const selectAllSexo = async function () {
    try {
        //Script para retornar todos os sexos cadastrados
        let sql = `select * from tbl_sexo order by id desc`

        //Executa no banco de dados o script SQL para retornar os filmes 
        let result = await knexConex.raw(sql)

        //Validação para verificar se o retorno do BD é um Array
        //Se o scriptSQL der erro, o banco não devolve um array
        if(Array.isArray(result)){
            return result[0]
        }else{
            return false 
        }
    } catch (error) {
        return false
    }
}

const selectByIdSexo = async function (id) {
    try {
        let sql = `select * from tbl_sexo where id=${id}`

        let result = await knexConex.raw(sql)

        if(Array.isArray(result)){
            return result[0]
        }else{
            return false
        }
    }catch (error){
        return false
    }
}

const deleteSexo = async function (id) {
    try {

        let sql = `delete from tbl_sexo where id= ${id};`

        let result = await knexConex.raw(sql)

        if(result)
            return true
        else
            return false

        
    } catch (error) {
        return false
    }
}

module.exports = {
    insertSexo,
    selectAllSexo,
    selectByIdSexo,
    updateSexo,
    deleteSexo
}