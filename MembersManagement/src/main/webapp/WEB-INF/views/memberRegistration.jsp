<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録フォーム</title>
<style>
	h1{
		margin: 0;
	}
	table{
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
	td{
		border: 1px solid #ccc;
		padding: 0.3rem;
	}
</style>
</head>
<body>
	<h1>会員登録フォーム</h1>
	<form:form modelAttribute="memberModel">
		<table>
			<tr>
				<td>お名前</td>
				<td><form:input path="name" size="25" /></td>
			</tr>
			<tr>
				<td>フリガナ</td>
				<td><form:input path="kana" size="25" /></td>
			</tr>
			<tr>
				<td>性別</td>
				<td>
					<form:radiobutton path="gender" label="男" value="man" checked="true"/>
					<form:radiobutton path="gender" label="女" value="woman"/>
				</td>
			</tr>
			<tr>
				<td>生年月日</td>
				<td>
					<form:select path="birthYear" items="${years }" itemLabel="label" itemValue="data" />&nbsp;年
					<form:select path="birthMonth" items="${months }" itemLabel="label" itemValue="data" />&nbsp;月
					<form:select path="birthDay" items="${days }" itemLabel="label" itemValue="data" />&nbsp;日
				</td>
			</tr>
			<tr>
				<td>郵便番号</td>
				<td><form:input path="zip" size="8" /></td>
			</tr>
			<tr>
				<td>住所</td>
				<td><form:input path="address" size="50" /></td>
			</tr>
			<tr>
				<td>携帯番号</td>
				<td><form:input path="mobilePhone" size="15" /></td>
			</tr>
			<tr>
				<td>メールアドレス</td>
				<td><form:input path="mailAddress" size="25" /></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<td><form:password path="password" size="20" /></td>
			</tr>
			<tr>
				<td>メールマガジン</td>
				<td><form:checkboxes items="${magazineMap }" path="mailMagazines" delimiter="<br />" /></td>
			</tr>
			<tr>
				<td>プライバシーポリシー</td>
				<td>
					<form:checkbox path="agreement" label="プライバシーポリシーに同意します" />
					(<a href="#">プライバシーポリシーについて</a>)
				</td>
			</tr>
			<tr>
				<td>備考</td>
				<td><form:textarea path="comment" cols="80" rows="5" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="確認" />
					<form:hidden path="color" value="#fdf5e6" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>