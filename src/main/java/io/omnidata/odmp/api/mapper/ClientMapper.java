package io.omnidata.odmp.api.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/** @author : qinyang @Date : 2018/10/18 下午6:30 */
@Component
@Mapper
public interface ClientMapper {

  /**
   * 根据accesskey和服务器ip鉴权. 以后根据表调整再加入status鉴权
   *
   * @param accessKey accessKey
   * @return ip范围
   */
  String findIpRangeByAccessKey(@Param("accessKey") String accessKey);
}
