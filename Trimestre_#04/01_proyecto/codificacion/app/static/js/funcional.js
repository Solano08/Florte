function enviarMensaje() {
  const input = document.getElementById("mensajeInput");
  const chatBox = document.getElementById("chatBox");
  const mensaje = input.value.trim();

  if (mensaje !== "") {
    const div = document.createElement("div");
    div.className = "message sent";
    div.textContent = mensaje;
    chatBox.appendChild(div);
    chatBox.scrollTop = chatBox.scrollHeight;
    input.value = "";
  }
}

// Esperar que cargue el documento
document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("mensajeInput").addEventListener("keypress", function (e) {
    if (e.key === "Enter") {
      enviarMensaje();
    }
  });
});

function enviarMensaje() {
  const input = document.getElementById("mensajeInput");
  const mensaje = input.value.trim();

  if (mensaje !== "") {
    // Añadir mensaje a la vista (opcional)
    const div = document.createElement("div");
    div.className = "message sent";
    div.textContent = mensaje;
    document.getElementById("chatBox").appendChild(div);
    input.value = "";

    // Enviar a Flask
    fetch("/enviar", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        id_canal: 1,              // Puedes cambiar este valor
        id_usuario: 3,            // Simulamos que escribe el usuario 3
        contenido: mensaje,
        media_url: null,          // Si no hay multimedia
        media_tipo: null
      })
    })
    .then(res => res.json())
    .then(data => console.log(data));
  }
}
