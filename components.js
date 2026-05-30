// components.js - Header y footer compartidos con FontAwesome

function loadHeader() {
    return `
        <header class="site-header">
            <div class="container header-container">
                <div class="logo">
                    <a href="index.html">
                        <i class="fas fa-university logo-icon"></i>
                        <span class="logo-text">BT_Magazine</span>
                    </a>
                </div>
                <nav class="main-nav">
                    <ul>
                        <li><a href="index.html"><i class="fas fa-home"></i> Inicio</a></li>
                        <li><a href="acerca.html"><i class="fas fa-info-circle"></i> Acerca de</a></li>
                        <li><a href="autores.html"><i class="fas fa-feather-alt"></i> Autores</a></li>
                        <li><a href="archivos.html"><i class="fas fa-archive"></i> Archivos</a></li>
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
                    <p><i class="far fa-copyright"></i> ${new Date().getFullYear()} Revista Universitaria · Publicación sin ISSN/DOI · Solo circulación local</p>
                    <p><i class="fas fa-university"></i> Universidad · Facultad · Ciudad, País</p>
                </div>
                <div class="footer-contact">
                    <p><i class="fas fa-envelope"></i> revista@universidad.edu</p>
                    <p>
                        <i class="fab fa-instagram"></i> 
                        <i class="fab fa-twitter"></i> 
                        <i class="fab fa-facebook"></i> 
                        <i class="fab fa-linkedin"></i> Seguinos en redes sociales
                    </p>
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
        const linkHref = link.getAttribute("href").split("/").pop();
        if (linkHref === currentPage) {
            link.classList.add("active");
        } else if (currentPage === "index.html" && linkHref === "index.html") {
            link.classList.add("active");
        }
    });
});