package com.human.ielts.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.human.ielts.entity.IeltsClassEnroll;
import com.human.ielts.entity.IeltsEnrollInfo;
import com.human.ielts.entity.IeltsStudentInfo;
import com.human.ielts.service.IeltsClassEnrollService;
import com.human.ielts.service.IeltsEnrollinfoService;
import com.human.ielts.service.IeltsStudentInfoService;

@Controller
@RequestMapping(value="/ielts/teacherstudentinfo")
public class IeltsTeacherstudentinfoController {
    
    @Resource
    private IeltsStudentInfoService ieltsStudentInfoService;
    
    @Resource
    private IeltsEnrollinfoService ieltsEnrollinfoService;
    
    @Resource
    private IeltsClassEnrollService ieltsClassEnrollService;
    
    /**
     * 学员学情统计页
     * @return
     */
    @RequestMapping(value="/studentinfoview")
    public ModelAndView classview(){
        return new ModelAndView("/ielts/teacherstudent/studentinfo");
    }
    
    /**
     * 查询学员报考率
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectstudentapply")
    public Map<String, Object> selectteacherstudentapply(IeltsStudentInfo ieltsStudentInfo){
        return ieltsStudentInfoService.selectteacherstudentapply(ieltsStudentInfo);
    }
    
    /**
     * 查询成绩回收率
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectstudentrecovery")
    public Map<String, Object> selectteacherstudentrecovery(IeltsEnrollInfo ieltsEnrollInfo){
        return ieltsEnrollinfoService.selectteacherstudentrecovery(ieltsEnrollInfo);
    }
    
    /**
     * 查询成绩平均分
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectstudentaverage")
    public Map<String, Object> selectteacherstudentaverage(IeltsEnrollInfo ieltsEnrollInfo){
        return ieltsEnrollinfoService.selectteacherstudentaverage(ieltsEnrollInfo);
    }
    
    /**
     * 查询成绩分布
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectstudentmaxtotal")
    public Map<String, Object> selectteacherstudentmaxtotal(IeltsEnrollInfo ieltsEnrollInfo){
        return ieltsEnrollinfoService.selectteacherstudentmaxtotal(ieltsEnrollInfo);
    }
    
    /**
     * 班级高分学员分布
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectclasstypecount")
    public Map<String, Object> selectteacherclasstypecount(IeltsClassEnroll ieltsClassEnroll){
        return ieltsClassEnrollService.selectteacherclasstypecount(ieltsClassEnroll);
    }
    
    /**
     * 雅思学员提分达分
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectachievesource")
    public Map<String, Object> selectteacherachievesource(IeltsEnrollInfo ieltsEnrollInfo){
        return ieltsEnrollinfoService.selectteacherachievesource(ieltsEnrollInfo);
    }
    
    /**
     * 达分提分学员年级细分统计
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectgradeaverage")
    public Map<String, Object> selectteachergradeaverage(IeltsEnrollInfo ieltsEnrollInfo){
        return ieltsEnrollinfoService.selectteachergradeaverage(ieltsEnrollInfo);
    }
    
    /**
     * spring接收date参数
     * @param teacherActManager
     * @param pageView
     * @return
     */
    @org.springframework.web.bind.annotation.InitBinder  
    public void InitBinder(WebDataBinder dataBinder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        dateFormat.setLenient(false);  
        dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    }

}
