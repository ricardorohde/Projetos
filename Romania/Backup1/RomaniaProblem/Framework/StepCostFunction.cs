using System;

namespace Framework
{
	/// <summary>
	/// Summary description for StepCostFunction.
	/// </summary>
	public interface StepCostFunction 
	{
		double calculateStepCost(Object fromState, Object toState, string action);
	}
}
