package com.storm.common;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {
    
    private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;
    
    // UserRestController���� Autowried�� JavaMailSenderImpl�� �Ű������� �޴´� 
    public MailUtils(JavaMailSender mailSender) throws MessagingException {
        this.mailSender = mailSender;
        
        // ������ �߼��ϱ� ���� MimeMessage ��ü ���� 
        // MimeMessage�� ���Ϸ� ���� ������ html Tag�� �ۼ��� ���� ������ �߼��ϴ� ��� 
        message = this.mailSender.createMimeMessage();
        
        // MimeMessage�� ���� ���� 
        // �ش� �ʵ�� spring���� �������ִ� ������ ÷�������� �� �� �ֵ��� true�� �����ߴ� 
        // ���Ͽ� �ѱ��� �Է��ϱ� ���ؼ� encoding�� UTF-8�� �ϵ��� �����ߴ�
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }
    
    public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }
    
    public void setText(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }
    
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
        messageHelper.setFrom(email, name);
    }
    
    public void setTo(String email) throws MessagingException {
        messageHelper.setTo(email);
    }
    
    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    
    public void send() {
    	mailSender.send(message);
    }
}