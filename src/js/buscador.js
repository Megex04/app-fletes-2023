document.addEventListener('DOMContentLoaded', function() {
    iniciarApp();
});

function iniciarApp() {
    buscarPorFecha();
}

function buscarPorFecha() {
    const fechaInput = document.querySelector('#fecha');
    fechaInput.addEventListener('input', function(e) {
        const fechaSeleccionada = e.target.value;

        window.location = `?fecha=${fechaSeleccionada}`;
    });
}
function quitarCitaAdmin() {
    const botonQuitar = document.querySelector("#citas-admin .citas form .boton-eliminar");
    botonQuitar.addEventListener("click", function () {
        Swal.fire({
            icon: 'warning',
            title: '¿Quieres quitar esta reserva?',
            text: 'No podras recuperarla',
            //showCancelButton: true,
            confirmButtonColor: '#0090d8',
            confirmButtonText: 'Si, deseo quitarla',
            cancelButtonColor: '#cb0000',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
              quitarCitaDesdeJS();
            }
        }).then( () => {
            setTimeout(() => {
                
            }, 7000);
        })
    })
}
async function quitarCitaDesdeJS() {
    const { id } = cita;
    const url = `${location.origin}/api/eliminar`;
    const datos = new FormData();
    
    datos.append('id', id);
    // datos.append('confirmacion', true);

    const respuesta = await fetch(url, {
        method: 'POST',
        body: datos
    })

    const resultado = await respuesta.json();
    console.log(resultado);

    // .then((response) => {
    // // Manejar la respuesta del backend si es necesario
    //     console.log('Registro eliminado exitosamente');
    // }).catch((error) => {
    // // Manejar el error si ocurre
    //     console.error('Error al eliminar el registro', error);
    // });
}