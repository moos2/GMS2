package com.gms.web.command;

import com.gms.web.constants.Extension;
import com.gms.web.constants.Path;
public class Command implements Commandable{
	protected String dir,action,page,view;

	public String getView() {
		return view;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	@Override
	public void process() {
		// TODO Auto-generated method stub
		this.view=Path.VIEW+dir+Path.SEPARATOR+page+Extension.JSP;
	}

	@Override
	public String toString() {
		return "Command [directory(DEST)=" + dir +"/"+page+".jsp"+",ACTION= "+action+"]";
	}
	
}
