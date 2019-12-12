<?php
    require_once realpath(dirname(__FILE__).'/src/models/LoginModel.php');
    session_start(); //Obrigatorio abrir um start
    //session_destroy();
    LoginModel::verificaSeLogado();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sparrow Events | Home</title>
    <?php require_once("dist/css/css.php"); ?>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <?php require_once("layout/navbar.php"); ?>
        <?php require_once("layout/mainSideBar.php"); ?>

        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Sparrow Events</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container-fluid">
                   
             
                </div>
            </div>
        </div>


        <?php require_once("layout/controlSideBar.php"); ?>
        <?php require_once("layout/footer.php"); ?>
    </div>

    <?php require_once("dist/js/javascript.php");?>
</body>

</html>