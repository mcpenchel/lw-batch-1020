// var, let, const
// var não é para usar, é pré ES6
//
// let é para declarar variáveis que poderemos sobrescrever no futuro
// const é para declarar variáveis que não podem ser sobrescritas

// CSS Selectors
document.querySelector('#o_id');
document.querySelector('.a_classe');
document.querySelector('div');
document.querySelector('div > .tal_classe > #o_id');
// document.querySelector retorna o PRIMEIRO elemento que bate com o seu critério de BUSCA

const firstDiv = document.querySelectorAll('div')[0];
// document.querySelectorAll retorna uma NodeList, que funciona igualzinho à um Array
//                           retorna TODOS os elementos que batem com o critério de BUSCA

firstDiv.querySelector('.alguma_classe');
// qualquerElemento.querySelector retorna o PRIMEIRO elemento que bate com o critério de BUSCA
// dentro do contexto de qualquerElemento

document.querySelectorAll('div').forEach((element) => {
  // console.log(element);
});

// window.alert('Pare de escrever!');

const formInput = document.querySelector('#search-input');


formInput.addEventListener('keydown', (e) => {
  // console.log(e);
  // window.alert('Pare de escrever, eu não gosto de gente letrada!');
})

// Qual elemento que eu quero prestar atenção no evento?
// Qual é o evento?
// O que acontece quando o evento é disparado?


// firstDiv.insertAdjacentHTML('beforeend', '<div>algum elemento</div>')


// NÃO FAÇAM ISSO!
// fetch('http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7').then((response) => {
//   console.log(response);
// })

// FAÇAM ISSO!
// fetch('http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7')
//   .then(response => response.json())
//   .then((data) => {
//     // data é um array assim: [{Title: 'Harry Potter', Poster: '...', ...}, {...}]
//     console.log(data);

//     const ulContainer = document.querySelector('#results');

//     data.Search.forEach((movieObject) => {
//       const movieTag = `<li>
//         <img src="${movieObject.Poster}" alt="" />
//         <p>${movieObject.Title}</p>
//       </li>`;

//       ulContainer.insertAdjacentHTML('beforeend', movieTag);
//     });

//   })


// Eu prometo que quando o fetch responder, ou seja, quando a API
// que estou fazendo uma requisição AJAX responder,
// aí sim vai ser executado o....... CALLBACK
//
console.log('Alou!');

const movieForm = document.querySelector('#search-form');

movieForm.addEventListener('submit', (e) => {
  e.preventDefault();

  const searchInput = document.querySelector('#search-input');

  fetch(`http://www.omdbapi.com/?s=${searchInput.value}&apikey=adf1f2d7`)
  .then(response => response.json())
  .then((data) => {
    // data é um array assim: [{Title: 'Harry Potter', Poster: '...', ...}, {...}]
    // console.log(data);

    const ulContainer = document.querySelector('#results');

    ulContainer.innerHTML = '';

    data.Search.forEach((movieObject) => {
      const movieTag = `<li>
        <img src="${movieObject.Poster}" alt="" />
        <p>${movieObject.Title}</p>
      </li>`;

      ulContainer.insertAdjacentHTML('beforeend', movieTag);
    });

  })
})
