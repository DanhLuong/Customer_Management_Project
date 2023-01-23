<%--
  Created by IntelliJ IDEA.
  User: Danh
  Date: 12/18/2022
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.danh.mvc.utils.SortUtils" %>

<html>
<head>
    <title>Hello World, My Customer</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div id="container">
    <h1>ABC INC</h1>
    <h2>CRM CUSTOMER RELATIONSHIP MANAGER</h2>
    <div id="search-container">
        <form:form action="search" method="get">
            Search Customer: <input type="text" name="theSearchName" />
            <input type="submit" value="Search" class="add-button" />
        </form:form>
    </div>
    <input type="button" value="Add Customer"
           onclick="window.location.href='showFormForAdd'; return false;"
           class="add-button"
    />
    <table>
        <c:url var="softLinkFirstName" value="/customer/list">
            <c:param name="sort" value="<%=Integer.toString(SortUtils.FIRST_NAME)%>" />
        </c:url>
        <c:url var="softLinkLastName" value="/customer/list">
            <c:param name="sort" value="<%=Integer.toString(SortUtils.LAST_NAME)%>" />
        </c:url>
        <c:url var="softLinkEmail" value="/customer/list">
            <c:param name="sort" value="<%=Integer.toString(SortUtils.EMAIL)%>" />
        </c:url>
        <tr>
            <th>Id</th>
            <th><a href="${softLinkFirstName}">First Name</a></th>
            <th><a href="${softLinkLastName}">Last Name</a></th>
            <th><a href="${softLinkEmail}">Email</a></th>
            <th>action</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <c:url var="updateLink" value="/customer/showFormForUpdate">
                <c:param name="customerId" value="${customer.id}" />
            </c:url>

            <c:url var="deleteLink" value="/customer/delete">
                <c:param name="customerId" value="${customer.id}" />
            </c:url>
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.getFirstName()}</td>
                <td>${customer.getLastName()}</td>
                <td>${customer.getEmail()}</td>
                <td>
                    <a href="${updateLink}">Update</a>
                    |
                    <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false;">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
