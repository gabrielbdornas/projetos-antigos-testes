//Cria o mapa
const map = L.map('mapid').setView([-27.222633, -49.6455874], 15);

//Adiciona o mapa na tela
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

//criação do ícone para colocar no mapa
const icon = L.icon({
    iconUrl: "/images/map-marker.svg",
    iconSize: [58, 68],
    iconAnchor: [29, 68],

})

let marker;

//criando marker
map.on('click', (event) => {
    const lat = event.latlng.lat;
    const lng = event.latlng.lng;

    document.querySelector('[name=lat]').value = lat;
    document.querySelector('[name=lng]').value = lng;

    //limpar as selecoes antigas

    marker && map.removeLayer(marker)

    //adicionando layer
    marker = L.marker([lat, lng], { icon }).addTo(map)
})

function addPhotoField() {
    //pegar o container de fotos #images
    const container = document.querySelector('#images')
    //pegar o container para duplicar o .new-image
    const fieldsContainer = document.querySelectorAll('.new-upload')
    //realizar o clone da última imagem adicionada
    const newFildContainer = fieldsContainer[fieldsContainer.length - 1].cloneNode(true)
    //limpar o campo antes de adicionar ao container de images
    const input = newFildContainer.children[0]
    if (input.value == '') {
        return
    } else {
       //atualiza o placeholder
       newFildContainer.querySelector('input').placeholder = 'Cole o link da foto aqui' 
       //atualiza o value
       newFildContainer.querySelector('input').value = ''
       //adicionar o clone ao conteiner de #imagens
        container.appendChild(newFildContainer)
    }
}

function deleteField(event) {
    const span = event.currentTarget
    const fieldsContainer = document.querySelectorAll('.new-upload')

    if(fieldsContainer.length < 2) {
        span.parentNode.children[0].value = ''
    } else {
        span.parentNode.remove()
    }
}

function toggleSelect(event) {
    //retirar a classe active
    document.querySelectorAll('.button-select button')
    .forEach( function(button) { button.classList.remove('active') })

    //colocar a active class no botão indicado
    const button = event.currentTarget
    button.classList.add('active')

    //atualizar o input hiden com o valor selecionado
    const input = document.querySelector('[name="open_on_weekends"]')
    input.value = button.dataset.value
    console.log(input.value)
}
