<?php

require_once realpath(dirname(__FILE__,2).'/config/config.php');

    class CategoriaModel{
        public static function ListarTodos(){
            $conexao =  Database:: getConection();

            $sql = "SELECT * FROM fornecedor"; // forma menos protegido
            $resultadoQuery = $conexao->query($sql) or die ("Erro ao listar todas as categorias.").mysql_error();

                if ($resultadoQuery){
                    return $resultadoQuery;
                }else{
                    return false;
                }

            //var_dump($resultadoQuery);
            //var_dump($conexao);
        }

        public function incluirCategoria($dados){
           var_dump($dados);
            $conexao =  Database:: getConection();

            $dadosDoBanco = $dados['razaoSocial'];
            $dadosFantasia = $dados['nomeFantasia'];
            $dadoscnpj = $dados['cnpj'];
            $dadosinscricao = $dados['inscricaoEstadual'];
            //endereco====
            $dadoscep = $dados['cep'];
            $dadoslogradouro= $dados['logradouro'];
            $dadosnumero = $dados['numero'];
            $dadosbairro = $dados['bairro'];
            $dadoscidade = $dados['cidade'];
            $dadosuf = $dados['uf'];
            $dadoscelular = $dados['celular'];
            $dadosfixo = $dados['telefoneFixo'];
            $dadosibge = $dados['ibge'];
           
            $comandoSQL = $conexao->prepare("INSERT INTO fornecedor (cnpj,razao_social,nome_fantasia,inscricao_estadual,celular_fornecedor,fixo_telefone) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");

            //Mescla o valor da variavel la no comando SQL Prepare onde você colocou a '?'
            $comandoSQL->bind_param('sssssssssssss',$dadosDoBanco,$dadosFantasia,$dadoscnpj,$dadoscep,$dadoslogradouro,
            $dadosnumero,$dadosbairro,$dadoscidade,$dadosuf,$dadoscelular,$dadosfixo,$dadosibge );// forma mais segura de fazer S= string, I= integer ...
            var_dump($comandoSQL);
            //Grava no banco
            $comandoSQL->execute();
            if($comandoSQL->affected_rows > 0){
                $id = mysqli_stmt_insert_id($comandoSQL);
                return $id;
            }else{
                return "Erro ao gravar no banco de dados";
            }
        }
        public function incluirCategoriaUpdate($dados){
            // var_dump($dados);
             $conexao =  Database:: getConection();
    
             $dadosDoBanco = $dados['razaoSocial'];
             $comandoSQL = $conexao->prepare("UPDATE fornecedor SET (razao_social) = WHERE (?) ");// para cada interroção é um campo do meu banco de dados
             
             //Mescla o valor da variavel la no comando SQL Prepare onde você colocou a '?'
             $comandoSQL->bind_param('s',$dadosDoBanco);// forma mais segura de fazer S= string, I= integer ...
    
             //Grava no banco
             $comandoSQL->execute();
             if($comandoSQL->affected_rows > 0){
                 $id = mysqli_stmt_insert_id($comandoSQL);
                 return $id;
             }else{
                 return "Erro ao gravar no banco de dados";
             }
         }
    }

    //Nas classes de model você cria esse IF que servirá como hub direcionando
    //um post ou get para uma determinada function
    if($_SERVER['REQUEST_METHOD'] == 'POST'){ // aqui é onde vai deccorer a chamada se houver um *request* POST
        $fornecedor = new CategoriaModel;

        $acao = isset($_POST['acao']);
        //var_dump($_POST);

        if($acao == "insert"){
          $fornecedor->incluirCategoria($_POST);  
        }else{
           $fornecedor->incluirCategoriaUpdate($_POST);
        }
    }
?>