

package work.huangxin.source.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import work.huangxin.source.model.Admin;
import work.huangxin.source.model.ChooseMessage;
import work.huangxin.source.model.StudentMessage;
import work.huangxin.source.model.TeacherMessage;
import work.huangxin.source.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private QuestionMessageService questionMessageService;
    @Autowired
    private StudentMessageService studentMessageService;
    @Autowired
    private ChooseMessageService chooseMessageService;
    @Autowired
    private TeacherMessageService teacherMessageService;
    @Autowired
    private AdminService adminService;

    /**
     * 学生1
     * 老师2
     * 院长3
     * 教研主任4
     * 教秘5
     */

    @GetMapping("/")
    public String returnModel() {
        return "index";
    }

    @PostMapping("/login")
    @ResponseBody
    public String loginResult(@RequestBody StudentMessage studentMessage, HttpServletRequest httpRequest, Model model) {
        Integer count = studentMessageService.findCount(studentMessage);


/**
 * 登录成功200
 * 有问题400
 */
        if (count == 0) {
            TeacherMessage teacherMessage = new TeacherMessage();
            teacherMessage.setTeacherCode(studentMessage.getStudentCode());
            teacherMessage.setTeacherPassword(studentMessage.getStudentPassword());
            Integer teacher = teacherMessageService.findCount(teacherMessage);
            if (teacher == 1) {
                httpRequest.getSession().setAttribute("info", teacherMessage);
                httpRequest.getSession().setAttribute("userType", 2);
                return "200";
            } else {
                Admin admin = new Admin();
                admin.setAdminUsername(studentMessage.getStudentCode());
                admin.setAdminPassword(studentMessage.getStudentPassword());
                Integer admins = adminService.findCount(admin);
                if (admins == 1) {
                    httpRequest.getSession().setAttribute("info", admin);
                    httpRequest.getSession().setAttribute("userType", 3);
                    return "200";
                }
            }
            return "400";
        } else if (count == 1) {
            List<StudentMessage> list = studentMessageService.findList(studentMessage);
            httpRequest.getSession().setAttribute("info", list.get(0));
            httpRequest.getSession().setAttribute("userType", 1);
            return "200";
        }

        return "400";
    }

    @GetMapping("/login/success")
    public String returnSuccessResult(HttpServletRequest httpRequest, Model model) {
        Object info = httpRequest.getSession().getAttribute("info");
        int userType = Integer.parseInt(httpRequest.getSession().getAttribute("userType") + "");
        if (info == null) {
            return "index";
        }
        /**
         * 1为计科
         * 2软件
         * 3信管
         * 4物联网
         * 5通用
         */
        if (userType == 1) {
            StudentMessage studentMessage = (StudentMessage) info;
            List<StudentMessage> list = studentMessageService.findList(studentMessage);
            ChooseMessage chooseMessage = new ChooseMessage();
            chooseMessage.setChooseStudentId(studentMessage.getStudentId());
            List<ChooseMessage> list1 = chooseMessageService.findList(chooseMessage);
            if (list1.size() == 1) {
                model.addAttribute("question", null);
                model.addAttribute("me_question", questionMessageService.getById(list1.get(0).getChooseQuestionId()));
                model.addAttribute("me_teacher", teacherMessageService.getById(list1.get(0).getChooseTeacherId()));
            } else {
                model.addAttribute("question", questionMessageService.getRandomMessage(Integer.parseInt(studentMessage.getStudentMajor())));
            }

        }

        if (userType == 2) {
            TeacherMessage teacherMessage = (TeacherMessage) info;
            List<TeacherMessage> list = teacherMessageService.findList(teacherMessage);
            model.addAttribute("info", list.get(0));
            return "main_teacher";
        }

        if (userType == 3) {
            Admin admin = (Admin) info;
            List<Admin> list = adminService.findList(admin);
            userType = Integer.parseInt(list.get(0).getAdminType());
            httpRequest.getSession().setAttribute("userType", userType);
            model.addAttribute("info", list.get(0));
        }
        return "main_student";
    }

    @GetMapping("/exit")
    public String exit(HttpServletRequest httpRequest) {
        httpRequest.getSession().invalidate();
        return "index";
    }
}
