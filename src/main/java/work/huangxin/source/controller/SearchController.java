package work.huangxin.source.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import work.huangxin.source.model.QuestionMessage;
import work.huangxin.source.model.StudentMessage;
import work.huangxin.source.service.QuestionMessageService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private QuestionMessageService questionMessageService;

    @GetMapping("/login/success/search")
    public String returnSearchPage(HttpServletRequest httpRequest, Model model) {
        Object info = httpRequest.getSession().getAttribute("info");
        StudentMessage studentMessage = (StudentMessage) info;
        model.addAttribute("info", studentMessage);
        return "search";
    }

    @GetMapping("/login/success/search/{keyword}")
    public String returnSearchResult(HttpServletRequest httpRequest, Model model, @PathVariable String keyword) {
        Object info = httpRequest.getSession().getAttribute("info");
        StudentMessage studentMessage = (StudentMessage) info;

        List<QuestionMessage> searchResult = questionMessageService.getSearchResult(keyword, Integer.parseInt(studentMessage.getStudentMajor()));

        model.addAttribute("info", studentMessage);
        model.addAttribute("question", searchResult);
        return "search";
    }
}
