
library(textreuse)
library(tm)

dir <- file.path("I:/HSE/HSE/Big Data Systems/Advanced Data Analysis&Big Data for Business Intelligence/Textmining code sample/files")

# Minhash Hash genrtor  
minhash <- minhash_generator(n =200)
# Shingling and Minhashing
document<- TextReuseCorpus(dir=dir, tokenizer = tokenize_ngrams, n =4, minhash_func = minhash, keep_tokens = TRUE, progress = FALSE)
tokens(document)
# Comparison of Minhashes using jaccard similarity  
comparisons <- pairwise_compare( document, jaccard_similarity)
comparisons
# Showing similarity results of documets pairwise
pairwise_candidates(comparisons)









