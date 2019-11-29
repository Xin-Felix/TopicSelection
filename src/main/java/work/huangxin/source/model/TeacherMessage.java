package work.huangxin.source.model;

import javax.persistence.*;

@Table(name = "`teacher_message`")
public class TeacherMessage {
    @Id
    @Column(name = "`teacher_id`")
    private Integer teacherId;

    @Column(name = "`teacher_code`")
    private String teacherCode;

    @Column(name = "`teacher_password`")
    private String teacherPassword;

    @Column(name = "`teacher_name`")
    private String teacherName;

    @Column(name = "`teacher_level`")
    private String teacherLevel;

    @Column(name = "`teacher_direction`")
    private String teacherDirection;

    @Column(name = "`teacher_source`")
    private String teacherSource;

    /**
     * @return teacher_id
     */
    public Integer getTeacherId() {
        return teacherId;
    }

    /**
     * @param teacherId
     */
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    /**
     * @return teacher_code
     */
    public String getTeacherCode() {
        return teacherCode;
    }

    /**
     * @param teacherCode
     */
    public void setTeacherCode(String teacherCode) {
        this.teacherCode = teacherCode;
    }

    /**
     * @return teacher_password
     */
    public String getTeacherPassword() {
        return teacherPassword;
    }

    /**
     * @param teacherPassword
     */
    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    /**
     * @return teacher_name
     */
    public String getTeacherName() {
        return teacherName;
    }

    /**
     * @param teacherName
     */
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    /**
     * @return teacher_level
     */
    public String getTeacherLevel() {
        return teacherLevel;
    }

    /**
     * @param teacherLevel
     */
    public void setTeacherLevel(String teacherLevel) {
        this.teacherLevel = teacherLevel;
    }

    /**
     * @return teacher_direction
     */
    public String getTeacherDirection() {
        return teacherDirection;
    }

    /**
     * @param teacherDirection
     */
    public void setTeacherDirection(String teacherDirection) {
        this.teacherDirection = teacherDirection;
    }

    /**
     * @return teacher_source
     */
    public String getTeacherSource() {
        return teacherSource;
    }

    /**
     * @param teacherSource
     */
    public void setTeacherSource(String teacherSource) {
        this.teacherSource = teacherSource;
    }
}