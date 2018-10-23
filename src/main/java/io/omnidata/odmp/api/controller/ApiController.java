package io.omnidata.odmp.api.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import io.omnidata.odmp.api.dto.Response;
import io.omnidata.odmp.api.enums.ReturnCodeEnum;
import io.omnidata.odmp.api.mapper.ClientMapper;
import java.util.HashMap;
import java.util.Objects;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Request.Builder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** @author : qinyang @Date : 2018/10/17 下午10:02 */
@RestController
@Slf4j
public class ApiController {
  private static OkHttpClient okHttpClient = new OkHttpClient();
  @Resource private ClientMapper clientMapper;

  /**
   * 用于测试.
   *
   * @param request request
   * @param response resp
   * @return 返回体
   */
  @GetMapping(value = "/return")
  public Response getRemoteIp(HttpServletRequest request, HttpServletResponse response) {
    try {
      String remoteIp = request.getHeader("X-Forwarded-For");
      log.info(remoteIp);
      HashMap<String, Object> map = Maps.newHashMap();
      map.put("result", remoteIp);
      return Response.get(ReturnCodeEnum.SUCCESS, map);
    } catch (Exception e) {
      log.error(JSON.toJSONString(e));
      return Response.get(ReturnCodeEnum.FAILURE);
    }
  }

  @GetMapping(value = "/api/health/sedges")
  public Response sendGet(HttpServletRequest request, HttpServletResponse response) {
    try {
      log.info("accesskey:{}", request.getParameter("accesskey"));
      log.info("name:{}", request.getParameter("name"));
      String remoteIp = request.getHeader("X-Forwarded-For");
      log.info(remoteIp);
      String ipRange = clientMapper.findIpRangeByAccessKey(request.getParameter("accesskey"));
      if (Strings.isNullOrEmpty(ipRange)) {
        return Response.get(ReturnCodeEnum.PERMISSION_DENIED);
      }
      Request build = new Builder().url("http://localhost:8082/health").get().build();
      Call call = okHttpClient.newCall(build);
      okhttp3.Response remoteResponse = call.execute();
      log.warn("返回体：{}", remoteResponse);
      String string = Objects.requireNonNull(remoteResponse.body()).string();
      if (remoteResponse.isSuccessful()) {
        log.info("run: {}", string);
      } else {
        log.info("error: {}", string);
      }
      HashMap<String, Object> map = Maps.newHashMap();
      map.put("result", string);
      return Response.get(ReturnCodeEnum.SUCCESS, map);
    } catch (Exception e) {
      log.error(JSON.toJSONString(e));
      return Response.get(ReturnCodeEnum.FAILURE);
    }
  }
}
