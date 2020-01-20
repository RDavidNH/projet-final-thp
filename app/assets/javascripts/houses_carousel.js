$(function(){

    function imageGallery() {
        var highlight = document.querySelector(".gallery-hightlight");
        var previews = document.querySelectorAll(".room-preview img");
        
        previews.forEach(preview => {
            preview.addEventListener("click", function() {
                const smallSrc = this.src;
                // const bigSrc = smallSrc.replace("small", "big");
                previews.forEach(preview => preview.classList.remove("room-active"));
                highlight.src = smallSrc;
                preview.classList.add("room-active");
            });
        });
    }
    
    imageGallery();
});