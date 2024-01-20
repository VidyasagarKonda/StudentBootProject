package student;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class CollegeMapper implements RowMapper<Student> {

	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
	      Student student = new Student();
	      student.setId(rs.getInt("id"));
	      student.setName(rs.getString("name"));
	      student.setGender(rs.getString("gender"));
	      student.setDiscipline(rs.getString("discipline"));
	      student.setCourse(rs.getString("course"));
	      
	      return student;
	   }
}
