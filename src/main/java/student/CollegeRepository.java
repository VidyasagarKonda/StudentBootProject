package student;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Primary
@Repository
public interface CollegeRepository extends CrudRepository<Student , Integer> {
	
	public void create(String name, String gender, String course, String discipline);
	public Student getStudent(Integer id);
	public List<Student> getStudents();
	public void update(Integer id, String name,String gender, String discipline,String course);
	public void delete(Integer id);

}
