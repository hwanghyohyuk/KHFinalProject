package com.kh.everycvs.common.util;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	private static String filePath = null;
	
	/** 정해진 경로에 파일을 생성하고,
	 *	[원래 파일명 | 변환한 파일명] 을 리턴하는 메소드 */
	public String InsertFile(HttpSession session, HttpServletRequest request) throws Exception{
		
		// 경로 지정 : 웹 서비스 root 경로에 resources/upload 폴더 안
		this.filePath = request.getSession().getServletContext().getRealPath("/") + "resources/upload/";
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;		// 원래 파일명
    	String originalFileExtension = null;	//원래 파일 확장자
    	String storedFileName = null;	// 변환한 파일명("랜덤텍스트.확장자")
    	
        File file = new File(filePath);	// 디렉토리 생성해보쟈.
        // exists() : 파일이나 디렉토리의 존재 여부를 boolean으로 반환
        if(file.exists() == false){
        	file.mkdirs();	// 없으면 만든닷!
        }
        
        if(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){	// multipartFile이 비어있지 않으면
        		originalFileName = multipartFile.getOriginalFilename();
        		System.out.println("fileutils : " + multipartFile.getOriginalFilename());
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));	// .확장자 형태로 자름
        		
        		// 저장되는 파일명 : "랜덤텍스트.확장자"
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + storedFileName);	// 파일 객체 만들고,
        		multipartFile.transferTo(file);	// 실제 파일을 만들어준다.
        	}
        }
		return new String(originalFileName + "/" + storedFileName);	// 변환한 파일명을 반환
	}
	
	/** 정해진 경로의 파일을 삭제하는 메소드 */
	public void deleteFile(HttpServletRequest request) {
		this.filePath = request.getSession().getServletContext().getRealPath("/") + "resources/upload/";
		String fileName = request.getParameter("prevfile");
		
		File file = new File(filePath + fileName);
		if(file.exists() == true){	// 존재하면
			file.delete();	// 삭제
		}
	}
	
}
