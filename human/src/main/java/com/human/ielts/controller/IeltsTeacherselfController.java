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

import com.human.ielts.entity.IeltsTeacherArticle;
import com.human.ielts.entity.IeltsTeacherAttendance;
import com.human.ielts.entity.IeltsTeacherCertificate;
import com.human.ielts.entity.IeltsTeacherComplaint;
import com.human.ielts.entity.IeltsTeacherFeedback;
import com.human.ielts.entity.IeltsTeacherInfo;
import com.human.ielts.entity.IeltsTeacherMatchclass;
import com.human.ielts.entity.IeltsTeacherOperate;
import com.human.ielts.entity.IeltsTeacherShare;
import com.human.ielts.entity.IeltsTeacherSource;
import com.human.ielts.entity.IeltsTeacherTkt;
import com.human.ielts.service.IeltsTeacherCertificateService;
import com.human.ielts.service.IeltsTeacherInfoService;
import com.human.ielts.service.IeltsTeacherTktService;
import com.human.utils.PageView;

@Controller
@RequestMapping(value="/ielts/teacherself")
public class IeltsTeacherselfController {
    
    @Resource
    private IeltsTeacherInfoService ieltsTeacherInfoService;
    
    @Resource
    private IeltsTeacherCertificateService ieltsTeacherCertificateService;
    
    @Resource
    private IeltsTeacherTktService ieltsTeacherTktService;
    
    /**
     * 教师积分信息页面
     * @return
     */
    @RequestMapping(value="/integralview")
    public ModelAndView integralview(){
        return new ModelAndView("/ielts/teacherself/integral");
    }
    
    /**
     * 教师证书新增页面
     * @return
     */
    @RequestMapping(value="/addcertificateview")
    public ModelAndView addcertificateview(Integer id){
        ModelAndView mav = new ModelAndView("/ielts/teacherself/certificateadd");
        IeltsTeacherCertificate ieltsTeacherCertificate = new IeltsTeacherCertificate();
        ieltsTeacherCertificate.setTeacher_id(id);
        mav.addAllObjects(ieltsTeacherCertificateService.selecttecertificate(ieltsTeacherCertificate));
        return mav;
    }
    
    /**
     * 教师积分新增页面
     * @return
     */
    @RequestMapping(value="/addintegralview")
    public ModelAndView addintegralview(){
        return new ModelAndView("/ielts/teacherself/integraladd");
    }
    
    /**
     * 教师赛课新增页面
     * @return
     */
    @RequestMapping(value="/addteachermatchclassview")
    public ModelAndView addteachermatchclass(){
        return new ModelAndView("/ielts/teacherself/matchclassadd");
    }
    
    /**
     * 积分详情页面
     * @return
     */
    @RequestMapping(value="/changeintegralview")
    public ModelAndView changeintegralview(Integer id){
        ModelAndView mav = new ModelAndView("/ielts/teacherself/integralchange");
        mav.addAllObjects(ieltsTeacherCertificateService.selectteacherselfcertificate());
        return mav;
    }
    
    /**
     * 教师积分批量导入页面
     * @return
     */
    @RequestMapping(value="/upintegralview")
    public ModelAndView upintegralview(){
        return new ModelAndView("/ielts/teacherself/integralup");
    }
    
    /**
     * 分页获取教师积分信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/query")
    public PageView query(PageView pageView, IeltsTeacherInfo ieltsTeacherInfo){
        return ieltsTeacherInfoService.query(pageView, ieltsTeacherInfo);
    }
    
    /**
     * 获取单个教师积分详情信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectteacherselfintegral")
    public Map<String, Object> selectteacherselfintegral(IeltsTeacherInfo ieltsTeacherInfo){
        return ieltsTeacherInfoService.selectteacherselfintegral(ieltsTeacherInfo);
    }
    
    /**
     * 获取教师证书信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selecttecertificate")
    public Map<String, Object> selecttecertificate(IeltsTeacherCertificate ieltsTeacherCertificate){
        return ieltsTeacherCertificateService.selecttecertificate(ieltsTeacherCertificate);
    }
    
    /**
     * 获取教师积分信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectteacherinfo")
    public Map<String, Object> selectteacherinfo(IeltsTeacherInfo ieltsTeacherInfo){
        return ieltsTeacherInfoService.selectteacherinfo(ieltsTeacherInfo);
    }
    
    /**
     * 更新教师证书信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/updatecertificate")
    public Map<String, Object> updatecertificate(IeltsTeacherCertificate ieltsTeacherCertificate){
        return ieltsTeacherCertificateService.updatecertificate(ieltsTeacherCertificate);
    }
    
    /**
     * 获取教师tkt所有成绩
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/selectteachertkt")
    public Map<String, Object> selectteachertkt(IeltsTeacherTkt ieltsTeacherTkt){
        return ieltsTeacherTktService.selectteachertkt(ieltsTeacherTkt);
    }
    
    /**
     * 更新教师tkt所有成绩
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/updateteachertkt")
    public Map<String, Object> updateteachertkt(IeltsTeacherTkt ieltsTeacherTkt){
        return ieltsTeacherTktService.updateteachertkt(ieltsTeacherTkt);
    }
    
    /**
     * 新增教师积分信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/insertteacherinfo")
    public Map<String, Object> insertteacherinfo(IeltsTeacherInfo ieltsTeacherInfo, IeltsTeacherTkt ieltsTeacherTkt, IeltsTeacherSource ieltsTeacherSource, IeltsTeacherAttendance ieltsTeacherAttendance, IeltsTeacherArticle ieltsTeacherArticle, IeltsTeacherShare ieltsTeacherShare, IeltsTeacherOperate ieltsTeacherOperate, IeltsTeacherComplaint ieltsTeacherComplaint, IeltsTeacherFeedback ieltsTeacherFeedback){
        return ieltsTeacherInfoService.insertteacherinfo(ieltsTeacherInfo, ieltsTeacherTkt, ieltsTeacherSource, ieltsTeacherAttendance, ieltsTeacherArticle, ieltsTeacherShare, ieltsTeacherOperate, ieltsTeacherComplaint, ieltsTeacherFeedback);
    }
    
    /**
     * 新增赛课信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/insertteachermatchclass")
    public Map<String, Object> insertteachermatchclass(IeltsTeacherMatchclass ieltsTeacherMatchclass){
        return ieltsTeacherInfoService.insertteachermatchclass(ieltsTeacherMatchclass);
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