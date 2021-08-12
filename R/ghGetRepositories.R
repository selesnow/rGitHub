ghGetRepositories <-
function(user = NULL, token = NULL, type = 'owner'){
  #Check arguments
  if(is.null(user) | is.null(token)){
    stop("All arguments user and token are requre.")
  }
  
  #Send query
    ans <- GET(str_glue("https://api.github.com/users/{user}/repos"), 
             query = list(type = type),
             add_headers(Authorization = str_glue('token {token}')))
  #Check answer
  stop_for_status(ans)
  #Parsed query
  dataRaw <- content(ans, "parsed", "application/json")
  #Create result DF
  result <- data.frame(id = as.integer(), 
                       name = as.character(), 
                       full_name = as.character(),
                       language = as.character(),
                       owner_login = as.character(),
                       owner_url = as.character(),
                       private = as.logical(),
                       html_url = as.character(),
                       description = as.character(),
                       created_at = as.character(),
                       updated_at = as.character(),
                       stargazers_count = as.integer(),
                       watchers_count = as.integer(),
                       forks_count = as.integer(),
                       open_issues_count = as.integer(),
                       fork = as.logical())
  
  ##Get data from list to data frame
  for(i in 1:length(dataRaw)){
    
    temp_df <- data.frame(id = as.integer(dataRaw[[i]]$id), 
                          name = as.character(dataRaw[[i]]$name), 
                          full_name = as.character(dataRaw[[i]]$full_name),
                          language = ifelse(length(as.character(dataRaw[[i]]$language)) == 0,"Unknown",as.character(dataRaw[[i]]$language)),
                          owner_login = as.character(dataRaw[[i]]$owner$login),
                          owner_url = as.character(dataRaw[[i]]$owner$url),
                          private = as.logical(dataRaw[[i]]$private),
                          html_url = as.character(dataRaw[[i]]$html_url),
                          description = ifelse(length(as.character(dataRaw[[i]]$description)) == 0,"Empty",as.character(dataRaw[[i]]$description)),
                          created_at = as.Date(dataRaw[[i]]$created_at),
                          updated_at = as.Date(dataRaw[[i]]$updated_at),
                          stargazers_count = as.integer(dataRaw[[i]]$stargazers_count),
                          watchers_count = as.integer(dataRaw[[i]]$watchers_count),
                          forks_count = as.integer(dataRaw[[i]]$forks_count),
                          open_issues_count = as.integer(dataRaw[[i]]$open_issues_count),
                          fork = dataRaw[[i]]$fork)
      
    result <- rbind(result, temp_df)}
  
  return(result)
  
}
