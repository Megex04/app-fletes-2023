<h1 class="nombre-pagina">Panel de Administración</h1>

<?php 
    include_once __DIR__ . '/../templates/barra.php';
?>

<h2>Buscar Reservas</h2>
<div class="busqueda">
    <form class="formulario">
        <div class="campo">
            <label for="fecha">Fecha</label>
            <input 
                type="date"
                id="fecha"
                name="fecha"
                value="<?php echo $fecha; ?>"
            />
        </div>
    </form> 
</div>

<?php
    if(count($citas) === 0) {
        echo "<h2>No Hay reservas en esta fecha</h2>";
    }
?>

<div id="citas-admin">
    <ul class="citas">   
            <?php 
                $idCita = 0;
                foreach( $citas as $key => $cita ) {
   
                    if($idCita !== $cita->id) {
                        $total = 0;
                        $totalIgv = 0;
                    ?>
                    <li>
                            <p>ID: <span><?php echo $cita->id; ?></span></p>
                            <p>Hora: <span><?php echo $cita->hora; ?></span></p>
                            <p>Cliente: <span><?php echo $cita->cliente; ?></span></p>
                            <p>Email: <span><?php echo $cita->email; ?></span></p>
                            <p>Celular: <span><?php echo formatoCelular( $cita->telefono ); ?></span></p>

                            <h3>Servicios</h3>
                    <?php 
                        $idCita = $cita->id;
                        
                    } // Fin de IF 
                $igv = 0.18 * $cita->precio;
                $totalIgv += $igv;
                $total += $cita->precio + $igv;
                
            ?>
                    <p class="servicio"><?php echo $cita->servicio . " " . "<b>". validarPrecioAdmin( $cita->precio ) . "</b>"; ?></p>
            
            <?php 
                $actual = $cita->id;
                $proximo = $citas[$key + 1]->id ?? 0;

                if(esUltimo($actual, $proximo)) { ?>
                    <p class="total">IGV<em>(18%)</em> : <span>S/ <?php echo number_format($totalIgv, 2); ?></span></p>
                    <p class="total">Total: <span>S/ <?php echo number_format( $total, 2); ?></span></p>

                    <form action="/api/eliminar" method="POST">
                        <input type="hidden" name="id" value="<?php echo $cita->id; ?>">
                        <input type="submit" class="boton-eliminar" value="Quitar">
                    </form>

            <?php } 
          } // Fin de Foreach ?>
     </ul>
</div>

<?php
    $script = "<script src='/build/js/buscador.js'></script>"
?>