# @InputDataSet: input data frame, result of SQL query execution
# @OutputDataSet: data frame to pass back to SQL

# Test code
# library(RODBC)
# channel <- odbcDriverConnect(dbConnection)
# InputDataSet <- sqlQuery(channel, 'SELECT TOP 1000 [StudentID],[TermID],[SubjectID],[CatalogID],[ClassID],[SectionID],[EnrollDate],[Dropped],[Age],[Class],[CreditHours],[Gender],[MidTermGrade] FROM MLInput.DropClass');
# odbcClose(channel)

studentDropClassModel <- unserialize(rx_model);
rx_data$Score <- rxPredict(studentDropClassModel, rx_data[9:13]);
rx_data$DropoutFlag <- as.numeric(rx_data$Score > 0.5)

OutputDataSet <- cbind(rx_data[1:7], rx_data$DropoutFlag, rx_data$Score)
colnames(OutputDataSet) <- c("StudentID", "TermID", "SubjectID", "CatalogID", "ClassID", "SectionID", "EnrollDate", "DropoutFlag", "Score")