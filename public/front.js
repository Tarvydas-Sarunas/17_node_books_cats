'use strict';
console.log('front.js file was loaded');

const cat_url = 'http://localhost:3000/api/categories';
const booksUrl = 'http://localhost:3000/api/books';

const els = {
  form: document.getElementById('new-book-form'),
  title: document.getElementById('title'),
  author: document.getElementById('author'),
  year: document.getElementById('year'),
  select: document.getElementById('cat_id'),
};

async function init() {
  getCategories();
}
init();

els.form.addEventListener('submit', handleNewBookSubmit);

function handleNewBookSubmit(e) {
  e.preventDefault();
  const newBookObj = {
    title: els.title.value.trim(),
    author: els.author.value.trim(),
    year: +els.year.value,
    cat_id: +els.select.value,
  };
  createNewBook(newBookObj);
}

function createNewBook(newBookData) {
  const options = {
    method: 'POST',
    headers: {
      'Content-type': 'application/json',
    },
    body: JSON.stringify(newBookData),
  };
  fetch(booksUrl, options)
    .then((resp) => resp.json())
    .then((data) => {
      console.log('data ===', data);
    })
    .catch((error) => console.warn(error));
}

// gauti is url visas kategorijas
// ir surenderinti i option in select

async function getCategories() {
  const [data, error] = await getDataFetch(cat_url);
  if (error) {
    console.log('error ===', error);
    return;
  }
  console.log('data ===', data);
  // suku cikla kad sugeneruoti i option kategorijas
  data.forEach((dObj) => {
    const optionEl = document.createElement('option');
    optionEl.value = dObj.cat_id;
    optionEl.textContent = dObj.category;
    els.select.append(optionEl);
  });
}

const newBook = {
  title: '1983',
  author: 'James Carr',
  year: 1983,
  cat_id: 2,
};

//  hellper fetch function
async function getDataFetch(url) {
  try {
    const resp = await fetch(url);
    if (resp.ok === false) {
      throw {
        status: resp.status,
        msg: resp.statusText,
      };
    }
    const data = await resp.json();
    return [data, null];
  } catch (error) {
    console.log('error getDataFetch ===', error);
    return [null, error];
  }
}
