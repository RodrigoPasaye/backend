<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "cmv";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);


//Consulta los datos de la cuenta de un cliente
if (isset($_GET["consultarCuenta"])){

    $sqlClientes = mysqli_query($conexionBD,"SELECT tbl_cmv_cliente.nombre, tbl_cmv_cliente.apellidoPaterno, tbl_cmv_cliente_cuenta.saldoActual, cat_cmv_tipo_cuenta.nombreCuenta FROM ((tbl_cmv_cliente INNER JOIN tbl_cmv_cliente_cuenta ON tbl_cmv_cliente.idCliente = tbl_cmv_cliente_cuenta.idCliente) INNER JOIN cat_cmv_tipo_cuenta ON tbl_cmv_cliente_cuenta.idCuenta = cat_cmv_tipo_cuenta.idCuenta) WHERE tbl_cmv_cliente.idCliente=".$_GET["consultarCuenta"]);
    
    if(mysqli_num_rows($sqlClientes) > 0){
        $clientes = mysqli_fetch_all($sqlClientes,MYSQLI_ASSOC);
        echo json_encode($clientes);
        exit();
    }
    else{  
        echo json_encode(["success"=>0]); 
    }
}


// Recepciona el identificador para consultar todos los datos del registro que correspondan con dicha clave
if (isset($_GET["consultar"])){

    $sqlClientes = mysqli_query($conexionBD,"SELECT nombre, apellidoPaterno, apellidoMaterno, rfc, curp FROM TBL_CMV_CLIENTE WHERE idCliente = ".$_GET["consultar"]);
    
    if(mysqli_num_rows($sqlClientes) > 0){
        $clientes = mysqli_fetch_all($sqlClientes,MYSQLI_ASSOC);
        echo json_encode($clientes);
        exit();
    }
    else{  
        echo json_encode(["success"=>0]); 
    }
}

// Borra los datos del registro que concuerden con el identificador que se le mande 
if (isset($_GET["borrar"])){

    $sqlClientes = mysqli_query($conexionBD,"DELETE FROM TBL_CMV_CLIENTE WHERE idCliente = ".$_GET["borrar"]);

    if($sqlClientes){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  
        echo json_encode(["success"=>0]); 
    }
}

//Guarda un nuevo registro y recepciona en el método post los datos del cliente
if(isset($_GET["insertar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $nombre = $data->nombre;
    $apellidoPaterno = $data->apellidoPaterno;
    $apellidoMaterno = $data->apellidoMaterno;
    $rfc = $data->rfc;
    $curp = $data->curp;

    if(($nombre != "") && ($apellidoPaterno != "") && ($apellidoMaterno != "") && ($rfc != "") && ($curp != "")){
            
        $sqlClientes = mysqli_query($conexionBD,"INSERT INTO TBL_CMV_CLIENTE (nombre, apellidoPaterno, apellidoMaterno, rfc, curp) VALUES ('$nombre', '$apellidoPaterno', '$apellidoMaterno', '$rfc', '$curp') ");
        echo json_encode(["success"=>1]);
    }
    exit();
}

// Actualiza los datos pero necesita recepcionar los datos del cliente y su identificador para realizar la actualización
if(isset($_GET["actualizar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $id=(isset($data->id))?$data->id:$_GET["actualizar"];

    $nombre = $data->nombre;
    $apellidoPaterno = $data->apellidoPaterno;
    $apellidoMaterno = $data->apellidoMaterno;
    $rfc = $data->rfc;
    $curp = $data->curp;
    
    
    $sqlClientes = mysqli_query($conexionBD,"UPDATE TBL_CMV_CLIENTE SET nombre='$nombre', apellidoPaterno='$apellidoPaterno', apellidoMaterno='$apellidoMaterno', rfc='$rfc', curp='$curp' WHERE idCliente='$id'");
    echo json_encode(["success"=>1]);
    exit();
}

// Consulta todos los registros de la tabla clientes
$sqlClientes = mysqli_query($conexionBD,"SELECT * FROM TBL_CMV_CLIENTE");

if(mysqli_num_rows($sqlClientes) > 0){
    $clientes = mysqli_fetch_all($sqlClientes,MYSQLI_ASSOC);
    echo json_encode($clientes);
}
else{ 
    echo json_encode([["success"=>0]]); 
}

?>