function updateCounter(){
    fetch('<my api URL here>', {
        method: 'GET'
    })
    .then(res => res.json())
    .then(data => document.getElementById('thevisitor').innerText = data.body.Visit_Count)
}
