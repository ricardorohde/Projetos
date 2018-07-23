using System;
using System.Collections;
using DataStructures;
using Framework;

namespace Nodestore
{
	/// <summary>
	/// Summary description for PriorityQueue.
	/// </summary>
	public class PriorityNodeStore : NodeStore 
	{

		PriorityQueue queue;

		public PriorityNodeStore(IComparer comparator) 
		{

			queue = new PriorityQueue(comparator);
		}

		public void add(Node anItem) 
		{

			queue.add(anItem);
		}

		public Node remove() 
		{

			return (Node) queue.remove();
		}

		public void add(ArrayList nodes) 
		{

			queue.add(nodes);
		}

		public bool isEmpty() 
		{

			return queue.isEmpty();
		}

		public int size() 
		{
			return queue.size();
		}

	}
}
