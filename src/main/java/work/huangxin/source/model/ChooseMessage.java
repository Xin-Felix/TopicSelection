package work.huangxin.source.model;

import javax.persistence.*;

@Table(name = "`choose_message`")
public class ChooseMessage {
    @Id
    @Column(name = "`choose_id`")
    private Integer chooseId;

    @Column(name = "`choose_question_id`")
    private Integer chooseQuestionId;

    @Column(name = "`choose_student_id`")
    private Integer chooseStudentId;

    @Column(name = "`choose_teacher_id`")
    private Integer chooseTeacherId;

    @Column(name = "`choose_teacher_result`")
    private Integer chooseTeacherResult;

    /**
     * @return choose_id
     */
    public Integer getChooseId() {
        return chooseId;
    }

    /**
     * @param chooseId
     */
    public void setChooseId(Integer chooseId) {
        this.chooseId = chooseId;
    }

    /**
     * @return choose_question_id
     */
    public Integer getChooseQuestionId() {
        return chooseQuestionId;
    }

    /**
     * @param chooseQuestionId
     */
    public void setChooseQuestionId(Integer chooseQuestionId) {
        this.chooseQuestionId = chooseQuestionId;
    }

    /**
     * @return choose_student_id
     */
    public Integer getChooseStudentId() {
        return chooseStudentId;
    }

    /**
     * @param chooseStudentId
     */
    public void setChooseStudentId(Integer chooseStudentId) {
        this.chooseStudentId = chooseStudentId;
    }

    /**
     * @return choose_teacher_id
     */
    public Integer getChooseTeacherId() {
        return chooseTeacherId;
    }

    /**
     * @param chooseTeacherId
     */
    public void setChooseTeacherId(Integer chooseTeacherId) {
        this.chooseTeacherId = chooseTeacherId;
    }

    /**
     * @return choose_teacher_result
     */
    public Integer getChooseTeacherResult() {
        return chooseTeacherResult;
    }

    /**
     * @param chooseTeacherResult
     */
    public void setChooseTeacherResult(Integer chooseTeacherResult) {
        this.chooseTeacherResult = chooseTeacherResult;
    }
}