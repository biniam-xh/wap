var module=(function(){
    "use strict"
    function createBicyclePrototye(){
        return{
            speed:0,
            applyBrake :function(val){
                this.speed-=val;
            },
            speedUp:function(val){
                this.speed+=val;
            }
        };
    }

    function createMountainBikeProtoype(obj){
        var x=Object.create(obj);
        x.gear=1;
        x.setGear=function(val){
            this.gear=val;
        }
        return x;
    } 

    function makeBicyclePrototype(){
        var bicycle=createBicyclePrototye();
        var mountainBike=createMountainBikeProtoype(bicycle);
        console.log(bicycle); //
        console.log(mountainBike);
        console.log(mountainBike.speed);
        console.log(mountainBike.__proto__ == bicycle);
        bicycle.speedUp(3);
        console.log(bicycle.speed);
        console.log(mountainBike.speed);
        mountainBike.setGear(3);
        console.log(mountainBike);
    }
    return {
        createMountainBikeProtoype:createMountainBikeProtoype,
        createBicyclePrototye:createBicyclePrototye,
        makeBicyclePrototype:makeBicyclePrototype
    };
})();


module.makeBicyclePrototype();

