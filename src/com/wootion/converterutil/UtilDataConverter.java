package com.wootion.converterutil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.beanutils.Converter;

public class UtilDataConverter implements Converter
{

    public Object convert(Class obj, Object val)
    {
        if (val == null)
        {
            return val;
        }
        if (val instanceof Date)
        {
            return val;
        }
        Date d = null;
        if (val instanceof String)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try
            {
                d = sdf.parse((String) val);
            }
            catch (ParseException e)
            {
                //e.printStackTrace();
            }
        }
        return d;
    }

}
