#TO RUN THE CODE IN LOCAL MODE USE pig -x local wordcount.pig
inpt = load '/data/wordCountSample.txt' as (line);

words = foreach inpt generate flatten(TOKENIZE(line)) as word;

grpd = group words by word;

cntd = foreach grpd generate group, COUNT(words);

dump cntd;
