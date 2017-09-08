package com.iot1.sql.goods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.goods.dao.GoodsDao;
import com.iot1.sql.goods.dto.GoodsInfo;
import com.iot1.sql.goods.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService gs;	
	@Autowired
	private GoodsDao gDao;
	
	@RequestMapping(value="/goods/list",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> getGoodsInfoList(GoodsInfo gi){
		return gs.getGoodsInfoList(gi);
	}
	
	@RequestMapping(value="/goods/create",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> insertGoodsInfoList(@RequestBody GoodsInfo[] goodsList,GoodsInfo gi){
		gs.insertGoodsInfoList(goodsList);
		return gs.getGoodsInfoList(gi);
	}
	
	@RequestMapping(value="/goods/delete",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> deleteGoodsInfoList(@RequestBody GoodsInfo[] goodsList,GoodsInfo gi){
		for(GoodsInfo gi2 : goodsList){
			System.out.println(gi2);
			gDao.deleteGoodsInfo(gi2);
		}
		return gs.getGoodsInfoList(gi);
	}
	
	@RequestMapping(value="/goods/update",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> updateGoodsInfoList(@RequestBody GoodsInfo[] goodsList,GoodsInfo gi){
		for(GoodsInfo gi2 : goodsList){
			gDao.updateGoodsInfo(gi2);
		}
		return gs.getGoodsInfoList(gi);
	}

	
	@RequestMapping(value="/goods/createone",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> insertGoodsInfo(@RequestBody GoodsInfo gi){
		gs.insertGoodsInfo(gi);
		return gs.getGoodsInfoList(gi);
	}
	
	@RequestMapping(value="/goods/deleteone",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> deleteGoodsInfo(@RequestBody GoodsInfo gi){
			gDao.deleteGoodsInfo(gi);
		return gs.getGoodsInfoList(gi);
	}
	
	@RequestMapping(value="/goods/updateone",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> updateGoodsInfo(@RequestBody GoodsInfo gi){
			gDao.updateGoodsInfo(gi);
		return gs.getGoodsInfoList(gi);
	}
    @RequestMapping(value="/goods/excel", method=RequestMethod.POST)
    public @ResponseBody
    void save(String fileName, String base64, String contentType,
            HttpServletResponse response) throws IOException {

        response.setHeader("Content-Disposition", "attachment;filename="
                + fileName);
        response.setContentType(contentType);

        byte[] data = DatatypeConverter.parseBase64Binary(base64);

        response.setContentLength(data.length);
        response.getOutputStream().write(data);
        response.flushBuffer();
    }
}
