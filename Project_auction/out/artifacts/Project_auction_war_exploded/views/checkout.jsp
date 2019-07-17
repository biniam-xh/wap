<%@ include file="header.jsp"%>


    <link href="resources/css/form-validation.css" rel="stylesheet">

<div class="container" id="checkout_container">
    <div class="py-5 text-center">
        <h2>Payment</h2>
    </div>

    <div class="row">

        <div class="offset-md-2 col-md-8 order-md-1">

            <form class="needs-validation" novalidate>

                <h4 class="mb-3">Payment</h4>

                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                        <label class="custom-control-label" for="credit">Credit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                        <label class="custom-control-label" for="debit">Debit card</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name">Name on card</label>
                        <input type="text" class="form-control" id="cc-name" placeholder="" required>
                        <small class="text-muted">Full name as displayed on card</small>
                        <div class="invalid-feedback">
                            Name on card is required
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-number">Credit card number</label>
                        <input type="text" class="form-control" pattern="[0-9]{16}" id="cc-number" placeholder="" required >
                        <div class="invalid-feedback">
                            Invalid card number
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">Expiration</label>
                        <input type="text" class="form-control" id="cc-expiration" pattern="^(0[1-9]|1[0-2])\/?(([0-9]{4}|[0-9]{2})$)" placeholder="" required>
                        <div class="invalid-feedback">
                            Expiration date required. provide a valid date
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">CVV</label>
                        <input type="text" class="form-control" id="cc-cvv" pattern="[0-9]{3}" placeholder="" required>
                        <div class="invalid-feedback">
                            Security code required. provide a valid CVV number
                        </div>
                    </div>
                </div>
                <hr class="mb-4">
                <input type="hidden" value="${product_id}" id="product_id">
                <div id="loader" class="spinner-border text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <button class="btn btn-success btn-lg btn-block" id="checkoutBtn" type="submit">Continue to checkout</button>
            </form>
        </div>
    </div>


</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Payment successful!</h5>
                <button type="button" class="close closeBtn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                your item will be sent to this address:
                <p><strong>${sessionScope.address}</strong></p>
                You will receive your package in 5 - 7 days.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal" >Close</button>

            </div>
        </div>
    </div>
</div>


<%@ include file="footer.jsp"%>
