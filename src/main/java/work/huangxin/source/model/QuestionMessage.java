package work.huangxin.source.model;

import javax.persistence.*;

@Table(name = "`question_message`")
public class QuestionMessage {
    @Id
    @Column(name = "`title_id`")
    private Integer titleId;

    @Column(name = "`title_name`")
    private String titleName;

    @Column(name = "`title_type`")
    private String titleType;

    @Column(name = "`title_source`")
    private String titleSource;

    @Column(name = "`title_background`")
    private String titleBackground;

    @Column(name = "`title_content`")
    private String titleContent;

    @Column(name = "`title_require`")
    private String titleRequire;

    @Column(name = "`title_result`")
    private Integer titleResult;

    @Column(name = "`teacher_id`")
    private Integer teacherId;

    @Column(name = "`question_type`")
    private Integer questionType;
    private TeacherMessage teacherMessage;

    public TeacherMessage getTeacherMessage() {
        return teacherMessage;
    }

    public void setTeacherMessage(TeacherMessage teacherMessage) {
        this.teacherMessage = teacherMessage;
    }

    /**
     * @return title_id
     */
    public Integer getTitleId() {
        return titleId;
    }

    /**
     * @param titleId
     */
    public void setTitleId(Integer titleId) {
        this.titleId = titleId;
    }

    /**
     * @return title_name
     */
    public String getTitleName() {
        return titleName;
    }

    /**
     * @param titleName
     */
    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    /**
     * @return title_type
     */
    public String getTitleType() {
        return titleType;
    }

    /**
     * @param titleType
     */
    public void setTitleType(String titleType) {
        this.titleType = titleType;
    }

    /**
     * @return title_source
     */
    public String getTitleSource() {
        return titleSource;
    }

    /**
     * @param titleSource
     */
    public void setTitleSource(String titleSource) {
        this.titleSource = titleSource;
    }

    /**
     * @return title_background
     */
    public String getTitleBackground() {
        return titleBackground;
    }

    /**
     * @param titleBackground
     */
    public void setTitleBackground(String titleBackground) {
        this.titleBackground = titleBackground;
    }

    /**
     * @return title_content
     */
    public String getTitleContent() {
        return titleContent;
    }

    /**
     * @param titleContent
     */
    public void setTitleContent(String titleContent) {
        this.titleContent = titleContent;
    }

    /**
     * @return title_require
     */
    public String getTitleRequire() {
        return titleRequire;
    }

    /**
     * @param titleRequire
     */
    public void setTitleRequire(String titleRequire) {
        this.titleRequire = titleRequire;
    }

    /**
     * @return title_result
     */
    public Integer getTitleResult() {
        return titleResult;
    }

    /**
     * @param titleResult
     */
    public void setTitleResult(Integer titleResult) {
        this.titleResult = titleResult;
    }

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
     * @return question_type
     */
    public Integer getQuestionType() {
        return questionType;
    }

    /**
     * @param questionType
     */
    public void setQuestionType(Integer questionType) {
        this.questionType = questionType;
    }
}