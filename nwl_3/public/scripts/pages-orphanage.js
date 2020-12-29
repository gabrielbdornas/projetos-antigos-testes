const options = {
    dragging: false,
    touchZoom: false,
    doubleClickZoom: false,
    scrollWheelZoom: false,
    zoomControl: false
}

//Cria o mapa
const map = L.map('mapid', options).setView([-27.222633, -49.6455874], 15);

//Adiciona o mapa na tela
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

//criação do ícone para colocar no mapa
const icon = L.icon({
    iconUrl: "/images/map-marker.svg",
    iconSize: [58, 68],
    iconAnchor: [29, 68],
    popupAnchor: [170, 2]
})

//cria popup - marcação em cima do mapa
L.marker([-27.222633, -49.6455874], { icon }).addTo(map)

//Função para troca de fotos
function selectImage(event){
    const button = event.currentTarget;

    //remover as classes ativas
    const buttons = document.querySelectorAll(".images button")
    buttons.forEach((button) => {
        button.classList.remove('active')
    });

    button.classList.add('active');
    const image = button.children[0];
    const imageContainer = document.querySelector(".orphanage-details > img")
    imageContainer.src = image.src

}
