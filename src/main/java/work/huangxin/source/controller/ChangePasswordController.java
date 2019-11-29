package work.huangxin.source.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import work.huangxin.source.model.Admin;
import work.huangxin.source.model.StudentMessage;
import work.huangxin.source.model.TeacherMessage;
import work.huangxin.source.service.AdminService;
import work.huangxin.source.service.StudentMessageService;
import work.huangxin.source.service.TeacherMessageService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ChangePasswordController {

    @Autowired
    private StudentMessageService studentMessageService;
    @Autowired
    private TeacherMessageService teacherMessageService;
    @Autowired
    private AdminService adminService;

    @GetMapping("/login/success/changePassword")
    public String returnChangePassword() {
        return "changePassword";
    }

    @Transactional
    @PostMapping("/login/success/changePassword/{password}")
    @ResponseBody
    public Integer returnCode(@PathVariable String password, HttpServletRequest httpServletRequest) {
        Object info = httpServletRequest.getSession().getAttribute("info");

        int userType = Integer.parseInt(httpServletRequest.getSession().getAttribute("userType") + "");
        if (userType == 1) {
            StudentMessage student = (StudentMessage) info;
            StudentMessage studentMessage = new StudentMessage();
            studentMessage.setStudentCode(student.getStudentCode());
            studentMessage.setStudentId(student.getStudentId());
            studentMessage.setStudentPassword(password);
            studentMessageService.update(studentMessage);
        }
        if (userType == 2) {
            TeacherMessage teacher = (TeacherMessage) info;
            TeacherMessage teacherMessage = new TeacherMessage();
            teacherMessage.setTeacherId(teacher.getTeacherId());
            teacherMessage.setTeacherCode(teacher.getTeacherCode());
            teacherMessage.setTeacherPassword(password);
            teacherMessageService.update(teacherMessage);

        }
        if (userType == 3) {
            Admin admin = (Admin) info;
            Admin adminMessage = new Admin();
            adminMessage.setAdminId(admin.getAdminId());
            adminMessage.setAdminPassword(password);
            adminService.update(adminMessage);
        }
        return 200;
    }
}
