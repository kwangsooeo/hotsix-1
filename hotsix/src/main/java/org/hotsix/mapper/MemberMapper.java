package org.hotsix.mapper;

import org.apache.ibatis.annotations.Select;
import org.hotsix.member.MemberVO;

public interface MemberMapper {
	
	@Select("select count(*) memberChkCount, authority, id, nickname, name  from tbl_member where id=#{id} and pw=#{pw}")
	public MemberVO loginChk(MemberVO vo);
}
