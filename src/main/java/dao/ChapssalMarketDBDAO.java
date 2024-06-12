package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ChapssalMarketDBDAO {
	 public static void main(String[] args) {
	        Connection connection = null;
	        Statement statement = null;
	        ResultSet resultSet = null;

	        try {
	            // JDBC 드라이버 로드
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // MySQL 데이터베이스와 연결
	            String url = "jdbc:mysql://127.0.0.1:3306/ChapssalMarketDB?useSSL=false&serverTimezone=UTC";
	            String username = "root";
	            String password = "1234";
	            connection = DriverManager.getConnection(url, username, password);

	            // SQL 쿼리 실행
	            statement = connection.createStatement();
	            String query = "SELECT * FROM your_table_name"; // 여기에 실제 테이블 이름을 넣어주세요.
	            resultSet = statement.executeQuery(query);

	            // 결과 처리
	            while (resultSet.next()) {
	                // 결과에서 데이터 가져오기
	                int id = resultSet.getInt("id");
	                String name = resultSet.getString("name");
	                // 필요한 작업 수행
	                System.out.println("ID: " + id + ", Name: " + name);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            // 리소스 해제
	            try {
	                if (resultSet != null) resultSet.close();
	                if (statement != null) statement.close();
	                if (connection != null) connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
}
