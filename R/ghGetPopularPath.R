ghGetPopularPath <-
function(user = NULL, repos = NULL, token = NULL){
  #Check arguments
  if(is.null(user) | is.null(repos) | is.null(token)){
    stop("All arguments user, repos and token are requre.")
  }
  #Prepare query
  #query <- paste0("https://api.github.com/repos/",user,"/",repos,"/traffic/popular/paths?access_token=", token)
  #Send query
  ans <- GET(str_glue("https://api.github.com/repos/{user}/{repos}/traffic/popular/paths"), 
             add_headers(Authorization = str_glue('token {token}')))
  #Check answer
  stop_for_status(ans)
  #Parsed query
  dataRaw <- content(ans, "parsed", "application/json")
  #Create result DF
  result <- data.frame(path = as.character(), title = as.character(), views = as.integer(), uniques = as.integer())
  #Get data from list to data frame
  for(i in 1:length(dataRaw)){
    
    temp_df <- data.frame(path = as.character(dataRaw[[i]]$path),
                          title = as.character(dataRaw[[i]]$title),
                          views = as.integer(dataRaw[[i]]$count),
                          uniques = as.integer(dataRaw[[i]]$uniques))
    
    result <- rbind(result, temp_df)}
  
  return(result)
}
