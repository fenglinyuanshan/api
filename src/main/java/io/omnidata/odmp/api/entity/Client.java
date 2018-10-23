package io.omnidata.odmp.api.entity;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;

/** @author : qinyang @Date : 2018/10/18 下午6:34 */
@Data
@Builder
public class Client {

  /**
   * 客户端id，自增
   */
  private Integer id;
  /**
   * 应用访问key
   */
  private String accessKey;
  /**
   * 应用共享密钥
   */
  private String secret;
  /**
   * 白名单ip
   */
  private String ipRange;
  /**
   * 用户ID
   */
  private Integer userId;
  /**
   * 更新时间
   */
  private Timestamp updateDt;
  /**
   * 更新人
   */
  private Integer updaterId;
  /**
   * 创建时间
   */
  private Timestamp createDt;
  /**
   * 创建人
   */
  private Integer creatorId;

}
