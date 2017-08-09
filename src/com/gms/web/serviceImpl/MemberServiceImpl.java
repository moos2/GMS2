package com.gms.web.serviceImpl;

import java.util.List;

import com.gms.web.daoImpl.MemberDAOImpl;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;

public class MemberServiceImpl implements MemberService {
	public static MemberServiceImpl instance = new MemberServiceImpl();
	
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	private MemberServiceImpl() {}

	@Override
	public String addMember(MemberBean member) {
		return  MemberDAOImpl.getInstance().insert(member);
	}

	@Override
	public String count() {
		return String.valueOf(MemberDAOImpl.getInstance().count());
	}

	@Override
	public List<MemberBean> list() {
		return MemberDAOImpl.getInstance().selectAll();
	}

	@Override
	public MemberBean findById(String id) {
		return MemberDAOImpl.getInstance().selectById(id);
	}

	@Override
	public List<MemberBean> findByName(String name) {
		return MemberDAOImpl.getInstance().selectByName(name);
	}

	@Override
	public String modify(MemberBean bean) {
		return MemberDAOImpl.getInstance().update(bean);
	}

	@Override
	public String remove(String deleteId) {
		return MemberDAOImpl.getInstance().delete(deleteId);
	}
	@Override
	public String login(MemberBean bean) {
		MemberBean m = findById(bean.getId());
		return (m!=null)?(bean.getPassword().equals(m.getPassword()))?"main":"login_fail":"join";
	}
}