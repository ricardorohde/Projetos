using System;
using System.Collections;
using Framework;

namespace RomaniaProblem
{
	/// <summary>
	/// Summary description for Q4SuccessorFunction.
	/// </summary>
	public class Q4SuccessorFunction : SuccessorFunction 
	{   
		public ArrayList getSuccessors(Object state)
		{
			ArrayList list = new ArrayList(20);
			Q4State jstate = (Q4State) state;
        
			string location = jstate.location;
        
			Successor s;
			Q4State successor_state ;
        
        
			//these functions are used to track the expanded nodes step/heuristic costs
			//Q4StepCostFunction sn = new Q4StepCostFunction();
			//Q4HeuristicFunction hn = new Q4HeuristicFunction();
        
			//System.out.println("Expanding " + location);
         
			if (location.Equals("1,3,3"))
			{
				successor_state = new Q4State("0,2,2");
				s = new Successor("0,2,2", successor_state);
				list.Add(s);
                            
                successor_state = new Q4State("0,3,1");
                s = new Successor("0,3,1", successor_state);
                list.Add(s);
			}
			else if (location.Equals("0,2,2"))
			{
				successor_state = new Q4State("1,3,3");
				s = new Successor("1,3,3", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("1,3,2");
				s = new Successor("1,3,2", successor_state);
				list.Add(s);
			}
			else if (location.Equals("0,3,1"))
			{
				successor_state = new Q4State("1,3,3");
				s = new Successor("1,3,3", successor_state);
				list.Add(s);

                successor_state = new Q4State("1,3,2");
                s = new Successor("1,3,2", successor_state);
                list.Add(s);
            }
			else if (location.Equals("1,3,2"))
			{
				successor_state = new Q4State("0,2,2");
				s = new Successor("0,2,2", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("0,3,0");
				s = new Successor("0,3,0", successor_state);
				list.Add(s);
			}
            else if (location.Equals("0,3,0"))
			{
				successor_state = new Q4State("1,3,2");
                s = new Successor("1,3,2", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("1,3,1");
                s = new Successor("1,3,1", successor_state);
				list.Add(s);
			}
			else if (location.Equals("0,3,1"))
			{
                successor_state = new Q4State("0,3,0");
                s = new Successor("0,3,0", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("0,1,1");
                s = new Successor("0,1,1", successor_state);
				list.Add(s);
			}
            else if (location.Equals("0,1,1"))
			{
				successor_state = new Q4State("0,3,1");
                s = new Successor("0,3,1", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("1,2,2");
                s = new Successor("1,2,2", successor_state);
				list.Add(s);
			}
            else if (location.Equals("1,2,2"))
			{
				successor_state = new Q4State("0,1,1");
                s = new Successor("0,1,1", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("0,0,2");
                s = new Successor("0,0,2", successor_state);
                list.Add(s);
			}
            else if (location.Equals("0,0,2"))
			{
				successor_state = new Q4State("1,2,2");
                s = new Successor("1,2,2", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("1,0,3");
                s = new Successor("1,0,3", successor_state);
				list.Add(s);
           
			}
			else if (location.Equals("1,0,3"))
			{
				successor_state = new Q4State("0,0,2");
                s = new Successor("0,0,2", successor_state);
				list.Add(s);

                successor_state = new Q4State("0,0,1");
                s = new Successor("0,0,1", successor_state);
				list.Add(s);
			}
            else if (location.Equals("0,0,1"))
			{
				successor_state = new Q4State("1,0,3");
                s = new Successor("1,0,3", successor_state);
				list.Add(s);
            
				successor_state = new Q4State("1,1,1");
                s = new Successor("1,1,1", successor_state);
				list.Add(s);

                successor_state = new Q4State("1,0,2");
                s = new Successor("1,0,2", successor_state);
				list.Add(s);
			}
            else if (location.Equals("1,1,1"))
			{
				successor_state = new Q4State("0,0,1");
                s = new Successor("0,0,1", successor_state);
				list.Add(s);

                successor_state = new Q4State("0,0,0");
                s = new Successor("0,0,0", successor_state);
				list.Add(s);
			}
            else if (location.Equals("1,0,2"))
			{
				successor_state = new Q4State("0,0,1");
                s = new Successor("0,0,1", successor_state);
				list.Add(s);

                successor_state = new Q4State("0,0,0");
                s = new Successor("0,0,0", successor_state);
				list.Add(s);
			}
            else if (location.Equals("0,0,0"))
			{
				successor_state = new Q4State("1,0,2");
                s = new Successor("1,0,2", successor_state);
				list.Add(s);

                successor_state = new Q4State("1,1,1");
                s = new Successor("1,1,1", successor_state);
                list.Add(s);
			}
               
			return list;
		}
    
    
		private int min(int x, int y) 
		{
			if (x < y) return x;
			return y;
		}
	}

}
