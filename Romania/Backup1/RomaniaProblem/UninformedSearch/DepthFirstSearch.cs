using System;
using System.Collections;
using Framework;
using Nodestore;

namespace UninformedSearch
{
	/// <summary>
	/// Summary description for DepthFirstSearch.
	/// </summary>
	public class DepthFirstSearch : Search 
	{

		QueueSearch _search;

		public DepthFirstSearch(QueueSearch search) 
		{

			this._search = search;

		}

		public ArrayList search(Problem p) 
		{

			return _search.search(p, new LIFONodeStore());
		}

		public Metrics getMetrics() 
		{
			return _search.getMetrics();
		}

	}
}
