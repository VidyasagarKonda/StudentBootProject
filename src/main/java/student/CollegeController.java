package student;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
@CrossOrigin

@RestController
public class CollegeController {
	//String LINKURL = "http://localhost:8080/";
	//String LINKURL = " https://vidyasagar-app.herokuapp.com/";
	
	@Autowired
	 CollegeRepository collegeservicedbimpl;
		
	
	// ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	// StudentServiceDBImpl collegeservicedbimpl
	// =(StudentServiceDBImpl)context.getBean("collegeservicedbimpl");
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	   public ModelAndView student() {
	      return new ModelAndView("StudentForm", "command", new Student());
	   }*/
	
	
	
	@ResponseBody
	@RequestMapping(value = "/Student", method = RequestMethod.GET)
	public String studentlist() {
		try {
		List<Student> students = collegeservicedbimpl.getStudents();
		JSONObject jsonobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		for (Student record : students) {
			JSONObject jobj = new JSONObject();
			jobj.put("ID" , record.getId());
			jobj.put("Name", record.getName());
			jobj.put("Gender", record.getGender());
			jobj.put("Discipline", record.getDiscipline());
			jobj.put("Course", record.getCourse());
			jarr.put(jobj);
		}
		jsonobj.put("Data", jarr);
		return jarr.toString();
		}catch (Exception e) {
			return "Some thing went wrong";
		}
	}
	@RequestMapping(value = "/Student", method = RequestMethod.POST)
	@ResponseBody
	public String createstudent(Student student) {
	String 	name = student.getName();
	String 	gender = student.getGender();
	String 	discipline = student.getDiscipline();
	String 	course = student.getCourse();
	
		collegeservicedbimpl.create(name, gender,discipline,course);
		List<Student> students = collegeservicedbimpl.getStudents();
		JSONObject actionobj = new JSONObject();
		JSONObject functionobj = new JSONObject();
		JSONObject statusobj = new JSONObject();
		JSONObject okobj = new JSONObject();
		JSONObject jobj = new JSONObject();
		for (Student record : students) {
			jobj.put("ID", record.getId());
			jobj.put("Name", record.getName());
			jobj.put("Gender", record.getGender());
			jobj.put("Discipline", record.getDiscipline());
			jobj.put("Course", record.getCourse());
		}
		actionobj.put("function", "create");
		actionobj.put("action", jobj);
		statusobj.put("data", actionobj);

		okobj.put("Status :OK", statusobj);

		return statusobj.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/Student", method = RequestMethod.PUT)
	public String updatestudent(@RequestParam int id, @RequestParam String name, @RequestParam String gender, @RequestParam String discipline, @RequestParam String course ) {
		try {
			Student old = collegeservicedbimpl.getStudent(id);
			collegeservicedbimpl.update(id, name,gender,discipline,course);
			JSONObject oldData = new JSONObject();
			oldData.put("ID", old.getId());
			oldData.put("Name", old.getName());
			oldData.put("Gender", old.getGender());
			oldData.put("Discipline", old.getDiscipline());
			oldData.put("Course", old.getCourse());
			String str = oldData.toString();

			Student s = collegeservicedbimpl.getStudent(id);
			JSONObject ndata = new JSONObject();
			ndata.put("ID", s.getId());
			ndata.put("Name", s.getName());
			ndata.put("Gender", s.getGender());
			ndata.put("Discipline", s.getDiscipline());
			ndata.put("Course", s.getCourse());
			String newstr = "Updated Age of : " + str + " to " + ndata.toString();
			return newstr;
		} catch (Exception e) {
			return "Data not found with ID : " + id;
		}

	}

	@RequestMapping(value = "/Student", method = RequestMethod.DELETE)
	@ResponseBody
	public String deletestudent(@RequestParam int id) {
		try {
			Student old = collegeservicedbimpl.getStudent(id);
			collegeservicedbimpl.delete(id);
			
			JSONObject oldData = new JSONObject();
			oldData.put("ID", old.getId());
			oldData.put("Name", old.getName());
			oldData.put("Gender", old.getGender());
			oldData.put("Discipline", old.getDiscipline());
			oldData.put("Course", old.getCourse());
			String str = oldData.toString();
			
			return "Deleted Student record of : " + str;
		} catch (Exception e) {
			return "Data not found with ID :" + id;
		}
	}
}
