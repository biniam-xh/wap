<%@ include file="header.jsp"%>


<link href="resources/css/form-validation.css" rel="stylesheet">
<div class="container" id="registration_container">
    <div class="py-5 text-center">
        <h4>Sign up</h4>
    </div>

    <div class="row">

        <div class="offset-md-2 col-md-8 order-md-1">

            <form id="registration_form" novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="first_name">First name</label>
                        <input type="text" class="form-control" id="first_name" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="last_name">Last name</label>
                        <input type="text" class="form-control" id="last_name" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Email</label>
                    <input type="email" class="form-control" id="username" placeholder="you@example.com" required>
                    <div class="invalid-feedback">
                        Please enter a valid email address.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password">Password</label>
                    <input type="text" class="form-control" id="password" required pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$">
                    <div class="invalid-feedback">
                        Password is required and must contain minimum of eight characters, at least one letter and one number
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address1">Address</label>
                    <input type="text" class="form-control" id="address1" placeholder="1234 Main St" required>
                    <div class="invalid-feedback">
                        Please enter your shipping address.
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="zip">Zip</label>
                        <input type="text" class="form-control" id="zip" placeholder="" required>
                        <div class="invalid-feedback">
                            Zip code required.
                        </div>
                    </div>
                </div>

                <hr class="mb-4">
                <div style="margin: auto; max-width: 100px;" id="loader" class="spinner-border text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <button class="btn btn-success btn-lg btn-block" id="registerBtn" type="submit">Sign up</button>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">


    </footer>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">User Registration</h5>
                <button type="button" class="close closeBtn1" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="statusMessage">

                </div>
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-secondary closeBtn1" data-dismiss="modal" >Close</button>
            </div>
        </div>
    </div>
</div>


<%@ include file="footer.jsp"%>