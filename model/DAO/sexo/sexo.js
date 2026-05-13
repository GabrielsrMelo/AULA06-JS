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

const insertSexo = async function(sexo) {

    try {
        let sql = `insert into tbl_sexo(
					  sigla
                      )
				values(
					  '${sexo}'
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

module.exports = {
    insertSexo
}