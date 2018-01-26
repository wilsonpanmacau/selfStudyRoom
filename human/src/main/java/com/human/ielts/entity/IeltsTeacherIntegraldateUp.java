package com.human.ielts.entity;

import com.human.pulgin.excel.ExcelAnnotation;
import com.human.pulgin.excel.ExportTitleAnnotation;

public class IeltsTeacherIntegraldateUp {
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="教师姓名")
    private String teacher_name;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="email前缀")
    private String email_addr;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="TKT模块1")
    private Double tkt_source_one;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="TKT模块2")
    private Double tkt_source_two;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="TKT模块3")
    private Double tkt_source_three;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="TKT模块4")
    private Double tkt_source_four;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="TKT考试时间")
    private String tkt_source_date;

    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="雅思总分")
    private Double ielts_source;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="雅思失效时间")
    private String ielts_time_vaild;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="是否有教师资格证")
    private String is_teacher_certificate;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="是否有celta")
    private String is_celta;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="出勤次数")
    private Integer abb_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="未出勤次数")
    private Integer duty_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="出勤统计时间")
    private String duty_date;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="教研文章阅读量")
    private Integer article_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="教研文章阅读时间")
    private String article_date;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="教学分享次数")
    private Integer share_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="教学分享时间")
    private String share_date;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="运营支持次数")
    private Integer operate_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="运营支持时间")
    private String operate_date;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="未反馈数")
    private Integer feedback_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="未反馈时间")
    private String feedback_date;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="投诉数")
    private Integer complaint_num;
    
    @ExportTitleAnnotation()
    @ExcelAnnotation(exportName="投诉时间")
    private String complaint_date;

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getEmail_addr() {
        return email_addr;
    }

    public void setEmail_addr(String email_addr) {
        this.email_addr = email_addr;
    }

    public Double getTkt_source_one() {
        return tkt_source_one;
    }

    public void setTkt_source_one(Double tkt_source_one) {
        this.tkt_source_one = tkt_source_one;
    }

    public Double getTkt_source_two() {
        return tkt_source_two;
    }

    public void setTkt_source_two(Double tkt_source_two) {
        this.tkt_source_two = tkt_source_two;
    }

    public Double getTkt_source_three() {
        return tkt_source_three;
    }

    public void setTkt_source_three(Double tkt_source_three) {
        this.tkt_source_three = tkt_source_three;
    }

    public Double getTkt_source_four() {
        return tkt_source_four;
    }

    public void setTkt_source_four(Double tkt_source_four) {
        this.tkt_source_four = tkt_source_four;
    }

    public String getTkt_source_date() {
        return tkt_source_date;
    }

    public void setTkt_source_date(String tkt_source_date) {
        this.tkt_source_date = tkt_source_date;
    }

    public Double getIelts_source() {
        return ielts_source;
    }

    public void setIelts_source(Double ielts_source) {
        this.ielts_source = ielts_source;
    }

    public String getIelts_time_vaild() {
        return ielts_time_vaild;
    }

    public void setIelts_time_vaild(String ielts_time_vaild) {
        this.ielts_time_vaild = ielts_time_vaild;
    }

    public String getIs_teacher_certificate() {
        return is_teacher_certificate;
    }

    public void setIs_teacher_certificate(String is_teacher_certificate) {
        this.is_teacher_certificate = is_teacher_certificate;
    }

    public String getIs_celta() {
        return is_celta;
    }

    public void setIs_celta(String is_celta) {
        this.is_celta = is_celta;
    }

    public Integer getAbb_num() {
        return abb_num;
    }

    public void setAbb_num(Integer abb_num) {
        this.abb_num = abb_num;
    }

    public Integer getDuty_num() {
        return duty_num;
    }

    public void setDuty_num(Integer duty_num) {
        this.duty_num = duty_num;
    }

    public String getDuty_date() {
        return duty_date;
    }

    public void setDuty_date(String duty_date) {
        this.duty_date = duty_date;
    }

    public Integer getArticle_num() {
        return article_num;
    }

    public void setArticle_num(Integer article_num) {
        this.article_num = article_num;
    }

    public String getArticle_date() {
        return article_date;
    }

    public void setArticle_date(String article_date) {
        this.article_date = article_date;
    }

    public Integer getShare_num() {
        return share_num;
    }

    public void setShare_num(Integer share_num) {
        this.share_num = share_num;
    }

    public String getShare_date() {
        return share_date;
    }

    public void setShare_date(String share_date) {
        this.share_date = share_date;
    }

    public Integer getOperate_num() {
        return operate_num;
    }

    public void setOperate_num(Integer operate_num) {
        this.operate_num = operate_num;
    }

    public String getOperate_date() {
        return operate_date;
    }

    public void setOperate_date(String operate_date) {
        this.operate_date = operate_date;
    }

    public Integer getFeedback_num() {
        return feedback_num;
    }

    public void setFeedback_num(Integer feedback_num) {
        this.feedback_num = feedback_num;
    }

    public String getFeedback_date() {
        return feedback_date;
    }

    public void setFeedback_date(String feedback_date) {
        this.feedback_date = feedback_date;
    }

    public Integer getComplaint_num() {
        return complaint_num;
    }

    public void setComplaint_num(Integer complaint_num) {
        this.complaint_num = complaint_num;
    }

    public String getComplaint_date() {
        return complaint_date;
    }

    public void setComplaint_date(String complaint_date) {
        this.complaint_date = complaint_date;
    }

}
