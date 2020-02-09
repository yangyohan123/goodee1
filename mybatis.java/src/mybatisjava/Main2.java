package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2 {
	//��� namespace ����.
	private final static String NS = "student.";
	private static SqlSessionFactory sqlMap;
	
	static{// static �ʱ�ȭ��
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		//connection ���.
		//sqlMap�� �ִ� connection��ü�� ���� ������ ��.
		SqlSession session = sqlMap.openSession();
		//student ���̺��� �� ���ڵ� �Ǽ� ����ϱ�.
		int cnt = session.selectOne(NS+"count");
		System.out.println("student ���̺��� ���ڵ� �Ǽ�:" + cnt);
		//student ��� ���ڵ�  ����ϱ�.
		//student.list�������ؼ� mybatis-config.xml���� typeAlias�� ��������� ��.
	    //Alias�� ���ؼ� Student ��Ŭ������ ���޵Ǿ toString�޼��带 ���� ��µ�.
		List<Student> list = session.selectList(NS+"list");
		for(Student s : list) 	System.out.println(s);
		
		System.out.println("Student ���̺� ���ڵ� �߰��ϱ�");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("ȫ�浿");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		cnt = session.insert(NS+"insert", st);
		System.out.println("student ���ڵ� �߰�:"+cnt);
		Student stu = session.selectOne
				(NS + "selectOne", st.getStudno());
		System.out.println(stu);
		System.out.println("Student ���̺� ���ڵ� �����ϱ�.");
		/*
		 * 1000���л��� �г��� 2�г�����, ������ 80, Ű�� 175��
		 * ����������ȣ�� 1001�� �����ϱ�
		 */
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(175);
		st.setProfno(1001);
		cnt = session.update(NS + "update", st);
		stu = session.selectOne
				(NS + "selectOne", st.getStudno());
		System.out.println(stu);
		
		/*
		 * ���� �达�� �л��� ��� ��ȸ�ϱ�
		 */
		System.out.println("���� �达�λ�� ��� ��ȸ");
		list = session.selectList(NS + "selectname1", "��");
		for(Student s : list) System.out.println(s);
//		
		/*
		 * 101�а� �л� �� 3�г� �̻��� �л��� ��� ��ȸ�ϱ�
//		 */
		System.out.println("101�а� �л� �� 3�г� �̻��� �л�");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("major1", 101);
		map.put("grade", 3);
		list = session.selectList(NS + "select3", map);
		for(Student s : list) System.out.println(s);
		
		/*�����԰� 75 �̻��� �л��� ��� ��ȸ�ϱ�*/
		System.out.println("�����԰� 75 �̻��� �л�");
		map.clear();
		map.put("col", "weight");
		map.put("val", 75);
		list = session.selectList(NS +"select4", map);
		for(Student s : list) System.out.println(s);
		
		/*Ű�� 175 �̻��� �л��� ��� ��ȸ�ϱ�*/
		System.out.println("Ű�� 175 �̻��� �л�");
		map.clear();
		map.put("col", "height");
		map.put("val", 175);
		list = session.selectList(NS + "select4", map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("�ֹι�ȣ ���� ���л�");
		map.clear();
		map.put("col", "substr(jumin,7,1)");
		map.put("val", "2");
		list = session.selectList(NS + "select4", map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1000�� �л� ���� �ϱ�");
		map.clear();
		map.put("col", "studno" );
		map.put("val", 1000);
		cnt = session.delete(NS+"delete", map);
		stu = session.selectOne(NS + "selectOne", 1000);
		System.out.println(stu);//null�� ��Ÿ��.
		
		
		System.out.println("������ �л� �����ϱ�");
		map.clear();
		map.put("col", "name");
		map.put("val", "������");
		cnt = session.delete(NS+"delete", map);
		stu = session.selectOne(NS+"selectOne", 971211);
		System.out.println(stu);//null�� ��Ÿ��.
				
		
	}

}
