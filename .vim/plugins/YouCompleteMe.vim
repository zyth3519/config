let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_strings = 1
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
