package work.huangxin.source.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import work.huangxin.source.model.ChooseMessage;
import work.huangxin.source.model.QuestionMessage;
import work.huangxin.source.model.StudentMessage;
import work.huangxin.source.service.ChooseMessageService;
import work.huangxin.source.service.QuestionMessageService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ChooseQuestionController {

    @Autowired
    private QuestionMessageService questionMessageService;
    @Autowired
    private ChooseMessageService chooseMessageService;

    /**
     * 200选课成功
     * 400数据错误,或者已经选择题目
     * 500课程已经被选择
     *
     * @param httpRequest
     * @param questionId
     * @return
     */
    @Transactional
    @GetMapping("/login/success/choose")
    @ResponseBody
    public Integer chooseQuestion(HttpServletRequest httpRequest, String questionId) {
        Object info = httpRequest.getSession().getAttribute("info");
        StudentMessage student = (StudentMessage) info;
        ChooseMessage chooseMessage = new ChooseMessage();
        chooseMessage.setChooseQuestionId(Integer.parseInt(questionId));
        if (chooseMessageService.findCount(chooseMessage) != 0) {
            return 400;
        }

//        ChooseMessage chooseMessage2 = new ChooseMessage();
//        chooseMessage2.setChooseQuestionId(Integer.parseInt(questionId));
//        if (chooseMessageService.findCount(chooseMessage2) != 0) {
//            return 400;
//        }

        QuestionMessage question = questionMessageService.getById(questionId);
        if (question == null) {
            return 500;
        }
        ChooseMessage chooseMessage3 = new ChooseMessage();
        chooseMessage3.setChooseStudentId(student.getStudentId());
        chooseMessage3.setChooseTeacherId(question.getTeacherId());
        chooseMessage3.setChooseQuestionId(Integer.parseInt(questionId));
        chooseMessage3.setChooseTeacherResult(1);
        chooseMessageService.add(chooseMessage3);
        return 200;
    }

}
