package com.enclothe_core.sqlquerybuilder.impl;

import com.enclothe_core.sqlquerybuilder.interfaces.QbField;

/**
 * Immutable class to implement all fields.
 * @author DanFickle
 */
class QbAllFieldImp implements QbField
{
	QbAllFieldImp() { }
	
	@Override
	public String toString()
	{
		return "*";
	}
}
