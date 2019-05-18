import java.sql.*;

public class PaperReviewDriver {
    private static final String HOST = "jdbc:mysql://localhost/";
    private static final String DB = "paper_reviewers";
    private static final String USER = "root";
    private static final String PASSWORD = "12345";
    static Connection conn;
    public static Connection connection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(HOST+DB,USER,PASSWORD);
        }catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    static void query1(){
        try {
            String sqlQuery = " select author.emailaddr,author.firstname, author.lastname, paper.id, paper.title, paper.abstract from author inner join paper on author.emailaddr=paper.authoremail;";
            PreparedStatement preparedSelect = conn.prepareStatement(sqlQuery);
            ResultSet rs = preparedSelect.executeQuery();
            while (rs.next()) {
                String authoremail = rs.getString("emailaddr");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                int paperid = rs.getInt("id");
                String title = rs.getString("title");
                String paperabstract = rs.getString("abstract");
                System.out.printf("email: %s\tfirstname :%s\tlastname :%s\tpaperid :%d\ttitle :%s\tabstract:%s\n",authoremail,firstname,lastname,paperid,title,paperabstract);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    static void query2(){
        try {
            String sqlQuery = " select * from review where recommendation='can publish';";
            PreparedStatement preparedSelect = conn.prepareStatement(sqlQuery);
            ResultSet rs = preparedSelect.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int paperid = rs.getInt("paperid");
                int meritscore = rs.getInt("meritscore");
                int readabilityscore = rs.getInt("readabilityscore");
                int relevancescore = rs.getInt("relevancescore");
                int orginalityscore = rs.getInt("orginalityscore");
                String reviewerid = rs.getString("reviewerid");
                String recommendation = rs.getString("recommendation");
                System.out.printf("id: %d\tpaperid :%d\tmeritscore :%d\treadabilityscore :%d\trelevancescore :%d\torginalityscore:%d\treviewerid : %s\trecommendation :%s\n",id,paperid,meritscore,readabilityscore,relevancescore,orginalityscore,reviewerid,recommendation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    static void query3(){
        try {
            String sqlQuery = " select count(id) from paper;";
            PreparedStatement preparedSelect = conn.prepareStatement(sqlQuery);
            ResultSet rs = preparedSelect.executeQuery();
            while (rs.next()) {
                int submittedcount = rs.getInt(1);
                System.out.printf("Count of submitted papers: %d\n",submittedcount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    static void query4Insert(String email,String fname,String lname,String title,String filename,String abt){

        try {
            String sqlQuery = " insert into author values (?,?,?);";
            PreparedStatement preparedInsert = conn.prepareStatement(sqlQuery);
            preparedInsert.setString(1, email);
            preparedInsert.setString(2,fname);
            preparedInsert.setString(3,lname);
            int status = preparedInsert.executeUpdate();
            System.out.println(status);
            String sqlQuery1 = " insert into paper(title,filename,authoremail,abstract) values (?,?,?,?);";
            PreparedStatement preparedInsert1 = conn.prepareStatement(sqlQuery1);
            preparedInsert1.setString(1,title);
            preparedInsert1.setString(2,filename);
            preparedInsert1.setString(3,email);
            preparedInsert1.setString(4,abt);
            int status1 = preparedInsert1.executeUpdate();
            System.out.println(status1);


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
    static void query5Delete(String email){

        try {
            String sqlQuery = " delete from author where emailaddr=?;";
            PreparedStatement preparedInsert = conn.prepareStatement(sqlQuery);
            preparedInsert.setString(1, email);
            int status = preparedInsert.executeUpdate();
            System.out.println(status);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        connection();
        // Query1 : Get a submitted paper’s details by the author’s Primary Key. The query should return the
        //following data (columns): Paper.Id, Paper.Title, Paper.Abstract, Author.EmailAddress,
        //Author.FirstName, Author.LastName
        query1();
        for (int i=0; i<70; i++){
            System.out.print("*");
        }
        System.out.println("\n");
        // Query2 : Get all reviews for a paper by the paper’s Id, where the paper was recommended to be
        //published. The query should return the following data (columns): All columns from the
        //Review table
        query2();
        for (int i=0; i<70; i++){
            System.out.print("*");
        }
        System.out.println("\n");
        // Query3 : Get a count of all papers submitted
        query3();
        for (int i=0; i<70; i++){
            System.out.print("*");
        }
        System.out.println("\n");
        //Query4 : Create a new paper submission. Remember this includes creating new records in both
        //the Author and Paper tables.
        // Enter following parameters in the function - Author email, Author firstname, Author lastname, Paper Title,
        // Paper Filename, Paper Abstract
        query4Insert("jaginiakhil@gmail.com","jagini","akhil","Business","jagini.pdf","blah blah");
        for (int i=0; i<70; i++){
            System.out.print("*");
        }
        System.out.println("\n");
        //Query5 : Try and Delete the first “Author” row in your Author table by the author’s id. Did you
        //receive an error? If yes, print to the console the error you received. Also note in your
        //message why the query failed. If it didn’t fail, print a message explaining why you were
        //able to delete the row
        // Enter Author email in the function to delete the author record
        query5Delete("eu.dolor.egestas@posuereat.org");


    }

}
