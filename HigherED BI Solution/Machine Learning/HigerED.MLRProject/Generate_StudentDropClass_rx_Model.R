# @InputDataSet: input data frame, result of SQL query execution
# @OutputDataSet: data frame to pass back to SQL

# Test code
#
# library(RODBC);
# channel <- odbcDriverConnect(dbConnection);
# InputDataSet <- sqlQuery(channel, 'SELECT TOP 1000 * FROM MLInput.DropClass');
# odbcClose(channel);
#

studentDropClassLinMod <- rxLogit(Dropped ~ Age
    + Class + CreditHours
    + Gender + MidTermGrade
    + Subject + Term
    , data = InputDataSet
    , initialValues = 0);

# summary(studentDropClassLinMod);

OutputDataSet <- data.frame(payload = as.raw(serialize(studentDropClassLinMod, connection=NULL)));
