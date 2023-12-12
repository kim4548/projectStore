package com.projectStore.store.Controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.projectStore.store.domain.AttachImageVO;
import com.projectStore.store.dto.ProductDto;

import com.projectStore.store.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {

@Autowired
    AdminService adminService;

@Autowired
ProductDto productDto;

    private static  final Logger LOGGER= LoggerFactory.getLogger(AdminController.class);
    @RequestMapping(value = "main" ,method = RequestMethod.GET)
    public void admin(){

    LOGGER.info("관리자 페이지 이동");

    }

    @PostMapping("/goodEnroll1")
    public String goodsEnrollPOST(ProductDto dto, RedirectAttributes rttr) throws Exception{


        LOGGER.info("goodsEnrollPOST......" + dto);
        adminService.productEnroll(dto);

        rttr.addFlashAttribute("enroll_result", dto.getSellName());

        return "redirect:/admin/goodsManage";
    }

    //상품 등록 페이지 접속
    @RequestMapping(value="goodEnroll",method = RequestMethod.GET)
        public void goodEnrollGET(Model m)throws Exception{

            LOGGER.info("상품 등록 페이지 접속");

            ObjectMapper objm = new ObjectMapper();

            List list = adminService.goodsGetList();

            m.addAttribute("list", list);

            //logger.info("변경 전.........." + list);
            //logger.info("변경 gn.........." + cateList);

        }

    @PostMapping("/goodsModify")
    public String goodsModifyPOST(ProductDto productDto, RedirectAttributes rttr) {

        LOGGER.info("goodsModifyPOST.........." +productDto);

        int result = adminService.goodsModify(productDto);

        rttr.addFlashAttribute("modify_result", result);

        return "redirect:/admin/goodsManage";

    }





    @PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

        LOGGER.info("uploadAjaxActionPOST..........");

        /* 이미지 파일 체크 */
        for(MultipartFile multipartFile: uploadFile) {

            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;

            try {
                type = Files.probeContentType(checkfile.toPath());
                LOGGER.info("MIME TYPE : " + type);
            } catch (IOException e) {
                e.printStackTrace();
            }

            if(!type.startsWith("image")) {

                List<AttachImageVO> list = null;
                return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

            }

        }// for

        String uploadFolder = "C:\\upload";

        /* 날짜 폴더 경로 */
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        String datePath = str.replace("-", File.separator);


        /* 폴더 생성 */
        File uploadPath = new File(uploadFolder, datePath);

        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        /* 이미저 정보 담는 객체 */
        List<AttachImageVO> list = new ArrayList();

        // 향상된 for
        for(MultipartFile multipartFile : uploadFile) {

            /* 이미지 정보 객체 */
            AttachImageVO vo = new AttachImageVO();

            /* 파일 이름 */
            String uploadFileName = multipartFile.getOriginalFilename();
            vo.setFileName(uploadFileName);
            vo.setUploadPath(datePath);

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();
            vo.setUuid(uuid);

            uploadFileName = uuid + "_" + uploadFileName;

            /* 파일 위치, 파일 이름을 합친 File 객체 */
            File saveFile = new File(uploadPath, uploadFileName);

            /* 파일 저장 */
            try {

                multipartFile.transferTo(saveFile);


                /* 방법 2 */
                File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

                BufferedImage bo_image = ImageIO.read(saveFile);

                //비율
                double ratio = 3;
                //넓이 높이
                int width = (int) (bo_image.getWidth() / ratio);
                int height = (int) (bo_image.getHeight() / ratio);


                Thumbnails.of(saveFile)
                        .size(width, height)
                        .toFile(thumbnailFile);


            } catch (Exception e) {

                e.printStackTrace();

            }

            list.add(vo);

        } //for

        ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);

        return result;
    }

    /* 이미지 파일 삭제 */
    @PostMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName){

        LOGGER.info("deleteFile........" + fileName);

        File file = null;

        try {
            /* 썸네일 파일 삭제 */
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

            file.delete();

            /* 원본 파일 삭제 */
            String originFileName = file.getAbsolutePath().replace("s_", "");

            LOGGER.info("originFileName : " + originFileName);

            file = new File(originFileName);

            file.delete();


        } catch(Exception e) {

            e.printStackTrace();

            return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

        } // catch

        return new ResponseEntity<String>("success", HttpStatus.OK);

    }



    @RequestMapping(value = "goodsManage", method = {RequestMethod.GET,RequestMethod.POST})
    public void goodsManageGET( Model model) throws Exception {

        LOGGER.info("상품 관리(상품목록) 페이지 접속");



        /* 상품 리스트 데이터 */
        List list = adminService.goodsGetList();

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
            return;
        }
    }
    /* 상품 정보 삭제 */
    @PostMapping("/goodsDelete")
    public String goodsDeletePOST(int sellId, RedirectAttributes rttr) {

        LOGGER.info("goodsDeletePOST..........");

        List<AttachImageVO> fileList = adminService.getAttachInfo(sellId);

        if(fileList != null) {

            List<Path> pathList = new ArrayList();

            fileList.forEach(vo ->{

                // 원본 이미지
                Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
                pathList.add(path);

                // 섬네일 이미지
                path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
                pathList.add(path);

            });

            pathList.forEach(path ->{
                path.toFile().delete();
            });

        }

        int result = adminService.goodsDelete(sellId);

        rttr.addFlashAttribute("delete_result", result);

        return "redirect:/admin/goodsManage";

    }


}
