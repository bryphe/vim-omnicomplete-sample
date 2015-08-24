echom "Date file detected."

fun! CompleteMonths(findstart, base)
    echom "Called: |" . a:findstart . "| " . a:base . "|"
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    echom "Returned: " . start
    return start
  else
    " find months matching with "a:base"
    for m in split("January February March April May June July August September October November December")
      if m =~ '^' . a:base
    call complete_add(m)
      endif
      sleep 300m	" simulate searching for next match
      if complete_check()
    break
      endif
    endfor
    return []
  endif
endfun
set completefunc=CompleteMonths
set omnifunc=CompleteMonths
