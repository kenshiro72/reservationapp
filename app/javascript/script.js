document.addEventListener('turbolinks:load', function() {
      const mypageBtnContainer = document.getElementById('mypageBtnContainer');
      const mypageDropdown = document.getElementById('mypageDropdown');

        mypageBtnContainer.addEventListener('click', function() {
          mypageDropdown.style.display = 'block';
        });
      });
