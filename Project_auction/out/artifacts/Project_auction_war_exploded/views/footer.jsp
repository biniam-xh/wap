</div>
</body>
</html>
<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $("#bid_form").submit(function (event) {
            event.preventDefault();
            $("#loader").show();
            $("#place_bid").hide();
            var bid_amount = $("#bid_amount").val();
            var product_id = $("#product_id").val();
            $.post("/Project_auction/placeBid",
                {
                    "bid_amount": bid_amount,
                    "product_id": product_id
                },
                function(data, status){
                    if(status == "success"){
                        $("#current_bid").html(bid_amount);
                    }
                    $("#bid_status").html(data);

                    $("#loader").hide();
                    $("#bid_message").show();
                    $("#bid_form")[0].reset();
                    $("#place_bid").show();
                });


        });



        $('.needs-validation').each(function () {

            $(this).submit(function (event) {

                if (this.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                else {
                    this.classList.add('was-validated');
                    event.preventDefault();
                    var product_id = $("#product_id").val();
                    $("#checkoutBtn").hide();
                    $("#loader").show();

                    $.post("/Project_auction/UpdatePayment",
                        {

                            "product_id": product_id
                        },
                        function(data, status){

                            console.log(data);
                            $("#loader").hide();

                            $('#myModal').modal('show');
                    });


                }
                this.classList.add('was-validated');


            });

        });

        $('#registration_form').submit(function (event) {

            if (this.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            else {
                this.classList.add('was-validated');
                event.preventDefault();

                registerUser();
            }
            this.classList.add('was-validated');


        });
        var registrationStatus = false;

        function registerUser(){

            $("#loader").show();
            $("#registerBtn").hide();
            var first_name = $("#first_name").val();
            var last_name = $("#last_name").val();
            var username = $("#username").val();
            var password = $("#password").val();
            var address1 = $("#address1").val();
            var address2 = $("#address2").val();
            var zip = $("#zip").val();

            $.ajax("/Project_auction/signup",{
                type: "Post",
                data: {
                    "first_name": first_name,
                    "last_name": last_name,
                    "username": username,
                    "password": password,
                    "address1": address1,
                    "address2": address2,
                    "zip": zip
                },
                statusCode: {
                    200: function (data) {
                        $('#myModal').modal('show');

                        $("#statusMessage").html(data);

                        $("#loader").hide();
                        $("#statusMessage").show();

                        registrationStatus = true;
                    },
                    240: function (data) {
                        $('#myModal').modal('show');

                        $("#statusMessage").html(data);

                        $("#loader").hide();
                        $("#statusMessage").show();
                        $("#registerBtn").show();
                    }
                }
            });


        }

        $(".closeBtn1").click(function (event) {

            if(registrationStatus){
                event.preventDefault();
                window.location.href = "/Project_auction/login";
            }

        });


        $(".closeBtn").click(function (event) {
            event.preventDefault();
            window.location.href = "/Project_auction/MyProducts";
        });
    });



</script>