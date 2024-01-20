package student;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Student {
	
	private String gender;
	private String name;
	private String discipline;
	private String course;
	
	@GeneratedValue
	private Integer id;

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}

	public String getDiscipline() {
		return discipline;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getCourse() {
		return course;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
}

