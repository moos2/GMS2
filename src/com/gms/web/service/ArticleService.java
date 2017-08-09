package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.ArticleBean;

public interface ArticleService {
	public String write(ArticleBean bean);
	public List<ArticleBean> list(); //목록을 가져와서 보여주기
	public List<ArticleBean> findByName(String name);
	public List<ArticleBean> findById(String id);
	public ArticleBean findBySeq(String seq);
	public String count();
	public String modify(ArticleBean bean);
	public String remove(String id);
}
