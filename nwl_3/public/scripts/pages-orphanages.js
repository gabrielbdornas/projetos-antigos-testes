//Cria o mapa
const map = L.map('mapid').setView([-27.222633, -49.6455874], 15);

//Adiciona o mapa na tela
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

//criação do ícone para colocar no mapa
const icon = L.icon({
    iconUrl: "/images/map-marker.svg",
    iconSize: [58, 68],
    iconAnchor: [29, 68],
    popupAnchor: [170, 2]
})

//Criação do popup

const popup = L.popup({
    closeButton: false,
    className: 'map-popup',
    minWidth: 240,
    minHeight: 240
}).setContent(`Lar das meninas <a href="/orphanage?id=1" class="choose-orphanage"><img src="/images/arrow-white.svg" alt="Escolha esta instituição"/></a>`)

//cria popup - marcação em cima do mapa
L.marker([-27.222633, -49.6455874], { icon }).addTo(map)
    .bindPopup(popup)
