package cds.com;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

import static com.google.common.collect.Lists.newArrayList;

/**
 * @author edison
 * SwaggerConfig
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    /**
     * 可以定义多个组，比如本类中定义把test和demo区分开了
     * （访问页面就可以看到效果了） 
     *
     */
    @Bean
    public Docket testApi() {
        return new Docket(DocumentationType.SWAGGER_2)
        		 .apiInfo(apiInfo())
                 .select()
                 .apis(RequestHandlerSelectors.basePackage("cds.com.demo.webapp"))
                 .paths(PathSelectors.any())
                 .build();
        }



    private ApiInfo apiInfo() {
        ApiInfo apiInfo = new ApiInfo("SpringBoot学习demo",
                "Spring boot + swagger + mybatis + druid",
                "1.0",
                "NO terms of service",
                 new Contact("admin@raye.wang","","admin@raye.wang"),
                "RayeBlog",
                "http://www.raye.wang/",
                new ArrayList()

        );

        return apiInfo;
    }
}