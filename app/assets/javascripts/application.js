// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_self
//= require tinymce
//= require tinymce-jquery
//= require_tree .


$(document).ready(function() {

  window.addEventListener('scroll', function() {
  var el = document.querySelector('.transparent-nav');
  if(window.scrollY >= 650) el.classList.add('visible');
  else el.classList.remove('visible');
  });

  var text = ['승규','민경', '정우', '지선','효광','동우'];
  function callMe(){
    var myText = document.getElementById('mytext');
    var curIdx = text.indexOf(myText.innerHTML);
    myText.innerHTML = text[(curIdx+1)%text.length];
  }
  setInterval(callMe,1000);

  function setupTypewriter(t) {
          var HTML = t.innerHTML;

          t.innerHTML = "";

          var cursorPosition = 0,
              tag = "",
              writingTag = false,
              tagOpen = false,
              typeSpeed = 100,
          tempTypeSpeed = 0;

          var type = function() {

              if (writingTag === true) {
                  tag += HTML[cursorPosition];
              }

              if (HTML[cursorPosition] === "<") {
                  tempTypeSpeed = 0;
                  if (tagOpen) {
                      tagOpen = false;
                      writingTag = true;
                  } else {
                      tag = "";
                      tagOpen = true;
                      writingTag = true;
                      tag += HTML[cursorPosition];
                  }
              }
              if (!writingTag && tagOpen) {
                  tag.innerHTML += HTML[cursorPosition];
              }
              if (!writingTag && !tagOpen) {
                  if (HTML[cursorPosition] === " ") {
                      tempTypeSpeed = 0;
                  }
                  else {
                      tempTypeSpeed = (Math.random() * typeSpeed) + 10;
                  }
                  t.innerHTML += HTML[cursorPosition];
              }
              if (writingTag === true && HTML[cursorPosition] === ">") {
                  tempTypeSpeed = (Math.random() * typeSpeed) + 50;
                  writingTag = false;
                  if (tagOpen) {
                      var newSpan = document.createElement("span");
                      t.appendChild(newSpan);
                      newSpan.innerHTML = tag;
                      tag = newSpan.firstChild;
                  }
              }

              cursorPosition += 1;
              if (cursorPosition < HTML.length - 1) {
                  setTimeout(type, tempTypeSpeed);
              }

          };

          return {
              type: type
          };
      }

      var typer = document.getElementById('typewriter');

      typewriter = setupTypewriter(typewriter);

      typewriter.type();


});
