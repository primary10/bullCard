package g.web.common.cache;

import org.soul.commons.bean.Pair;
import org.soul.commons.cache.CacheKey;
import org.soul.commons.cache.CacheTool;
import org.soul.commons.collections.MapTool;
import org.soul.commons.init.context.CommonContext;
import org.soul.commons.init.context.ContextParam;
import org.soul.commons.lang.string.StringTool;
import org.soul.commons.log.Log;
import org.soul.commons.log.LogFactory;
import org.soul.commons.param.IParamEnum;
import org.soul.model.sys.po.SysParam;

import java.util.Collection;
import java.util.Map;

/**
 * Created by longer on 7/1/15.
 * 参数基础工具类,封装常用方法
 */
public class ParamToolBase {

    private static final Log log = LogFactory.getLog(ParamToolBase.class);


    private static CacheTool cacheTool;

    /**
     * 获取某个参数的值与默认值
     * @param paramEnum
     * @return
     */
    protected static Pair<String,String> get(IParamEnum paramEnum) {
        ContextParam contextParam = CommonContext.get();
        Integer siteId = contextParam.getSiteId();
        return get(siteId,paramEnum);
    }

    /**
     * 获取某个参数的值与默认值
     * @param siteId
     * @param paramEnum
     * @return
     */
    protected static Pair<String,String> get(Integer siteId,IParamEnum paramEnum) {
        SysParam sysParam = raw(siteId,  paramEnum);
        if (sysParam == null) {
            return null;
        }
        return new Pair<>(sysParam.getParamValue(),sysParam.getDefaultValue());
    }

/*    *//**
     * 刷新参数
     * @param paramEnum
     *//*
    public static void refresh(IParamEnum paramEnum){
        ContextParam contextParam = CommonContext.get();
        Integer siteId = contextParam.getSiteId();
        refresh(siteId, paramEnum);
    }*/

    /**
     * 刷新参数
     * @param siteId
     * @param paramEnum
     */
    protected static void refresh(Integer siteId,IParamEnum paramEnum){
        CacheTool.refresh(cacheKey(siteId,  paramEnum));
    }
    /**
     * 值为空,则取默认值
     * @param pair
     * @return
     */
    public static String blankThenDefault(Pair<String, String> pair) {
        if (pair== null) {
            return null;
        }
        return blankThenDefault(pair.getKey(), pair.getValue());
    }

    /**
     * 值为空,则取默认值
     * @param sysParam
     * @return
     */
    public static String blankThenDefault(SysParam sysParam) {
        if (sysParam == null) {
            return null;
        }
        return blankThenDefault(sysParam.getParamValue(), sysParam.getDefaultValue());
    }

    /**
     * 值为空,则取默认值
     * @param value
     * @param defaultValue
     * @return
     */
    public static String blankThenDefault(String value, String defaultValue) {
        if (StringTool.isNotBlank(value)) {
            return value;
        }
        return defaultValue;
    }

    /**
     * 参数转换为布尔类型
     *      先判断当前值-->再判断默认值-->defVal
     * @param valueAndDefault
     * @return
     */
    public static boolean toBoolean(Pair<String, String> valueAndDefault,boolean defVal){
        if (valueAndDefault == null) {
            return defVal;
        }
        if (StringTool.isNotBlank(valueAndDefault.getKey())) {
            return Boolean.valueOf(valueAndDefault.getKey());
        }
        if (StringTool.isNotBlank(valueAndDefault.getValue())) {
            return Boolean.valueOf(valueAndDefault.getValue());
        }
        return defVal;
    }

    /**
     * 获取某个参数原始记录
     * @param paramEnum
     * @return
     */
    protected static SysParam raw(IParamEnum paramEnum) {
        ContextParam contextParam = CommonContext.get();
        Integer siteId = contextParam.getSiteId();
        return raw(siteId,  paramEnum);
    }

    /**
     * 获取某个参数原始记录
     * @param siteId
     * @param paramEnum
     * @return
     */
    protected static SysParam raw(Integer siteId, IParamEnum paramEnum) {
        Map<String,SysParam> params = CacheTool.get(
                cacheKey(siteId,  paramEnum));
        if (MapTool.isEmpty(params)) {
            log.error("参数缓存为空!");
            return null;
        }
        return params.get(paramEnum.getCode());
    }
    /**
     * 获取参数列表:通过模块类型与参数类型
     * @param paramEnum
     * @return
     */
    protected static Collection<SysParam> rawByType(IParamEnum paramEnum) {
        ContextParam contextParam = CommonContext.get();
        Integer siteId = contextParam.getSiteId();
        return rawByType(siteId,  paramEnum);

    }

    /**
     * 获取参数列表:通过模块类型与参数类型
     * @param siteId
     * @param paramEnum
     * @return
     */
    protected static Collection<SysParam> rawByType(Integer siteId,IParamEnum paramEnum) {
        Map<String,SysParam> params = CacheTool.get(cacheKey(siteId,  paramEnum));
        return params.values();

    }

    /**
     * 完整的KEY,for CacheTool
     * @param paramEnum
     * @return
     */
    public static String cacheKey( IParamEnum paramEnum){
        ContextParam contextParam = CommonContext.get();
        Integer siteId = contextParam.getSiteId();
        return cacheKey(siteId,  paramEnum);
    }

    /**
     * 完整的KEY,for CacheTool
     * @param siteId
     * @param paramEnum
     * @return
     */
    public static String cacheKey(Integer siteId, IParamEnum paramEnum){
        return CacheKey.getCacheKey(CacheKey.CACHE_KEY_PARAMS,String.valueOf(siteId), paramEnum.getModule().getCode(), paramEnum.getType());
    }
    public CacheTool getCacheTool() {
        return cacheTool;
    }


    public void setCacheTool(CacheTool cacheTool) {
        ParamToolBase.cacheTool = cacheTool;
    }
}
