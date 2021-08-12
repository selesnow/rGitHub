ghGetReferrers <-
function(user = NULL, repos = NULL, token = NULL){
  #Check arguments
  if(is.null(user) | is.null(repos) | is.null(token)){
    stop("All arguments user, repos and token are requre.")
  }
  #Prepare query
  #query <- paste0("https://api.github.com/repos/",user,"/",repos,"/traffic/popular/referrers?access_token=", token)
  #Send query
  ans <- GET(str_glue("https://api.github.com/repos/{user}/{repos}/traffic/popular/referrers"), 
             add_headers(Authorization = str_glue('token {token}')))
  #Check answer
  stop_for_status(ans)
  #Parsed query
  dataRaw <- content(ans, "parsed", "application/json")
  #Create result DF
  result <- data.frame(referrer = as.character(), views = as.integer(), uniques = as.integer())
  #Get data from list to data frame
  for(i in 1:length(dataRaw)){
    
    temp_df <- data.frame(referrer = as.character(dataRaw[[i]]$referrer),
                          views = as.integer(dataRaw[[i]]$count),
                          uniques = as.integer(dataRaw[[i]]$uniques))
    
    result <- rbind(result, temp_df)}
  
  return(result)
}
