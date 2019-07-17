<%@ include file="header.jsp"%>

<section id="product" class="padd-section">

    <div class="container">
        <div class="section-title text-center">
            <h2>My Antiques</h2>
            <p class="separator">you have winner of the following items</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <c:forEach items="${products}" var="product" >

                <div class="col-md-6 col-lg-4">
                    <div class="block-product text-left">
                        <c:if test="${product.paid}">
                            <a href="#"><img src="${product.imageURL}" alt="img"></a>
                        </c:if>
                        <c:if test="${!product.paid}">
                            <a href="/Project_auction/product?product_id=${product.id}&myProducts=true"><img src="${product.imageURL}" alt="img"></a>
                        </c:if>

                        <div class="content-product">
                            <h4><a href="#">${product.productName}</a></h4>
                            <span class="pull-left">your Bid: $</span>
                            <span class="pull-left" style="color: #71c55d;">${product.bid_amount}</span>

                            <c:if test="${product.paid}">
                                <span style="float: right;" class="pull-right">Shipment Status: pendding</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</section>


<%@ include file="footer.jsp"%>
