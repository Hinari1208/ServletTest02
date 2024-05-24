<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jp.co.aforce.beans.Tweet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ツイート一覧</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>ツイート一覧</h1>
        <%-- 新規投稿 --%>
        <p>
            <a href="new_tweet.jsp">新規投稿</a>
        </p>

        <%-- メッセージの表示 --%>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
                <p><strong><%= message %></strong></p>
        <%
            }
        %>

        <%-- ツイート一覧の表示 --%>
        <ul class="tweet-list">
            <%
                List<Tweet> tweets = (List<Tweet>) request.getAttribute("tweets");
                if (tweets != null && !tweets.isEmpty()) {
                    for (Tweet tweet : tweets) {
            %>
                        <li>
                            <div class="tweet-content">
                                <p><%= tweet.getContent() %></p>
                                <p class="tweet-info">投稿者: <%= tweet.getAuthor() %> - 投稿日時: <%= tweet.getPostedAt() %></p>
                            </div>
                        </li>
            <%
                    }
                } else {
            %>
                    <p>ツイートがありません。</p>
            <%
                }
            %>
        </ul>
    </div>
</body>
</html>

