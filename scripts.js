// scripts.js - Funcionalidades adicionales

document.addEventListener("DOMContentLoaded", function() {
    // Puedes agregar aquí más interactividad si lo deseas
    
    // Ejemplo: console.log amigable
    console.log("Revista Universitaria - Sitio cargado correctamente");
    
    // Si quieres que los enlaces de PDF se activen después de subir los archivos
    const pdfLinks = document.querySelectorAll('.btn-small');
    pdfLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            if (this.getAttribute('href') === '#') {
                e.preventDefault();
                alert('⚠️ Próximamente disponible. El PDF se agregará cuando esté listo.');
            }
        });
    });
});