<%@ include file="header.jsp"%>

<section id="product" class="padd-section">

    <div class="container">
        <div class="section-title text-center">
            <h2>Auctions Items</h2>
            <p class="separator">latest antiques</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <c:forEach items="${products}" var="product" >

                <div class="col-md-6 col-lg-4">
                    <div class="block-product text-left">
                        <a href="/Project_auction/product?product_id=${product.id}"><img src="${product.imageURL}" alt="img"></a>
                        <div class="content-product">
                            <h4><a href="#">${product.productName}</a></h4>
                            <span class="pull-left">Current Bid: $</span>
                            <span class="pull-left" style="color: #71c55d;">${product.bid_amount}0</span>
                            <span style="float: right;" class="pull-right">${product.elapsed_time}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</section>


<%@ include file="footer.jsp"%>
