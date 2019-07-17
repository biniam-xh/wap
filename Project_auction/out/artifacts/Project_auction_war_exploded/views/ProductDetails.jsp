<%@ include file="header.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <img src="${product.imageURL}" alt="img" width="100%">
        </div>
        <div class="col-md-6" style="margin: auto;">
            <h3>${product.productName}</h3>
            <p>${product.description}</p>
            <p>Current bid: $<span id="current_bid">${product.bid_amount}</span></p>


            <c:if test="${product.expired}">
                <div class="form-group">
                    <div id="bid_status">
                        <h4>Congratulation. you WON!</h4>
                        <a class="btn btn-s btn-success" href="/Project_auction/checkout?product_id=${product.id}">Claim item</a>
                    </div>
                </div>
            </c:if>

            <c:if test="${!product.expired}">
                <form id="bid_form" class="col-md-8">
                    <div class="form-group">
                        <label for="bid_amount">Bid Amount:</label>
                        <input required type="number" name="bid_amount" class="form-control" min="${product.bid_amount + 1}" id="bid_amount">
                        <input type="hidden" value="${product.id}" id="product_id">
                    </div>
                    <div class="form-group">
                        <div id="loader" class="spinner-border text-primary" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                        <button type="submit" id="place_bid" class="btn btn-success btn-s">Place Bid</button>

                    </div>

                    <c:if test="${!product.expired}">
                        <div class="form-group">
                            <div id="bid_status">

                            </div>
                        </div>
                    </c:if>

                </form>
            </c:if>
        </div>

    </div>
</div>

<%@ include file="footer.jsp"%>
