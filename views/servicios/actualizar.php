<h1 class="nombre-pagina">Actualizar Servicio</h1>
<p class="descripcion-pagina">Modifica los valores del formulario</p>

<?php
    use Model\Servicio;
    include_once __DIR__ . '/../templates/barra.php';
    include_once __DIR__ . '/../templates/alertas.php';
?>

<form method="POST" class="formulario">
    <?php include_once __DIR__ . '/formulario.php'; ?>
    <input type="submit" class="boton <?php echo (!is_numeric($_GET['id']) || Servicio::find($_GET['id']) == null) ? 'oculto ' : ''; ?>" value="Actualizar">
</form>