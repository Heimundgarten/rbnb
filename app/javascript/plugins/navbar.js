
const navbarSolid = () => {
        // Transition effect for navbar
        $(window).scroll(function() {
          // checks if window is scrolled more than 50px, adds/removes solid class
          if($(this).scrollTop() > 50) {
              $('.navbar').css({"opacity" : "0.5"})
          }
          else {
              $('.navbar').css({"opacity" : "1"})
          }
        });
};

export { navbarSolid };
