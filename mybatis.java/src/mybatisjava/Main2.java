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
	//상수 namespace 만듬.
	private final static String NS = "student.";
	private static SqlSessionFactory sqlMap;
	
	static{// static 초기화블럭
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		//connection 기능.
		//sqlMap에 있는 connection객체를 통해 연결을 함.
		SqlSession session = sqlMap.openSession();
		//student 테이블의 총 레코드 건수 출력하기.
		int cnt = session.selectOne(NS+"count");
		System.out.println("student 테이블의 레코드 건수:" + cnt);
		//student 모든 레코드  출력하기.
		//student.list쓰기위해선 mybatis-config.xml에서 typeAlias를 지정해줘야 함.
	    //Alias를 통해서 Student 빈클래스로 전달되어서 toString메서드를 통해 출력됨.
		List<Student> list = session.selectList(NS+"list");
		for(Student s : list) 	System.out.println(s);
		
		System.out.println("Student 테이블에 레코드 추가하기");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("홍길동");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		cnt = session.insert(NS+"insert", st);
		System.out.println("student 레코드 추가:"+cnt);
		Student stu = session.selectOne
				(NS + "selectOne", st.getStudno());
		System.out.println(stu);
		System.out.println("Student 테이블에 레코드 수정하기.");
		/*
		 * 1000번학생의 학년을 2학년으로, 몸무게 80, 키를 175로
		 * 지도교수번호를 1001로 수정하기
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
		 * 성이 김씨인 학생의 목록 조회하기
		 */
		System.out.println("성이 김씨인사람 목록 조회");
		list = session.selectList(NS + "selectname1", "김");
		for(Student s : list) System.out.println(s);
//		
		/*
		 * 101학과 학생 중 3학년 이상인 학생의 목록 조회하기
//		 */
		System.out.println("101학과 학생 중 3학년 이상인 학생");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("major1", 101);
		map.put("grade", 3);
		list = session.selectList(NS + "select3", map);
		for(Student s : list) System.out.println(s);
		
		/*몸무게가 75 이상인 학생의 목록 조회하기*/
		System.out.println("몸무게가 75 이상인 학생");
		map.clear();
		map.put("col", "weight");
		map.put("val", 75);
		list = session.selectList(NS +"select4", map);
		for(Student s : list) System.out.println(s);
		
		/*키가 175 이상인 학생의 목록 조회하기*/
		System.out.println("키가 175 이상인 학생");
		map.clear();
		map.put("col", "height");
		map.put("val", 175);
		list = session.selectList(NS + "select4", map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("주민번호 기준 여학생");
		map.clear();
		map.put("col", "substr(jumin,7,1)");
		map.put("val", "2");
		list = session.selectList(NS + "select4", map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1000번 학생 삭제 하기");
		map.clear();
		map.put("col", "studno" );
		map.put("val", 1000);
		cnt = session.delete(NS+"delete", map);
		stu = session.selectOne(NS + "selectOne", 1000);
		System.out.println(stu);//null로 나타남.
		
		
		System.out.println("유진성 학생 삭제하기");
		map.clear();
		map.put("col", "name");
		map.put("val", "유진성");
		cnt = session.delete(NS+"delete", map);
		stu = session.selectOne(NS+"selectOne", 971211);
		System.out.println(stu);//null로 나타남.
				
		
	}

}
