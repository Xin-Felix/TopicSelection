package work.huangxin.source.model;

import javax.persistence.*;

@Table(name = "`student_message`")
public class StudentMessage {
    @Id
    @Column(name = "`student_id`")
    private Integer studentId;

    @Column(name = "`student_code`")
    private String studentCode;

    @Column(name = "`student_password`")
    private String studentPassword;

    @Column(name = "`student_name`")
    private String studentName;

    @Column(name = "`student_major`")
    private String studentMajor;

    @Column(name = "`student_phone`")
    private String studentPhone;

    @Column(name = "`student_qq`")
    private String studentQq;

    @Override
    public String toString() {
        return "StudentMessage{" +
                "studentId=" + studentId +
                ", studentCode='" + studentCode + '\'' +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentMajor='" + studentMajor + '\'' +
                ", studentPhone='" + studentPhone + '\'' +
                ", studentQq='" + studentQq + '\'' +
                '}';
    }

    /**
     * @return student_id
     */
    public Integer getStudentId() {
        return studentId;
    }

    /**
     * @param studentId
     */
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    /**
     * @return student_code
     */
    public String getStudentCode() {
        return studentCode;
    }

    /**
     * @param studentCode
     */
    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    /**
     * @return student_password
     */
    public String getStudentPassword() {
        return studentPassword;
    }

    /**
     * @param studentPassword
     */
    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    /**
     * @return student_name
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * @param studentName
     */
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    /**
     * @return student_major
     */
    public String getStudentMajor() {
        return studentMajor;
    }

    /**
     * @param studentMajor
     */
    public void setStudentMajor(String studentMajor) {
        this.studentMajor = studentMajor;
    }

    /**
     * @return student_phone
     */
    public String getStudentPhone() {
        return studentPhone;
    }

    /**
     * @param studentPhone
     */
    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    /**
     * @return student_qq
     */
    public String getStudentQq() {
        return studentQq;
    }

    /**
     * @param studentQq
     */
    public void setStudentQq(String studentQq) {
        this.studentQq = studentQq;
    }
}