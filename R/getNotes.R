#' get notes from tasting
#'
#' @param host url of topdegust API, by default "https://topdegust.trydea.fr/api/topdegust"
#' @param token a token from topdegust API
#' @param id_tasting tasting id
#'
#' @return a data.frama with a row for each combination jugde*product and tasting criteria as cols
#' @export
#'
#' @importFrom httr GET content_type_json
#' @importFrom jsonlite fromJSON
#'
getNotes <- function(host="https://topdegust.trydea.fr/api/topdegust",token,id_tasting=NULL)
{
  result = try(httr::GET(paste0(host,"/notes_juges/",token),
                query = list(degustation=id_tasting),
                httr::content_type_json(),encode ="raw"))
  if(result$status_code!=200)
  {
    stop(paste(httr::http_status(result)$message), call. = FALSE)
  } else
  {
    print(httr::http_status(result)$message)
  }

  notes = jsonlite::fromJSON(rawToChar(result$content))
  Names_produits <- notes$Produits
  Names_juges <- names(notes$Notes)
  Names_juges <- Names_juges[Names_juges!="PRODUITS"] ## exclusion of PRODUITS that is not a judge
  DF_notes <- data.frame()
  for (j in Names_juges)
  {
    notes_juge_j <- notes$Notes[[j]]
    crit <- names(notes_juge_j)
    results <- data.frame(Juge=j,Produits=Names_produits)
    for (i in crit)
    {
      results <- cbind(results,i=notes_juge_j[[i]])
      colnames(results)[dim(results)[2]] <- i
    }
    DF_notes <- rbind(DF_notes,results)
  }
  return(DF_notes)
}
