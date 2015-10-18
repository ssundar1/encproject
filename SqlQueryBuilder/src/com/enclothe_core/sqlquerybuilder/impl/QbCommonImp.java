package com.enclothe_core.sqlquerybuilder.impl;

import java.util.List;
import java.util.Map;

import com.enclothe_core.sqlquerybuilder.interfaces.QbField;


/**
 * Static functions that are used by other implementation classes.
 * @author DanFickle
 */
class QbCommonImp
{
	static Map<Integer, String> mplaceholders;
	
	static String protectTableName(String table)
	{
		return table;
	}
	
	static void joinFieldNames(StringBuilder builder, QbField[] fields)
	{
		for (int i = 0; i < fields.length; i++)
		{
			builder.append(fields[i].toString());
			
			if (i != fields.length - 1)
				builder.append(", ");
		}
	}
	
	static void joinFieldNames(StringBuilder builder, List<QbField> fields)
	{
		for (int i = 0; i < fields.size(); i++)
		{
			builder.append(fields.get(i).toString());
			
			if (i != fields.size() - 1)
				builder.append(", ");
		}
	}
	
	static void setPlaceholders(Map<Integer, String> m_placeholders){
		mplaceholders = m_placeholders;
	}
	
	static void createPlaceholders(StringBuilder builder, int cnt)
	{
		for (int i = 0; i < cnt; i++)
		{
			builder.append(mplaceholders.get(i+1));
			
			if (i != cnt - 1)
				builder.append(", ");
		}
	}
}