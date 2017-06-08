SELECT COUNT(*) AS StudentClusterCount FROM [MLOutput].[StudentClusters] 
SELECT COUNT(*) AS StudentDropClassCount FROM [MLOutput].[StudentDropClass]
SELECT COUNT(*) AS StudentFinalGradeEstimateCount FROM [MLOutput].[StudentFinalGradeEstimate]

/*
namespace RaiseInformationEvent
{
	[Microsoft.SqlServer.Dts.Tasks.ScriptTask.SSISScriptTaskEntryPointAttribute]
	public partial class ScriptMain : Microsoft.SqlServer.Dts.Tasks.ScriptTask.VSTARTScriptObjectModelBase
	{
		public void Main()
		{
            bool failure = false;
            bool fireAgain = true;
            try
            {

                Dts.Events.FireInformation(1, "", String.Format("ML Output table '{0}' successfully loaded with '{1}' records.",
                    Dts.Variables["User::MLResultsTable"].Value.ToString(), Dts.Variables["User::MLResultsTableRecordsLoaded"].Value.ToString()), "", 0, ref fireAgain);
            }
            catch (Exception ex)
            {
                Dts.Events.FireError(-1, "", String.Format("Failed to load ML Output table '{0}'. Error Message='{1}'",
                    Dts.Variables["User::MLResultsTable"].Value.ToString(), ex.Message),
                    "", 0);
                failure = true;
            }
            if (failure)
                Dts.TaskResult = (int)ScriptResults.Failure;
            else
                Dts.TaskResult = (int)ScriptResults.Success;
        }

        #region ScriptResults declaration
        /// <summary>
        /// This enum provides a convenient shorthand within the scope of this class for setting the
        /// result of the script.
        /// 
        /// This code was generated automatically.
        /// </summary>
        enum ScriptResults
        {
            Success = Microsoft.SqlServer.Dts.Runtime.DTSExecResult.Success,
            Failure = Microsoft.SqlServer.Dts.Runtime.DTSExecResult.Failure
        };
        #endregion

	}
}
*/