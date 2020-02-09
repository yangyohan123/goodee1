package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 ���ӽ����̽��� sql ����
/*
 * interface ������� �̿��� mybatis ���
 * 	�޼����� �̸� : (xml)id �Ӽ���. sql������ ������ �ִ� Ű��.
 * 			      �ߺ��� ���� ���� �� ����. �����ε� �Ұ�
 * 		              ���� xml������ ���� id�̸��� ��� �� �� ����. �߿�!! 
 * 
 * 	�Ű����� : (xml)parameterType �Ӽ���.  => �ΰ� �̻��� ���� �Ű��������� �Ұ�.
 * 									  => �ΰ� �̻��� ���� map, ��ü��  �����ؾ� �Ѵ�.
 * 									  => �ΰ��̻��� �Ű����� ������ ������̼��� �̿��Ͽ� ���������� map
 * 										 ��ü ���� ����.
 * 	���� Ÿ�� : resultType �Ӽ����� �ǹ�
 */
public interface StudentMapper3 {
//	@Select("select * from student")
	@Select({"<script>",
	"select * from student",
	" <if test='grade != null'> where grade=#{grade}</if>",
	" <if test='studno != null'> where studno=#{studno}</if>",
	"</script>"
	})
	List<Student> select(Map map); //(���ӽ����̽�)mapper.StudentMapper3.select
	
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
