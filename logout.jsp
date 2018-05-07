<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<%
session.invalidate();
%>

<jsp:forward page = "index_an.jsp"/>