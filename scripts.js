// scripts.js - Funcionalidades dinámicas con FontAwesome (usando JPG para previews)

document.addEventListener("DOMContentLoaded", function() {
    console.log("Revista Universitaria - Sitio cargado correctamente");
    
    // Cargar revistas si estamos en la página de archivos
    if (document.getElementById("revistas-container")) {
        cargarRevistas();
    }
});

// Función para cargar revistas desde data.js
function cargarRevistas() {
    const container = document.getElementById("revistas-container");
    if (!container) return;
    
    // Agrupar revistas por año
    const revistasPorAño = {};
    revistas.forEach(revista => {
        if (!revistasPorAño[revista.año]) {
            revistasPorAño[revista.año] = [];
        }
        revistasPorAño[revista.año].push(revista);
    });
    
    // Ordenar años descendente
    const añosOrdenados = Object.keys(revistasPorAño).sort((a, b) => b - a);
    
    // Generar HTML
    let html = '';
    
    añosOrdenados.forEach(año => {
        html += `<div class="year-section">
                    <h2><i class="fas fa-calendar-alt"></i> ${año}</h2>
                    <div class="volumes-grid">`;
        
        revistasPorAño[año].sort((a, b) => {
            if (a.volumen !== b.volumen) return a.volumen - b.volumen;
            return a.numero - b.numero;
        });
        
        revistasPorAño[año].forEach(revista => {
            const pdfHref = revista.disponible ? revista.pdfPath : "#";
            const disponible = revista.disponible;
            
            // Determinar si tiene imagen de portada
            const tienePortada = revista.portada && revista.portada !== "#" && revista.portada !== "";
            
            html += `<div class="volume-card" data-id="${revista.id}" data-pdf="${pdfHref}" data-disponible="${disponible}">
                        <div class="volume-preview">
                            ${tienePortada ? 
                                `<img src="${revista.portada}" alt="Portada Vol.${revista.volumen} No.${revista.numero}" class="preview-image" 
                                    onerror="this.onerror=null; this.src='https://via.placeholder.com/300x318/1e3c72/ffffff?text=Portada+No+Disponible';">` : 
                                `<div class="preview-placeholder">
                                    <i class="fas fa-book-open"></i>
                                    <span>Vol. ${revista.volumen} - No. ${revista.numero}</span>
                                </div>`
                            }
                        </div>
                        <div class="volume-info">
                            <div class="volume-number">
                                <i class="fas fa-book"></i> Vol. ${revista.volumen}, Núm. ${revista.numero}
                            </div>
                            <div class="volume-title">${revista.titulo || ''}</div>
                            <div class="volume-meta">
                                <span><i class="fas fa-calendar-day"></i> ${revista.periodo} ${revista.año}</span>
                            </div>
                            <div class="volume-description">
                                <i class="fas fa-align-left"></i> ${revista.descripcion}
                            </div>
                        </div>
                    </div>`;
        });
        
        html += `</div></div>`;
    });
    
    container.innerHTML = html;
    
    // Agregar evento de click a todas las tarjetas
    document.querySelectorAll('.volume-card').forEach(card => {
        card.addEventListener('click', function(e) {
            // Evitar que el click se propague si se hizo en un enlace interno (por si acaso)
            if (e.target.closest('a')) return;
            
            const disponible = this.dataset.disponible === 'true';
            const pdfUrl = this.dataset.pdf;
            
            if (disponible && pdfUrl && pdfUrl !== '#') {
                window.open(pdfUrl, '_blank');
            } else {
                alert('📢 Esta publicación estará disponible próximamente.');
            }
        });
    });
}