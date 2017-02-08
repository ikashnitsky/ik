ik_ut_inetrconnect <- function(...){
        apply(expand.grid(...), 1, paste, collapse="") 
}
