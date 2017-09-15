package com.iot1.sql.mediaplayer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mediaplayer-home-controller")
@RequestMapping(value = "/mediaplayer/")
public class MediaController {
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index() {
        return "mediaplayer/index";
    }
}
