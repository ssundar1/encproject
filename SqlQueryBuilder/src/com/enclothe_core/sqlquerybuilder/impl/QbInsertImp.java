package com.enclothe_core.sqlquerybuilder.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.enclothe_core.sqlquerybuilder.interfaces.QbField;
import com.enclothe_core.sqlquerybuilder.interfaces.QbInsert;

/**
 * The default implementation of QbInsert.
 * @author DanFickle
 */
class QbInsertImp implements QbInsert 
{
	QbInsertImp() { }
	private String m_table;
	private Map<Integer, String> m_placeholders;
	private List<QbField> m_fields;

	@Override
	public String getQueryString()
	{
		if (m_fields == null || m_table == null || m_placeholders == null)
			throw new IllegalStateException("Table name or fields missing");
		
		StringBuilder builder = new StringBuilder("INSERT INTO ");
		builder.append(QbCommonImp.protectTableName(m_table));
		builder.append(" (");
		QbCommonImp.joinFieldNames(builder, m_fields);
		builder.append(") VALUES (");
		QbCommonImp.mplaceholders = m_placeholders;
		QbCommonImp.createPlaceholders(builder, m_fields.size());
		builder.append(')');
		builder.append(';');
		
		return builder.toString();
	}

	/*@Override
	public int getPlaceholderIndex(String placeholderName)
	{
		if (m_placeholders == null)
			throw new IllegalArgumentException("Placeholder doesn't exist");
		
		Integer idx = m_placeholders.get(placeholderName);
		
		if (idx == null)
			throw new IllegalArgumentException("Placeholder doesn't exist");
		else
			return idx;
	}*/

	@Override
	public QbInsert set(QbField field, String placeholder)
	{
		if (m_fields == null)
			m_fields = new ArrayList<QbField>();
		if (m_placeholders == null)
			m_placeholders = new HashMap<Integer, String>();
		
		if (m_placeholders.containsKey(placeholder))
			throw new IllegalArgumentException("Duplicate placeholder");
		
		m_fields.add(field);
		m_placeholders.put(m_placeholders.size() + 1, placeholder);
		return this;
	}

	@Override
	public QbInsert inTable(String table)
	{
		m_table = table;
		return this;
	}

	@Override
	public int getPlaceholderIndex(String placeholderName) {
		// TODO Auto-generated method stub
		return 0;
	}
}
