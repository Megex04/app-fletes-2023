<h1 class="nombre-pagina">Crear Nueva Reserva</h1>
<p class="descripcion-pagina">Elige tus servicios y coloca tus datos</p>

<?php 
    include_once __DIR__ . '/../templates/barra.php';
?>

<div id="app">
    <nav class="tabs">
        <button class="actual" type="button" data-paso="1">Tipo carga</button>
        <button type="button" data-paso="2">Destinos</button>
        <button type="button" data-paso="3">Información reserva</button>
        <button type="button" data-paso="4">Resumen</button>
    </nav>

    <div id="paso-1" class="seccion">
        <h2>Reservas Carga</h2>
        <p class="text-center">Elige tu contenido de carga a continuación <em>(opcional)</em></p>
        <div id="servicios" class="listado-servicios"></div>
    </div>
    <div id="paso-2" class="seccion">
        <h2>Reserva destino</h2>
        <p class="text-center">Elige tus servicios a continuación <em>(no incluye IGV 18% por c/u)</em></p>
        <p class="text-center"><em>*precio estimado, sujeto a cambios</em></p>
        <div id="servicios2" class="listado-servicios"></div>
    </div>
    <div id="paso-3" class="seccion">
        <h2>Tus Datos y Reserva</h2>
        <p class="text-center">Coloca tus datos y fecha de tu reserva</p>

        <form class="formulario">
            <div class="campo">
                <label for="nombre">Nombre</label>
                <input
                    id="nombre"
                    type="text"
                    placeholder="Tu Nombre"
                    value="<?php echo $nombre; ?>"
                    disabled
                />
            </div>

            <div class="campo">
                <label for="fecha">Fecha</label>
                <input
                    id="fecha"
                    type="date"
                    min="<?php echo date('Y-m-d', strtotime('+1 day') ); ?>"
                />
            </div>

            <div class="campo">
                <label for="hora">Hora</label>
                <input
                    id="hora"
                    type="time"
                />
            </div>
            <input type="hidden" id="id" value="<?php echo $id; ?>" >

        </form>
    </div>
    <div id="paso-4" class="seccion contenido-resumen">
        <h2>Resumen</h2>
        <p class="text-center">Verifica que la información sea correcta</p>
    </div>

    <div class="paginacion">
        <button 
            id="anterior"
            class="boton"
        >&laquo; Anterior</button>

        <button 
            id="siguiente"
            class="boton"
        >Siguiente &raquo;</button>
    </div>
</div>

<?php 
    $script = "
        <script src='//cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        <script src='/build/js/app.js'></script>
    ";
?>