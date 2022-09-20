<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var = "contextPath" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSGearProject</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <jsp:include page="_header.jsp" />

	<jsp:include page="_menu.jsp" />

	<fmt:setLocale value="en_US" scope="session" />

	<div class="page-title">Cart's Information</div>
    <c:if test = "${empty cartForm or empty cartForm.cartLineInfos}">
        <h2>There is no product in cart</h2>
        <br>
        <h3>Please click "Product" in menu to choose product</h3>
        <a href="${contextPath}/productList">Show Product List</a>
    </c:if>
	<c:if test = "${not empty cartForm and not empty cartForm.cartLineInfos}">
        <form:form method = "POST" modelAttribute = "cartForm" action="${contextPath}/shoppingCart">
            <c:forEach items="${cartForm.cartLineInfos}" var = "cartLineInfo" varStatus = "varStatus">
                <div class="product-preview-container">
                    <!-- Hover de Hinh anh to ra -->
                    <ul>
                        <li><img class="image-product" src="${contextPath}/productImage?code =${cartLineInfo.productInfo.code}">
                        </li>
                        <li> Code: ${cartLineInfo.productInfo.code}
                            <form:hidden path="cartLineInfos[${varStatus.index}].productInfo.code"/>
                        </li>
                        <li>Name: ${cartLineInfo.productInfo.name}</li>
                        <li>Price:
                            <span class="price-product">
                                <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                            </span>
                        </li>
                        <li>Amount Total:
                            <span class="amount-product">
                                <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"></fmt:formatNumber>
                            </span>
                        </li>
                        <li>
                            <a href="">Remove Product</a>
                        </li>
                    </ul>
                    
                </div>
            </c:forEach>
            
            <div style="clear: both"></div>
            <input class="button-update-product" type="submit" value="Update Information"/>
        </form:form>
    </c:if>
	</div>
    
    
    <jsp:include page="_footer.jsp" />
    
</body>
</html>