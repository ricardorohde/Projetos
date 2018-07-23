using System;
using Framework;

namespace RomaniaProblem
{
	/// <summary>
	/// Summary description for Q4GoalTest.
	/// </summary>
	public class Q4GoalTest : GoalTest 
	{
        private Q4State goalState;

        public Q4GoalTest(Q4State goalState)
        {
            this.goalState = goalState;
        }

		public bool isGoalState(Object state)
		{
			Q4State jstate = (Q4State)state;
        
            if (String.Equals(jstate.location.ToLower(), goalState.location.ToLower()))
				return true;
			else return false;
		}
	}
}
