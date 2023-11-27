package com.utmstack.webtopdf.service;

import com.utmstack.webtopdf.config.WebDriverConfig;
import lombok.extern.slf4j.Slf4j;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Pdf;
import org.openqa.selenium.PrintsPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.print.PageMargin;
import org.openqa.selenium.print.PageSize;
import org.openqa.selenium.print.PrintOptions;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class PdfGenerationService {

    final private PrintOptions printOptions;

    private final WebDriverConfig webDriverConfig;

    public PdfGenerationService(WebDriverConfig webDriverConfig) {

        printOptions = new PrintOptions();
        printOptions.setPageMargin(new PageMargin(0, 0, 0, 0));
        printOptions.setPageSize(new PageSize(29.7, 21));

        this.webDriverConfig = webDriverConfig;
    }

    public byte[] generatePdf(String url)  {

        WebDriver webDriver = webDriverConfig.createWebDriver();

        try {
            webDriver.get(url);
            TimeUnit.SECONDS.sleep(5);
            Pdf print = ((PrintsPage) webDriver).print(printOptions);
            webDriver.quit();

            return OutputType.BYTES.convertFromBase64Png(print.getContent());

        } catch (Exception e) {
            log.error(e.getMessage());
            webDriver.quit();
        }
        return new byte[0];
    }
}