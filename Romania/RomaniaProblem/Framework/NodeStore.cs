using System;
using System.Collections;

namespace Framework
{
	/// <summary>
	/// Summary description for NodeStore.
	/// </summary>
	public interface NodeStore 
	{
		 void add(Node anItem);

		 Node remove();

		 void add(ArrayList nodes);

		 bool isEmpty();

		 int size();
	}
}
