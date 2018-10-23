package io.omnidata.odmp.api.enums;

import lombok.Getter;

/**
 * 请求返回码.
 *
 * @author : qinyang @Date : 2018/10/17 下午10:33
 */
public enum ReturnCodeEnum {
  /** 成功 */
  SUCCESS(200, "成功"),
  /** 失败 */
  FAILURE(500, "服务内部错误"),
  PERMISSION_DENIED(700, "服务器地址和accesskey不匹配");
  @Getter private int code;
  @Getter private String msg;

  ReturnCodeEnum(int code, String msg) {
    this.code = code;
    this.msg = msg;
  }
}
