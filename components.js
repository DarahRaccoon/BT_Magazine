// components.js - Header y footer compartidos

function loadHeader() {
    return `
        <header class="site-header">
            <div class="container header-container">
                <div class="logo">
                    <a href="index.html">
                        <span class="logo-icon">📖</span>
                        <span class="logo-text">Revista Uni</span>
                    </a>
                </div>
                <nav class="main-nav">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="acerca.html">Acerca de</a></li>
                        <li><a href="autores.html">Autores</a></li>
                        <li><a href="archivos.html">Archivos</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    `;
}

function loadFooter() {
    return `
        <footer class="site-footer">
            <div class="container footer-container">
                <div class="footer-info">
                    <p>© ${new Date().getFullYear()} Revista Universitaria · Publicación sin ISSN/DOI · Solo circulación local</p>
                    <p>Universidad · Facultad · Ciudad, País</p>
                </div>
                <div class="footer-contact">
                    <p>📧 revista@universidad.edu</p>
                    <p>📱 Seguinos en redes sociales</p>
                </div>
            </div>
        </footer>
    `;
}

// Insertar header y footer cuando el DOM esté listo
document.addEventListener("DOMContentLoaded", function() {
    const headerPlaceholder = document.getElementById("header");
    const footerPlaceholder = document.getElementById("footer");
    
    if (headerPlaceholder) {
        headerPlaceholder.innerHTML = loadHeader();
    }
    if (footerPlaceholder) {
        footerPlaceholder.innerHTML = loadFooter();
    }
    
    // Destacar página activa en el menú
    const currentPage = window.location.pathname.split("/").pop() || "index.html";
    const links = document.querySelectorAll(".main-nav a");
    links.forEach(link => {
        const linkHref = link.getAttribute("href");
        if (linkHref === currentPage) {
            link.classList.add("active");
        } else if (currentPage === "index.html" && linkHref === "index.html") {
            link.classList.add("active");
        }
    });
});