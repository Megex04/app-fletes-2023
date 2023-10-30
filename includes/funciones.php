<?php

function debuguear($variable) : string {
    echo "<pre>";
    var_dump($variable);
    echo "</pre>";
    exit;
}

// Escapa / Sanitizar el HTML
function s($html) : string {
    $s = htmlspecialchars($html);
    return $s;
}

function esUltimo(string $actual, string $proximo): bool {

    if($actual !== $proximo) {
        return true;
    }
    return false;
}

// Función que revisa que el usuario este autenticado
function isAuth() : void {
    if(!isset($_SESSION['login'])) {
        header('Location: /');
    }
}

function isAdmin() : void {
    if(!isset($_SESSION['admin'])) {
        header('Location: /');
    }
}

// Funcion que formatea un numero (9 digitos) a celular con "-"
function formatoCelular(string $celular) {
    $numeroFormateado = number_format($celular, 0, "-", "-");
    return $numeroFormateado;
}

function validarPrecioAdmin($precio) {
    if($precio != 0.0) {
        return $precio;
    } else {
        return '';
    }
}