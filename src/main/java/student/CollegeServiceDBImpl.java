package student;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class CollegeServiceDBImpl implements CollegeRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List getStudents() {
		 String SQL = "select * from collegestudent";
		 //System.out.println("*****vidya3****"+jdbcTemplate+SQL);
		 List <Student> students = jdbcTemplate.query(SQL, new CollegeMapper());
		
		return students;
	}


	@Override
	public void create(String name, String gender,String discipline,String course) {
		String SQL = "insert into collegestudent (name, gender,discipline,course) values (?, ?, ?, ?)";
		jdbcTemplate.update(SQL,name,gender,discipline,course);
		return;
		
	}


	@Override
	public void delete(Integer id) {
		String SQL = "delete from collegestudent where id = ?";
		jdbcTemplate.update(SQL, id);
		
	}


	@Override
	public Student getStudent(Integer id) {
		String SQL = "select * from collegestudent where id = ?";
		Student student = jdbcTemplate.queryForObject(SQL,new Object[]{id}, new CollegeMapper());
		return student;
	}


	@Override
	public void update(Integer id, String name,String gender, String discipline,String course) {
		String SQL = "update collegestudent set name = ?,course = ?,discipline = ?,gender = ? where id = ?";
		jdbcTemplate.update(SQL, name, course,discipline,gender, id);
	    return;
	}


	@Override
	public <S extends Student> S save(S entity) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public <S extends Student> Iterable<S> saveAll(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Optional<Student> findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean existsById(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public Iterable<Student> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Iterable<Student> findAllById(Iterable<Integer> ids) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Student entity) {
		// TODO Auto-generated method stub
		
	}




	@Override
	public void deleteAll(Iterable<? extends Student> entities) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteAllById(Iterable<? extends Integer> ids) {
		// TODO Auto-generated method stub
		
	}
}