$(function(){
    "use strict"
    var puzzleArea = $('#puzzlearea');
    var divs = $("div",puzzleArea);
    var init=function(){ 
        // initialize each piece
        for (let i=0; i< divs.length; i++) {
            var div = divs[i];
            
            // calculate x and y for this piece
            var x = ((i % 4) * 100) ;
            var y = (Math.floor(i / 4) * 100) ;
    
            // set basic style and background
            div.className = "puzzlepiece";
            div.style.left = x + 'px';
            div.style.top = y + 'px';
            div.style.backgroundImage = 'url("img/puzzle-image.jpg")';
            div.style.backgroundPosition = -x + 'px ' + (-y) + 'px';

            // store x and y for later
            div.x = x;
            div.y = y; 

            $(div).attr("id","square_"+(i%4)+"_"+(Math.floor(i / 4)));
        } 
        
        
    }
    init();
    
    $(divs).click(function (e) { 
        e.preventDefault();
        moveTiles(this);
        if(checkAllAreCorrect()){
            alert("Bravo!!! you done it");
        }
       
    });
    $(divs).mouseenter(function () { 
        let found=false;
         //check upward
        if(this.y>0){
            let res=checkEmpty(this.x,this.y-100);
            if(res) found=true;
        }
        //check downward
        if(this.y<300){ 
            let res=checkEmpty(this.x,this.y+100);
            if(res) found=true;
        }
        //check leftward
        if(this.x>0){
            let res=checkEmpty(this.x-100,this.y);
            if(res) found=true;
        }
        //check rightward
        if(this.x<300){
            let res=checkEmpty(this.x+100,this.y);
            if(res) found=true;
        }
        if(found){
            $(this).addClass("movablepiece");
        }

    });
    $(divs).mouseout(function () { 
        $(divs).removeClass("movablepiece");
    });
    function checkEmpty(row,col){  
        if(row>0)row=row/100;
        if(col>0)col=col/100; 
        if($("#square_"+row+"_"+col).length){
            return false;
        }else{
            return true;
        }

    }
    function checkAllAreCorrect(){
        for (let i=0; i< divs.length; i++) {
            var div = divs[i];
            var l = ((i % 4) * 100) ;
            var t = (Math.floor(i / 4) * 100) ;
            if(div.x!=l || div.y!=t){
                return false;
            }
        }
        return true;
    }

    function moveTiles(ele){
         //check upward
         if(ele.y>0){
            let res=checkEmpty(ele.x,ele.y-100);
            if(res){
                let l=parseInt(ele.x);
                let t=parseInt(ele.y-100);
                $(ele).css("top",t+"px");
                ele.x=parseInt(l);
                ele.y=parseInt(t);   
                if(l>=100)l/=100;
                if(t>=100)t/=100;                
                $(ele).attr("id","square_"+l+"_"+t); return;
            }
        }
        //check downward
        if(ele.y<300){ 
            let res=checkEmpty(ele.x,ele.y+100);
            if(res){
                let l=parseInt(ele.x);
                let t=parseInt(ele.y+100);
                $(ele).css("top",t+"px");
                ele.x=parseInt(l);
                ele.y=parseInt(t);   
                if(l>=100)l/=100;
                if(t>=100)t/=100;
                $(ele).attr("id","square_"+l+"_"+t);
                return;
            }
        }
        //check leftward
        if(ele.x>0){
            let res=checkEmpty(ele.x-100,ele.y);
            if(res){
                let l=parseInt(ele.x-100);
                let t=parseInt(ele.y);
                $(ele).css("left",l+"px");
                ele.x=parseInt(l);
                ele.y=parseInt(t);
                if(l>=100)l/=100;
                if(t>=100)t/=100;
                $(ele).attr("id","square_"+l+"_"+t);return;
            }
        }
        //check rightward
        if(ele.x<300){
            let res=checkEmpty(ele.x+100,ele.y);
            if(res){
                let l=parseInt(ele.x+100);
                let t=parseInt(ele.y);
                $(ele).css("left",l+"px"); 
                ele.x=parseInt(l);
                ele.y=parseInt(t);
                if(l>=100)l/=100;
                if(t>=100)t/=100;
                $(ele).attr("id","square_"+l+"_"+t);return;
            }
        }
    }
    
    $("#shufflebutton").click(function(){
        for(let i=0;i<1000;i++){
            var pos=Math.floor(Math.random() * divs.length); 
            moveTiles(divs[pos]);
        }
         
    });

    
})