package com.model2.mvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource(value="classpath:/config/common.properties")
@ImportResource(value= {"classpath:/config/context-common.xml"})

public class Miniproject2Application {

	public static void main(String[] args) {
		SpringApplication.run(Miniproject2Application.class, args);
	}

}
