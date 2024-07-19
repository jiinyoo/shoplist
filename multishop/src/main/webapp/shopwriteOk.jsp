<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>  

<%@ page import="multishop.Shop"%>

<%
Shop shop = new Shop();
String path=request.getRealPath("/file");
int size=1024*1024*30;
MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
shop.shopwriteOk(request,multi,response);
%>