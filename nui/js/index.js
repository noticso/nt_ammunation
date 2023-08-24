
$(function () {
    function display(bool) {
        if (bool) {
            $(".container").show();
        } else {
            $(".container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        
        let item = event.data;
        let items = item.items
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
                
            } else {
                display(false)
                
            }
        }
    })
    document.onkeydown = (event) => {
        if(event.which == 27){
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}))
            $(".img-show-case").attr("src","")
            $(".img-show-case").attr("alt","")
            $(".weapon").text("No weapon selected")
            $(".buy").text("No weapon selected")
            $(".show-case").hide()
        }
    };    


    

})