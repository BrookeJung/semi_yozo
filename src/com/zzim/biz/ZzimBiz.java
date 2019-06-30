package com.zzim.biz;

import java.util.List;

import com.zzim.dao.ZzimDao;
import com.zzim.dto.ZzimDto;

public class ZzimBiz {
	
	ZzimDao dao = new ZzimDao ();
	
	public int zzimInsert(ZzimDto dto) {
		return dao.zzimInsert(dto);
	}
	
	public List<ZzimDto> zzimList(String id){
		return dao.zzimList(id);
	}

	public int zzimDelete(int seq) {
		return dao.zzimDelete(seq);
	}
	public int zzimmuldel(String[] seqArr) {
		return dao.zzimmuldel(seqArr);
	}
	
	
}
	
