package io.omnidata.odmpapi.controller;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import lombok.extern.slf4j.Slf4j;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Request.Builder;
import okhttp3.Response;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/** @author : qinyang @Date : 2018/10/18 下午2:35 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class ApiControllerTest {

  @Test
  public void sendGet() throws IOException {
    String wrongUrl = "http://172.16.200.153:8079/api/health/sedges?accesskey=asd&name=45";
    String correctUrl = "http://127.0.0.1:8079/api/health/sedges?accesskey=asd&name=45";
    OkHttpClient okHttpClient =
        new OkHttpClient.Builder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .writeTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .build();
    Request build =
        new Builder()
            .addHeader("x-real", "cloud")
            .addHeader("x-virtual", "land")
            .get()
            .url(correctUrl)
            .build();
    build.newBuilder();
    Call call = okHttpClient.newCall(build);
    Response response = call.execute();
    log.warn("返回体：{}", response);
    if (response.isSuccessful()) {
      log.info("run: {}", response.body().string());
    } else {
      log.info("run: {}", response.body().string());
    }

    //    new Thread(
    //            () -> {
    //              try {
    //                Response response = call.execute();
    //                if (response.isSuccessful()) {
    //                  log.info("成功");
    //                  log.debug("run: {}", response.body().string());
    //                } else {
    //                  log.info("失败");
    //                  log.debug("run: {}", response.body().string());
    //                }
    //              } catch (IOException e) {
    //                e.printStackTrace();
    //              }
    //            })
    //        .start();

    //    call.enqueue(
    //        new Callback() {
    //          @Override
    //          public void onFailure(Call call, IOException e) {
    //            log.warn("onFailure: ");
    //          }
    //
    //          @Override
    //          public void onResponse(Call call, Response response) throws IOException {
    //            log.debug("onResponse: {}", response.body().string());
    //          }
    //        });
  }
}
