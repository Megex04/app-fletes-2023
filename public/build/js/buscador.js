function iniciarApp(){buscarPorFecha()}function buscarPorFecha(){document.querySelector("#fecha").addEventListener("input",(function(t){const e=t.target.value;window.location="?fecha="+e}))}function quitarCitaAdmin(){document.querySelector("#citas-admin .citas form .boton-eliminar").addEventListener("click",(function(){Swal.fire({icon:"warning",title:"¿Quieres quitar esta reserva?",text:"No podras recuperarla",confirmButtonColor:"#0090d8",confirmButtonText:"Si, deseo quitarla",cancelButtonColor:"#cb0000",cancelButtonText:"Cancelar"}).then(t=>{t.isConfirmed&&quitarCitaDesdeJS()}).then(()=>{setTimeout(()=>{},7e3)})}))}async function quitarCitaDesdeJS(){const{id:t}=cita,e=location.origin+"/api/eliminar",n=new FormData;n.append("id",t);const i=await fetch(e,{method:"POST",body:n}),a=await i.json();console.log(a)}document.addEventListener("DOMContentLoaded",(function(){iniciarApp()}));