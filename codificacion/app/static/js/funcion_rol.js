// Ya incluida
function abrirReporte(usuario) {
  document.getElementById('usuarioReporte').innerText = '@' + usuario;
  let modal = new bootstrap.Modal(document.getElementById('modalReporte'));
  modal.show();
}

// Bloquear usuario
function bloquearUsuario(usuario) {
  if (confirm(`¿Estás seguro de bloquear a @${usuario}? Esta acción es irreversible.`)) {
    alert(`@${usuario} ha sido bloqueado.`);
    // Aquí puedes enlazar a tu backend
  }
}

// Quitar publicación del feed
function quitarPublicacion(button) {
  if (confirm("¿Deseas quitar esta publicación del feed?")) {
    const card = button.closest('.col-md-6');
    card.remove();
  }
}

// NUEVO: Ver detalles de un reporte de perfil
function verDetalle(usuario) {
  // Esto puede ser reemplazado por un modal si deseas más estilo
  alert(`Detalles del reporte sobre @${usuario}:\n\nMotivo: Comportamiento inapropiado\nReportado por múltiples usuarios.`);
}

// NUEVO: Eliminar reporte del panel lateral
function eliminarReporte(button) {
  if (confirm("¿Estás seguro de eliminar este reporte?")) {
    const item = button.closest('li');
    item.remove();
  }
}
