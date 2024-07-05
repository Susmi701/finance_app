// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "chartkick"
import "Chart.bundle"
import Rails from '@rails/ujs';

Rails.start();


document.addEventListener('turbo:load', () => {
    const searchForm = document.getElementById('search_stock_form');
    const modal = document.getElementById('myModal');
    const searchButton = document.getElementById('fav_id');

      const displayModal = (e) => {
      searchButton.style.display = 'none';
      modal.style.display = 'inline-block';
    };
  
    const hideModal = () => {
        searchButton.style.display = 'inline-block';
      modal.style.display = 'none';
    };

    searchForm.addEventListener('submit', (e) => {
        e.preventDefault(); 
        displayModal();

      });
  
      document.addEventListener('ajax:complete', () => {
        hideModal();
      });
  });
  