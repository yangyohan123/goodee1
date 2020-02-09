package mybatisjava;

import java.io.IOException;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Member;

public class Main1 {

	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
	
			//mapper ��Ű���� mybatis-config.xml�� �б�
			reader = Resources.getResourceAsReader
					("mapper/mybatis-config.xml");
			//mybatis ȯ���� �о �����̳ʿ� ������.
			//1. connection ����
			//2. sql ���� ����.
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		//Connection���� session�Ҵ�
		SqlSession session = sqlMap.openSession();
		//selectOne : �����͸� db�� ���� ��ȸ��.
		//			    ����� ���ڵ� 1���� ���
		//member.count : sql ������ id�Ӽ���
		x = (Integer)session.selectOne("member.count");
		System.out.println("member ���̺��� ���ڵ� ����:"+x);
		//selectList : �����͸� db�� ���� ��ȸ�ϱ�.
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		//admin ������ ��ȸ�ϱ�
		Member m = session.selectOne("member.selectid", "admin");
		System.out.println(m);
		System.out.println("�̸��� �׽�Ʈ�� ������ �ִ� ��� ��ȸ�ϱ�");
		list = session.selectList("member.selectname", "�׽�Ʈ1");
		for(Member mem : list) {
			System.out.println(mem);
		}
	    //�Ű������� ������ �ϳ����� �Ѵ�.
		//list = session.selectList("member.selectidname", "��","test");
		System.out.println("�̸��� �׽�Ʈ1�̰� id�� test1�� ��� ��ȸ�ϱ�");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", "test1");
		map.put("name", "�׽�Ʈ1");
		list = session.selectList("member.selectidname", map);
		for(Member mem : list) {
			System.out.println(mem);
		}
	}

}
