

// Imagem que passa

var slideIndex = 1;

showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {

    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {
        slideIndex = 1
    }
    if (n < 1) {
        slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block"
    dots[slideIndex - 1].className += " active"
}

// FIM Imagem que passa


function calcular_perda() {
    var Preço_salmao = Number(input_preco_salmao.value)
    var Quantidade_salmao = Number(input_qtd_salmao.value)
    var Quantidade_caminhao = Number(input_qtd_caminhao.value)
    var TotalSalmao = (Preço_salmao * Quantidade_salmao)
    var TotalQtd = (TotalSalmao * Quantidade_caminhao)
    var TotalPerda = (TotalQtd * 0.25)

    div_mensagem.innerHTML = `<br>De acordo com o IBGE, a falta de monitoramento de temperatura em veículos de distribuição de salmão,
pode causar perda de até <b>25%</b> na distribuição de salmão.
De acordo com a sua transportação, você está suscetível a perder <b>R$${TotalPerda} Reais</b>.<br>`
    div_mensagem.innerHTML += `<br>Nós podemos te ajudar a evitar essa perda.<br><a href="Home.html#row"><b>Entre em contato conosco.</b></a>`
}
