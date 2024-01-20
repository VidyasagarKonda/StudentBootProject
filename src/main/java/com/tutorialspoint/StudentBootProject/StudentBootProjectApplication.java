package com.tutorialspoint.StudentBootProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
@Configuration
@ComponentScan(basePackages = { "student" })
@EnableAutoConfiguration
public class StudentBootProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudentBootProjectApplication.class, args);
	}

}
