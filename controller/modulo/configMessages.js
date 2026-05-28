/*************************************************************************
 * Objetivo: Arquivo responsável pela configuração e padronização das
 *     mensagens da API
 * Data: 17/04/2026
 * Autor: Gabriel Sousa
 * Versão: 1.0
 ************************************************************************/

//Padronização de cabeçalho para retorno dos endpoint da API
const DEFAULT_MESSAGE = {
    api_description : 'Api para gerenciar controle de filmes',
    development: 'Gabriel Sousa',
    version: '1.0.4.26',
    status: Boolean,
    status_code: Number,
    response: {}
}
//Mensagens de erro da API
const ERROR_BAD_REQUEST                = {status : false, status_code: 400, message: 'Os dados enviados na requisição não estão corretos.'}
const ERROR_INTERNAL_SERVER_MODEL      = {status : false, status_code: 500, message: 'Não foi possivel processar a requisição por conta de erro na API [ERRO NA MODELAGEM DE DADOS]'}
const ERROR_INTERNAL_SERVER_CONTROLLER = {status : false, status_code: 415, message: 'Não foi possivel processar a requisição por conta de erro na API [ERRO NA CONTROLLER]'}
const ERROR_CONTENT_TYPE               = {status : false, status_code: 415, message: 'Não foi possivel processar a requisição pois o tipo de dados não é JSON'}
const ERROR_NOT_FOUND                  = {status : false, status_code: 404, message: 'Não foi encontrado nenhum dado para retorno'}



//Mensagens de Sucesso da API
const SUCESS_CREATED_ITEM = {status: true, status_code: 201, message:'Registro inserido'}
//Retornos para GET 200
const SUCESS_RESPONSE     = {status: true, status_code: 200}
//Retornos para PUT 200
const SUCESS_UPDATED_ITEM = {status: true, status_code: 200, message: 'Registro atualizado com sucesso'}
//Retornos para DELETE (200 OU 202)
const SUCESS_DELETED_ITEM = {status: true, status_code: 200, message: 'Registro excluído com sucesso'}

const SUCESS_CREATED_ITEM_WARNIG = {status: true, status_code: 200, message: 'Os dados principais foram inseridos com sucesso, porem alguns dados aprecentaram problemas!'} 

module.exports = {
    DEFAULT_MESSAGE,
    ERROR_BAD_REQUEST,
    ERROR_INTERNAL_SERVER_MODEL,
    ERROR_INTERNAL_SERVER_CONTROLLER,
    ERROR_CONTENT_TYPE,
    ERROR_NOT_FOUND,
    SUCESS_CREATED_ITEM,
    SUCESS_UPDATED_ITEM,
    SUCESS_DELETED_ITEM,
    SUCESS_RESPONSE,
    SUCESS_CREATED_ITEM_WARNIG
}