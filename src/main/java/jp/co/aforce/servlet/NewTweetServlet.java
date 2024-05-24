package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jp.co.aforce.dao.TweetDAO;

@WebServlet("/new_tweet")
public class NewTweetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        
        TweetDAO tweetDAO = new TweetDAO();
        try {
            tweetDAO.addTweet(content, author);
            request.setAttribute("message", "ツイートが正常に投稿されました。");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "ツイートの投稿に失敗しました。");
        }
        
        request.getRequestDispatcher("tweet_list").forward(request, response);
    }
}
