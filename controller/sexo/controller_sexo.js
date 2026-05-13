/******************************************************************
 * Objetivo: arquivo responsável pela validação, tratamento e 
 *     manipulação de dados para o CRUD de sexo
 * Data: 13/05/2026
 * Autor: Gabriel Sousa 
 * versão: 1.0
 ******************************************************************/

//Import do aquivo de padronização de mensagens 
const config_message = require('../modulo/configMessages.js')

//Import do aquivo DAO para fazer o CRUD do filme no banco de dados
const sexoDAO = require('../../model/DAO/sexo/sexo.js')

const inserirSexo = async function (sexo, contentType) {

    try {
        //Criando um clone do objeto JSON para manipular a sua estrutura local sem 
        //modificar a estrutura original
        let message = JSON.parse(JSON.stringify(config_message))

        //Validação para o tipo de dados da requisição (Somente JSON)
        if (String(contentType).toUpperCase() == 'APPLICATION/JSON') {

            let validar = await validarDados(sexo)

            if(validar){
                return validar
            }else{

                let result = await sexoDAO.insertSexo(sexo)

                if(result){
                    //Criando o atributo ID no JSON do Filme e colocando 
                    //o ID gerado após o insert 
                    sexo.id = result


                    message.DEFAULT_MESSAGE.status = message.SUCESS_CREATED_ITEM.status
                    message.DEFAULT_MESSAGE.status_code = message.SUCESS_CREATED_ITEM.status_code
                    message.DEFAULT_MESSAGE.message = message.SUCESS_CREATED_ITEM.message
                    message.DEFAULT_MESSAGE.response = sexo
                } else { //500
                    return message.ERROR_INTERNAL_SERVER_MODEL //500
                }

                return message.DEFAULT_MESSAGE
            }
        } else {
            return message.ERRO_CONTENT_TYPE
        }
    } catch (error) {
        return message.ERROR_INTERNAL_SERVER_CONTROLLER //500 (Controller)
    }

}

const listarSexo = async function () {

        //Criando um clone do objeto JSON para manipular a sua estrutura local sem 
        //modificar a estrutura original
        let message = JSON.parse(JSON.stringify(config_message))
    
        try {
        
            let result = await sexoDAO.selectAllSexo()
    
            //Valida se o DAO conseguiu processar os dados
            if (result) {
                //Validação para verificar se existe conteúdo no array
                if (result.length > 0) {
                    message.DEFAULT_MESSAGE.status = message.SUCESS_RESPONSE.status
                    message.DEFAULT_MESSAGE.status_code = message.SUCESS_RESPONSE.status_code
                    message.DEFAULT_MESSAGE.response.count = result.length
                    message.DEFAULT_MESSAGE.response.sexo = result
    
                    return message.DEFAULT_MESSAGE //200 
                } else {
                    return message.ERROR_NOT_FOUND // 404 
                }
            } else {
                return message.ERROR_INTERNAL_SERVER_MODEL // 500 (model)
            }
        } catch (error) {
            return message.ERROR_INTERNAL_SERVER_CONTROLLER // 500 (controller)        
        }
    
}

const buscarSexo = async function (id) {

    //Criando um clone do objeto JSON para manipular a sua estrutura local sem 
    //modificar a estrutura original
    let message = JSON.parse(JSON.stringify(config_message))

    try {
        //Validação para garantir que o id seja válido
        if (id == undefined || id == '' || id == null ||  isNaN(id)) {
            message.ERROR_BAD_REQUEST.field = '[ID] INVÁLIDO'
            return message.ERROR_BAD_REQUEST // 400
        } else {
            let result = await sexoDAO.selectByIdSexo(id)

            if(result){
                if(result.length > 0){
                    message.DEFAULT_MESSAGE.status = message.SUCESS_RESPONSE.status
                    message.DEFAULT_MESSAGE.status_code = message.SUCESS_RESPONSE.status_code
                    message.DEFAULT_MESSAGE.response = result

                    return message.DEFAULT_MESSAGE //200
                }else{
                    return message.ERROR_NOT_FOUND // 404
                }
            }else{
                return message.ERROR_INTERNAL_SERVER_MODEL // 500 (Model)
            }
        }
    } catch (error) {
        return message.ERROR_INTERNAL_SERVER_CONTROLLER // 500

    }
}

const validarDados = async function (sexo) {
    //Criando um clone do objeto JSON para manipular a sua estrutura local sem 
    //modificar a estrutura original
    let message = JSON.parse(JSON.stringify(config_message))

    if(sexo.sigla == undefined || sexo.sigla == '' || sexo.sigla == null || sexo.sigla.length > 3){
        message.ERROR_BAD_REQUEST.field = '[SEXO] INVÁLIDO'
        return message.ERROR_BAD_REQUEST //400
    }else{
        return false
    }
}

module.exports = {
    inserirSexo,
    listarSexo,
    buscarSexo
}