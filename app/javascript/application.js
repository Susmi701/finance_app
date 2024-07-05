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
    const resultsDiv = document.getElementById('results');
    const searchButton = document.getElementById('fav_id');
  
    // Function to display the loading spinner
    const displayModal = (e) => {
      
      searchButton.style.display = 'none';
      modal.style.display = 'inline-block';
    };
  
    const hideModal = () => {
        searchButton.style.display = 'inline-block';
      modal.style.display = 'none';
      

    };
  
    // Listen for the form submit event and display the loading spinner
    searchForm.addEventListener('submit', (e) => {
        e.preventDefault(); // Prevent default form submission
        displayModal();
        // Perform your form submission logic here if needed
        // Example: searchForm.submit();
      });
  
    // Callback function for the MutationObserver
    const callback = (mutations) => {
      mutations.forEach((mutation) => {
        if (mutation.type === 'childList') {
          hideModal();
        }
      });
    };
  
    // Configuration for the observer to listen to DOM changes
    const config = {
      attributes: true,
      subtree: true,
      childList: true
    };
  
    // Initializing a MutationObserver
    const observer = new MutationObserver(callback);
  
    // Start observing the resultsDiv for changes
    observer.observe(resultsDiv, config);
  });
  