st <- proc.time()

alpha <- toupper(letters)

sum_word <- function(word) {
  word_vec <- unlist(strsplit(word, split=""))
  
  let_sum <- 0
  
  for (letter in word_vec) {
    let_sum <- let_sum+which(alpha==letter)
  }
  return(let_sum)
}

tri_num <- function(n) {
  n*(n+1)/2
}

numbers <- tri_num(1:100)

# read in text here and store it in variable 'words'
txt <- scan('http://projecteuler.net/project/words.txt', what=character(), sep=NULL, allowEscapes=TRUE, quote="")
words <- unlist(strsplit(gsub('\"', '', txt), ","))

cnt <- 0

for (word in words) {
  if (sum_word(word) %in% numbers) {
    cnt <- cnt+1
  }
}

cat(sprintf("Found %d words that are triangular!\n", cnt))
print(proc.time()-st)