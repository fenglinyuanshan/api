package io.omnidata.odmpapi.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 获取ip.
 *
 * @author : qinyang @Date : 2018/10/17 下午2:24
 */
@RestController
@Slf4j
public class NginxRelationController {
  @GetMapping(value = "/ip")
  public void getRemoteIp(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    String remoteIp = request.getHeader("X-Forwarded-For");
    log.info(remoteIp);
    response.getWriter().write(remoteIp);
  }
}
