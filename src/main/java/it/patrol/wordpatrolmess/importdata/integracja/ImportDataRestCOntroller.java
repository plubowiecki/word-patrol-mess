package it.patrol.wordpatrolmess.importdata.integracja;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@RestController
public class ImportDataRestCOntroller {

    @PostMapping("import-data")
    public ResponseEntity multiUpload(@RequestParam("file") MultipartFile file) {
        String ofiginalFileName = Optional.ofNullable(file)
            .map(MultipartFile::getOriginalFilename)
            .orElse("Empty file name");
        return ResponseEntity.ok(ofiginalFileName);
    }

}
