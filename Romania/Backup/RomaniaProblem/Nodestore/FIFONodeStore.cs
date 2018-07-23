using System;
using System.Collections;
using DataStructures;
using Framework;

namespace Nodestore
{
	/// <summary>
	/// Summary description for FIFONodeStore.
	/// </summary>
	public class FIFONodeStore : NodeStore 
	{

		FIFOQueue queue;

		public FIFONodeStore() 
		{
			queue = new FIFOQueue();
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
