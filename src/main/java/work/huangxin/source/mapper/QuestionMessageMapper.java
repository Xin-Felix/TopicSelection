package work.huangxin.source.mapper;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import work.huangxin.source.model.QuestionMessage;

import java.util.List;

public interface QuestionMessageMapper extends Mapper<QuestionMessage> {

    List<QuestionMessage> getRandomMessage(Integer id);


    List<QuestionMessage> getSearchResult(@Param("keyword") String keyword, @Param("id") Integer id);
}