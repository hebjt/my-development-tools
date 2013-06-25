package com.tanghsk.sync.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.tanghsk.sync.domain.ViewQuestionList;

@Repository("viewQuestionMapper")
public interface ViewQuestionListMapper {
    
    List<ViewQuestionList> getAllQuestion(ViewQuestionList view);
}