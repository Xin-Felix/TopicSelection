package work.huangxin.source.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import work.huangxin.source.mapper.QuestionMessageMapper;
import work.huangxin.source.model.QuestionMessage;
import work.huangxin.source.model.StudentMessage;
import work.huangxin.source.util.SameService;

import java.util.List;

@Service
public class StudentMessageService extends SameService<StudentMessage> {

}
