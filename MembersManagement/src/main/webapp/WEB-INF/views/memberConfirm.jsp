<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録確認フォーム</title>
<style>
	body{
		background: ${memberModel.color};
	}
	h1{
		margin: 0;
	}
	table{
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
	td{
		border: 1px solid #ccc;
		padding:0.3rem;
	}

</style>
</head>
<body bgcolor="${memberModel.color }">
	<h1>会員登録確認フォーム</h1>
	<form:form medelAttribute="memberModel">
		<table>
			<tr>
				<td width="120">お名前</td>
				<td>${memberModel.name }</td>
			</tr>
			<tr>
				<td>フリガナ</td>
				<td>${memberModel.kana }</td>
			</tr>
			<tr>
				<td>性別</td>
				<td>${gender }</td>
			</tr>
			<tr>
				<td>生年月日</td>
				<td>
					${memberModel.birthYear }年&nbsp;${memberModel.birthMonth }月&nbsp;${memberModel.birthDay }日
				</td>
			</tr>
			<tr>
				<td>郵便番号</td>
				<td>${memberModel.zip }</td>
			</tr>
			<tr>
				<td>住所</td>
				<td>${memberModel.address }</td>
			</tr>
			<tr>
				<td>携帯番号</td>
				<td>${memberModel.mobilePhone }</td>
			</tr>
			<tr>
				<td>メールアドレス</td>
				<td>${memberModel.mailAddress }</td>
			</tr>
			<tr>
				<td>メールマガジン</td>
				<td>${mailMagazines }</td>
			</tr>
			<tr>
				<td>備考</td>
				<td>${comment }</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="登録" />
				</td>
			</tr>
		</table>
	</form:form>

</body>
</html>