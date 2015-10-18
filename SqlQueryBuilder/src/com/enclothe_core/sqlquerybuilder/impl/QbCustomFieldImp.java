package com.enclothe_core.sqlquerybuilder.impl;

import com.enclothe_core.sqlquerybuilder.interfaces.QbField;

/**
 * Immutable class to implement custom field.
 * @author DanFickle
 */
class QbCustomFieldImp implements QbField
{
	private final String m_custom;
	
	QbCustomFieldImp(String custom)
	{
		m_custom = custom;
	}

	@Override
	public String toString() 
	{
		return m_custom;
	}
}