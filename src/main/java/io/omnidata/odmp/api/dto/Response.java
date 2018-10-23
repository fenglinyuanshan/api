package io.omnidata.odmp.api.dto;

import io.omnidata.odmp.api.enums.ReturnCodeEnum;
import java.util.Collections;
import java.util.Map;
import lombok.Data;

/** @author : qinyang @Date : 2018/10/17 下午9:55 */
@Data
public class Response {

  /** 返回码 */
  private int code;

  /** 返回信息 */
  private String msg;

  /** 返回数据 */
  private Map<String, Object> data;

  private Response(ReturnCodeEnum code, Map<String, Object> data) {
    this.code = code.getCode();
    this.msg = code.getMsg();
    this.data = data == null ? Collections.emptyMap() : data;
  }

  public static Response get(ReturnCodeEnum code) {
    return new Response(code, null);
  }

  public static Response get(ReturnCodeEnum code, Map<String, Object> data) {
    return new Response(code, data);
  }
}
