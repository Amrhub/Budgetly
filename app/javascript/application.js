// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import * as bootstrap from 'bootstrap';
import './controllers';
import './jquery/jquery';

$(function () {
  $(document).on('change', '#file-input', () => {
    var file_text = $('#file-input').val();
    if (file_text) $('.image-upload-span').text(file_text);
  });
});

document.addEventListener('turbo:load', () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
});
