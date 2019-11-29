package work.huangxin.source.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import work.huangxin.source.mapper.QuestionMessageMapper;
import work.huangxin.source.model.QuestionMessage;
import work.huangxin.source.util.SameService;

import java.util.List;

@Service
public class QuestionMessageService extends SameService<QuestionMessage> {
    @Autowired
    private QuestionMessageMapper questionMessageMapper;


    public List<QuestionMessage> getRandomMessage(Integer id) {
        return questionMessageMapper.getRandomMessage(id);
    }


    public List<QuestionMessage> getSearchResult(String keyword,Integer id) {
        return questionMessageMapper.getSearchResult(keyword,id);
    }


}
