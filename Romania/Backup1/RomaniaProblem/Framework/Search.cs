using System;
using System.Collections;

namespace Framework
{
	/// <summary>
	/// Summary description for Search.
	/// </summary>
	public interface Search 
	{
		ArrayList search(Problem p); //throws exception

		Metrics getMetrics();
	}
}
