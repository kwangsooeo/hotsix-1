package org.hotsix.notice;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.hotsix.page.Criteria;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		model.addAttribute("list", service.noticeList(cri));
		model.addAttribute("pageMaker", service.countPaging(cri).calcPage(cri));

		return "/notice/noticeList";
	}

	@RequestMapping(value = "/noticeRegist", method = RequestMethod.GET)
	public void registGET() throws Exception {

		logger.info("registGET...");
	}

	@RequestMapping(value = "/noticeRegist", method = RequestMethod.POST)
	public String registPOST(@ModelAttribute("cri") Criteria cri,
			MultipartFile file, NoticeVO vo, Model model) throws Exception {
		System.out.println("µé¾î¿È");
		logger.info("registPOST...");
		System.out.println(vo.toString());

		
		System.out.println("originalName: " + file.getOriginalFilename());
		System.out.println("size: " + file.getSize());
		System.out.println("contentType: " + file.getContentType());

		vo.setFileName(file.getOriginalFilename());
		vo.setFileSize(file.getSize());
		vo.setFileType(file.getContentType());
		String savedName = uploadFile(file.getOriginalFilename(),
				file.getBytes());
		service.regist(vo);
		model.addAttribute("savedName", savedName);
		return "/suc/noticeSuccess";
	}

	private String uploadFile(String originalName, byte[] fileData)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		String savedPath = calcPath();

		File target = new File(uploadPath + savedPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return makeThumbnail(uploadPath +savedPath,savedName, fileData);
	}

	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public void read(@ModelAttribute("cri") Criteria cri, Integer noticeNo,
			Model model) throws Exception {
		model.addAttribute(service.noticeRead(noticeNo));

	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public void modGET(@ModelAttribute("cri") Criteria cri, NoticeVO vo,
			Model model) throws Exception {

		model.addAttribute(service.noticeRead(cri.getNoticeNo()));

	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String modPOST(@ModelAttribute("cri") Criteria cri, NoticeVO vo,
			Model model) throws Exception {

		service.modify(vo);

		return "/suc/noticeSuccess";

	}

	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public String delete(@ModelAttribute("cri") Criteria cri) throws Exception {

		service.delete(cri.getNoticeNo());
		return "/suc/noticeSuccess";

	}

	private String calcPath() {

		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	private void makeDir(String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

	private String makeThumbnail(String path, String fileName, byte[] data)
			throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File(path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC,
				Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbnailName = path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace('\\', '/');
	}

	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = new FileInputStream(uploadPath + fileName);

		final HttpHeaders headers = new HttpHeaders();

		MediaType mimeType = null;

		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);

		if (suffix.equalsIgnoreCase("jpg") || suffix.equalsIgnoreCase("jpeg")) {
			mimeType = MediaType.IMAGE_JPEG;
		} else if (suffix.equalsIgnoreCase("png")) {
			mimeType = MediaType.IMAGE_PNG;
		} else if (suffix.equalsIgnoreCase("gif")) {
			mimeType = MediaType.IMAGE_GIF;
		}

		headers.setContentType(mimeType);

		return new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,
				HttpStatus.CREATED);

	}

}