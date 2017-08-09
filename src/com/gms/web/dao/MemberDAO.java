package com.gms.web.dao;
import java.util.List;

import com.gms.web.domain.MemberBean;
public interface MemberDAO {
	public String insert(MemberBean bean);
	public List<MemberBean> selectAll(); 
	public List<MemberBean> selectByName(String name);
	public MemberBean selectById(String id);
	public String count();
	public String update(MemberBean member);
	public String delete(String id);

}
