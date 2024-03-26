/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.math.BigInteger;
import model.Student;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Admin;
import model.Account;
import model.Feedback;
import model.Lecture;
import model.Parent;
import model.TrainingDepartment;

/**
 *
 * @author admin
 */
public class DAO extends DBContext {

    private String status = "Ok";
    private List<Student> std;
    private List<Parent> pa;
    private List<Lecture> le;

    public List<Student> loadAllStudent() {
        std = new Vector<Student>();
        String sql = "SELECT * FROM [dbo].[Student]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                Date dob = rs.getDate(3);
                String email = rs.getString(4);
                String imgUrl = rs.getString(5);
                String username = rs.getString(6);
                std.add(new Student(id, name, dob, email, imgUrl, username));
            }
        } catch (Exception e) {
            status = "Error! Can not connect" + e.getMessage();
        }
        return std;
    }

    public Student check(String email) {
        String sql = "SELECT id, [name], dob, email, imgUrl, userName FROM Student WHERE email = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Student s = new Student(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        rs.getString("email"),
                        rs.getString("imgUrl"),
                        rs.getString("username")
                );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void loadParent() {
        pa = new Vector<Parent>();
        String sql = "select * from mydb9.parent";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pa.add(new Parent(new BigInteger(rs.getString(1)),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addParent(Parent parent) {
        String sql = "INSERT INTO `mydb32`.`parent`\n"
                + "(`idParent`,\n"
                + "`Name`,\n"
                + "`Address`,\n"
                + "`Email`,\n"
                + "`Pass`,\n"
                + "`Username`,\n"
                + "`Job`,\n"
                + "`PlaceOfWork`,\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBigDecimal(1, new BigDecimal(parent.getId()));
            pre.setString(2, parent.getName());
            pre.setString(3, parent.getAdd());
            pre.setString(4, parent.getEmail());
            pre.setString(5, parent.getPass());
            pre.setString(6, parent.getUserName());
            pre.setString(7, parent.getJob());
            pre.setString(8, parent.getPlaceOfWork());
            pre.executeUpdate();
        } catch (Exception e) {

        }
    }

    public Parent checkPa(String userName, String pass) {
        String sql = "select * from mydb9.parent where Username = ? "
                + "and Pass = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Parent pa = new Parent(new BigInteger(rs.getString("idParent")),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("Pass"),
                        rs.getString("Username"),
                        rs.getString("Job"),
                        rs.getString("PlaceOfWork"));
                return pa;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public Account checkAccount(String userName, String pass) {
    String sql = "SELECT * FROM Account WHERE userName = ? AND password = ?";
    try {
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, userName);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Account account = new Account();
            account.setUsername(rs.getString("username"));
            account.setPassword(rs.getString("password"));
            account.setEmail(rs.getString("email"));
            account.setRole(rs.getString("role"));
            return account;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}


    public Parent checkPaForgotPassword(String userName, String email) {
        String sql = """
                     select * from mydb9.parent
                     where Username = ? and Email = ?;""";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, userName);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Parent pa = new Parent(new BigInteger(rs.getString("idParent")),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("Pass"),
                        rs.getString("Username"),
                        rs.getString("Job"),
                        rs.getString("PlaceOfWork"));
                return pa;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateOTPSentStatus(String username, boolean otpSent) {
        String sql = "UPDATE mydb9.parent SET otp_sent = ? WHERE Username = ?";

        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setBoolean(1, otpSent);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updatePassword(String username, String newPassword, BigInteger idParent) {
        String sql = "UPDATE mydb9.parent SET Pass = ? WHERE idParent = ? and Username = ?;";

        try {
            PreparedStatement preparedStatement = connection.prepareCall(sql);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setBigDecimal(2, new BigDecimal(idParent));
            preparedStatement.setString(3, username);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public BigInteger getIdParentByUsername(String username) {
        String sql = "SELECT idParent FROM mydb9.parent WHERE Username = ?";
        BigInteger idParent = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                idParent = new BigInteger(resultSet.getString("idParent"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return idParent;
    }

    public void loadLecture() {
        le = new Vector<>();
        String sql = "SELECT id, [name], dob, email, username FROM Lecture;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Lecture lecture = new Lecture(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        rs.getString("email"),
                        rs.getString("username")
                );
                le.add(lecture);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Lecture getLectureById(String id) {
        Lecture lecture = null;
        try {
            String sql = "SELECT * FROM Lecture WHERE id = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                Date dob = rs.getDate("dob");
                String email = rs.getString("email");
                String username = rs.getString("username");

                lecture = new Lecture(id, name, dob, email, username);
            }
        } catch (SQLException e) {
            status = "Error! Can not connect: " + e.getMessage();
        }
        return lecture;
    }

    public Lecture checkLectureEmail(String email) {
        String sql = "SELECT id, [name], dob, email, username FROM Lecture WHERE email = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Lecture lecture = new Lecture(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        rs.getString("email"),
                        rs.getString("username")
                );
                return lecture;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Admin checkAdminEmal(String email) {
        String sql = "select idAdmin, Email from mydb9.admin where Email = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin ad = new Admin(new BigInteger(rs.getString(1)),
                        rs.getString(2));
                return ad;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public TrainingDepartment checkTrainEmail(String email) {
        String sql = "select idTrainingDepartment, PhoneNumber, Email from trainingdepartment where Email = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TrainingDepartment train = new TrainingDepartment(rs.getString(1), rs.getInt(2), rs.getString(3));
                return train;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void sendFeedback(Feedback fe) {
        String sql = "INSERT INTO Feedback (Content, StudentID, "
                + "LectureID, Date) VALUES (?, ?, ?,CURRENT_TIMESTAMP);";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, fe.getContent());
            ps.setString(2, fe.getStudentId());
            ps.setString(3, fe.getLectureId());
            ps.executeUpdate();
            System.out.println("Feedback thanh cong!");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<String[]> getClassNameByLectureId(String lectureId) {
        String sql = "select la.GroupId, gr.[name]\n"
                + "from dbo.LectureAsignment la\n"
                + "inner join dbo.[Group] gr on la.GroupId = gr.id\n"
                + "where la.LectureId = ?;";
        ArrayList<String[]> classNames = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, lectureId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String[] classInfo = new String[2];
                classInfo[0] = rs.getString("GroupId");
                classInfo[1] = rs.getString("name");
                classNames.add(classInfo);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return classNames;
    }

    public ArrayList<Student> getStudentIdsByClassId(int classId, String lecturedId) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "select st.id, st.[name]\n"
                + "from dbo.Student st\n"
                + "inner join dbo.[Group] gr on gr.id = st.GroupId\n"
                + "inner join dbo.LectureAsignment le on le.GroupId = st.GroupId\n"
                + "where st.GroupId = ? and le.LectureId = ?;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, classId);
            pre.setString(2, lecturedId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("id"));
                student.setName(rs.getString("name"));
                students.add(student);
            }
        } catch (Exception e) {
            System.out.println("Error! Can not connect" + e.getMessage());
        }

        return students;
    }

    public List<Feedback> getFeedbackByStudentId(String studentId, String lectureId) {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "select fe.idFeedBack, fe.StudentId, fe.Content, fe.DATE\n"
                + "from dbo.Feedback fe\n"
                + "inner join dbo.Lecture le on le.id = fe.LectureId\n"
                + "inner join dbo.Student st on st.id = fe.StudentId\n"
                + "where fe.StudentId = ? and fe.LectureId = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, studentId);
            ps.setString(2, lectureId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback fe = new Feedback();
                fe.setId(rs.getInt("idFeedBack"));
                fe.setStudentId(rs.getString("StudentId"));
                fe.setContent(rs.getString("Content"));
                java.sql.Date date = rs.getDate("Date");
                fe.setDate(date);
                feedbackList.add(fe);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    public List<Feedback> getFeedbackByLectureId(String studentId, String lectureId) {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "select fe.idFeedBack, fe.LectureId, le.[name], fe.Content, fe.DATE\n"
                + "from dbo.Feedback fe\n"
                + "inner join dbo.Lecture le on le.id = fe.LectureId\n"
                + "inner join dbo.Student st on st.id = fe.StudentId\n"
                + "where fe.StudentId = ? and fe.LectureId = ?;";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, studentId);
            ps.setString(2, lectureId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback fe = new Feedback();
                fe.setId(rs.getInt("idFeedBack"));
                fe.setLectureId(rs.getString("lectureId"));
                Lecture le = getLectureById1(lectureId);
                fe.setLecture(le);
                fe.setContent(rs.getString("Content"));
                java.sql.Date date = rs.getDate("Date");
                fe.setDate(date);
                feedbackList.add(fe);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    public Lecture getLectureById1(String id) {
        String sql = "SELECT * FROM Lecture WHERE id = ?";
        try {

            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Lecture le = new Lecture(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        rs.getString("email"),
                        rs.getString("userName"));
                return le;
            }
        } catch (SQLException e) {
            status = "Error! Can not connect: " + e.getMessage();
        }
        return null;
    }

    public ArrayList<Lecture> getLectureByStudentId(String studentId) {
        ArrayList<Lecture> lecture = new ArrayList<>();
        String sql = "select lec.id, lec.[name]\n"
                + "from dbo.Student st\n"
                + "inner join dbo.[Group] gr on gr.id = st.GroupId\n"
                + "inner join dbo.LectureAsignment le on le.GroupId = st.GroupId\n"
                + "inner join dbo.Lecture lec on lec.id = le.LectureId\n"
                + "where st.id = ?;";
        try {
            PreparedStatement pre = connection.prepareCall(sql);
            pre.setString(1, studentId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Lecture le = new Lecture();
                le.setId(rs.getString("id"));
                le.setName(rs.getString("name"));
                lecture.add(le);
            }
        } catch (Exception e) {
        }
        return lecture;
    }

    public void updateFeedback(String content, String studentId, String lectureId, int idFeedback) {
        String sql = "UPDATE feedback "
                + "SET Content = ?, "
                + "Date = CURRENT_TIMESTAMP "
                + "WHERE StudentId = ? AND LectureId = ? AND idFeedBack = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, content);
            ps.setString(2, studentId);
            ps.setString(3, lectureId);
            ps.setInt(4, idFeedback);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Feedback updated successfully!");
            } else {
                System.out.println("Failed to update feedback.");
            }
        } catch (Exception e) {
        }
    }

   public void addStudent(String id, String name, String dob, String email, String imgUrl, String username) {
        String sql = "INSERT INTO Student (id, name, dob, email, imgUrl, username) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.setString(2, name);
            pre.setString(3, dob);
            pre.setString(4, email);
            pre.setString(5, imgUrl);
            pre.setString(6, username);
            pre.executeUpdate();
        } catch (SQLException e) {
            status = "Error! Can not connect: " + e.getMessage();
        }
    }

    public List<Student> getStudentById(String id) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM Student WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet res = pre.executeQuery();
            while (res.next()) {
                list.add(new Student(res.getString(1),
                        res.getString(2),
                        res.getDate(3),
                        res.getString(4),
                        res.getString(5),
                        res.getString(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

        public List<Lecture> getLectureById2(String id) {
        List<Lecture> list = new ArrayList<>();
        String sql = "SELECT * FROM Lecture WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet res = pre.executeQuery();
            while (res.next()) {
                list.add(new Lecture(res.getString(1),
                        res.getString(2),
                        res.getDate(3),
                        res.getString(4),
                        res.getString(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

   public void deleteStudent(String id) {
        String sql = "delete from Student where id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateStudent(String id, String name, String dob, String email, String imgUrl, String username) {
        String sql = "UPDATE [dbo].[Student]\n"
                + "   SET [name] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[imgUrl] = ?\n"
                + "      ,[userName] =?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, dob);
            pre.setString(3, email);
            pre.setString(4, imgUrl);
            pre.setString(5, username);
            pre.setString(6, id);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Student> searchStudent(String txtStu) {
        List<Student> list = new ArrayList<>();
        String sql = "select * from Student where name like ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + txtStu + "%");
            ResultSet res = pre.executeQuery();
            while (res.next()) {
                list.add(new Student(res.getString(1),
                        res.getString(2),
                        res.getDate(3),
                        res.getString(4),
                        res.getString(5),
                        res.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean isStudentIdExists(String id) {
        String sql = "SELECT COUNT(*) FROM Student WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet res = pre.executeQuery();
            if (res.next()) {
                int count = res.getInt(1);
                return count > 0; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }
        public boolean isLectureIdExists(String id) {
        String sql = "SELECT COUNT(*) FROM Lecture WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet res = pre.executeQuery();
            if (res.next()) {
                int count = res.getInt(1);
                return count > 0; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }

    public List<Lecture> loadAllLecture() {
        le = new Vector<Lecture>();
        String sql = "SELECT * FROM [dbo].[Lecture]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet res = pre.executeQuery();
            while (res.next()) {
                String id_1 = res.getString("id");
                String name_1 = res.getString("name");
                Date dob_1 = res.getDate("dob");
                String email_1 = res.getString("email");
                String username_1 = res.getString("username");
                le.add(new Lecture(id_1, name_1, dob_1, email_1, username_1));
            }
        } catch (Exception e) {

        }
        return le;
    }

    public void addLecture(String id, String name, String dob, String email, String username) {
        String sql = "INSERT INTO [dbo].[Lecture]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[dob]\n"
                + "           ,[email]\n"
                + "           ,[userName])\n"
                + "     VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.setString(2, name);
            pre.setString(3, dob);
            pre.setString(4, email);
            pre.setString(5, username);
            pre.executeUpdate();
        } catch (SQLException e) {
            status = "Error! Can not connect: " + e.getMessage();
        }
    }

    public void deleteLecture(String id) {
        String sql = "delete from Lecture where id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateLecture(String id, String name, String dob, String email, String username) {
        String sql = "UPDATE [dbo].[Lecture]\n"
                + "   SET [name] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[userName] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, dob);
            pre.setString(3, email);
            pre.setString(4, username);
            pre.setString(5, id);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Lecture> searchLecture(String txtLec) {
        List<Lecture> list = new ArrayList<>();
        String sql = "select * from Lecture where name like ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + txtLec + "%");
            ResultSet res = pre.executeQuery();
            while (res.next()) {
                list.add(new Lecture(res.getString(1),
                        res.getString(2),
                        res.getDate(3),
                        res.getString(4),
                        res.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Student> getStd() {
        return std;
    }

    public void setStd(List<Student> std) {
        this.std = std;
    }

    public List<Parent> getPa() {
        return pa;
    }

    public void setPa(List<Parent> pa) {
        this.pa = pa;
    }

    public List<Lecture> getLe() {
        return le;
    }

    public void setLe(List<Lecture> le) {
        this.le = le;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        String studentId = "he1";
        String lectureId = "1";
        List<Feedback> feedbackList = d.getFeedbackByLectureId(studentId, lectureId);

        // In thông tin của các phản hồi
        for (Feedback feedback : feedbackList) {
            Lecture lecture = feedback.getLecture();
            System.out.println("Feedback ID: " + feedback.getId() + ", Lecture ID: " + feedback.getLectureId() + ", Lecture Name: " + lecture.getName()
                    + ", Content: " + feedback.getContent() + ", Date: " + feedback.getDate());

        }
    }
}
