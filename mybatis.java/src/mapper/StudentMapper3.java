package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 네임스페이스의 sql 구문
/*
 * interface 방식으로 이용한 mybatis 사용
 * 	메서드의 이름 : (xml)id 속성값. sql구문을 가지고 있는 키값.
 * 			      중복된 값을 가질 수 없다. 오버로딩 불가
 * 		              또한 xml에서도 같은 id이름을 사용 할 수 없다. 중요!! 
 * 
 * 	매개변수 : (xml)parameterType 속석값.  => 두개 이상의 값을 매개변수지정 불가.
 * 									  => 두개 이상의 값은 map, 빈객체로  지정해야 한다.
 * 									  => 두개이상의 매개변수 지정시 어노테이션을 이용하여 내부적으로 map
 * 										 객체 생성 가능.
 * 	리턴 타입 : resultType 속성값을 의미
 */
public interface StudentMapper3 {
//	@Select("select * from student")
	@Select({"<script>",
	"select * from student",
	" <if test='grade != null'> where grade=#{grade}</if>",
	" <if test='studno != null'> where studno=#{studno}</if>",
	"</script>"
	})
	List<Student> select(Map map); //(네임스페이스)mapper.StudentMapper3.select
	
	@Insert("insert into student (studno, name, jumin,id)"
			+ "values(#{studno},#{name},#{jumin},#{id})")
	int insert(Student st);
	
	@Update("update student set grade=#{grade}, weight=#{weight}, "
			+ "height=#{height} where studno = #{studno}")
	int update(Student st);
	
	@Delete("delete from student where studno=#{studno} and name=#{name}")
	int delete(@Param("name") String string, @Param("studno") int studno);
//	int delete(Student st);
//	int delete(String name);
}
