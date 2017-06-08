# @InputDataSet: input data frame, result of SQL query execution
# @OutputDataSet: data frame to pass back to SQL

# Test code
#
# library(RODBC);
# channel <- odbcDriverConnect(dbConnection);
# InputDataSet <- sqlQuery(channel, 'SELECT TOP 1000 * FROM MLInput.DropClass');
# odbcClose(channel);
#

# R scripts to investigate and normalize data
# aggregate(. ~ Age, InputDataSet, function(x) { sum(!duplicated(x)) })
# InputDataSet[1:20, 'Age']

InputDataSet[, 'Age'] <- ifelse(InputDataSet$Age < 20, -1, ifelse(InputDataSet$Age > 29, 1, 0))

studentDropClassLinMod <- rxLogit(Dropped ~ Age
    + Class + CreditHours
    + Gender + MidTermGrade
    , data = InputDataSet
    , initialValues = 0);

# summary(studentDropClassLinMod);

OutputDataSet <- data.frame(payload = as.raw(serialize(studentDropClassLinMod, connection=NULL)));
