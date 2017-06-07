# @InputDataSet: input data frame, result of SQL query execution
# @OutputDataSet: data frame to pass back to SQL

# Test code
# library(RODBC)
# channel <- odbcDriverConnect(dbConnection)
# InputDataSet <- sqlQuery(channel, 'SELECT TOP 1000 [StudentID],[TermID],[SubjectID],[CatalogID],[ClassID],[SectionID],[EnrollDate],[Age],[Class],[CreditHours],[Gender],[MidTermGrade],[Subject],[Term] FROM MLInput.DropClass');
# odbcClose(channel)

studentDropClassModel <- unserialize(rx_model);
studentDropClassPredict <- rxPredict(studentDropClassModel, rx_data[8:15], predVarNames = "Score", type = "response", writeModelVars = TRUE);

OutputDataSet <- cbind(rx_data[1:7], studentDropClassPredict$Dropped, studentDropClassPredict$Score)
colnames(OutputDataSet) <- c("StudentID","TermID","SubjectID","CatalogID","ClassID","SectionID","EnrollDate","DropoutFlag","Score")