Vim�UnDo� �<����鈵|��Z�P��X��;���x��#?   
                                  c���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             c�Ѵ     �                 	    -- th�               �               �                   �               5��                       	                   �      �       	                  �                     �                        �              T      5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             c���     �   (   *   *        },5��    (                     K                     5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             c���     �   (   *   *        }5��    (                     K                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��     �         *      ,  ensure_installed = { "c", "lua", "rust" },5��                         g                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��	     �         *      +  ensure_installed = { "", "lua", "rust" },5��                         g                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��     �         *      /  ensure_installed = { "help", "lua", "rust" },5��                         m                      �       ;                 �                     �       <                 �                     5�_�                       @    ����                                                                                                                                                                                                                                                                                                                                                             c��*     �         *      Q  ensure_installed = { "help", "javascript", "typescript", "pyth "lua", "rust" },5��       @                  �                      5�_�      	                 L    ����                                                                                                                                                                                                                                                                                                                                                             c��-     �         *      U  ensure_installed = { "help", "javascript", "typescript", "python", "lua", "rust" },5��       L                  �                      5�_�      
           	      L    ����                                                                                                                                                                                                                                                                                                                                                             c��.     �         *      T  ensure_installed = { "help", "javascript", "typescript", "python", "lua", rust" },5��       L                  �                      5�_�   	              
      L    ����                                                                                                                                                                                                                                                                                                                                                             c��.     �         *      P  ensure_installed = { "help", "javascript", "typescript", "python", "lua", " },5��       L                  �                      5�_�   
                    L    ����                                                                                                                                                                                                                                                                                                                                                             c��2     �         *      O  ensure_installed = { "help", "javascript", "typescript", "python", "lua",  },5��       L               	   �               	       �       T                 �                     �       h       	           �       	               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       c��j     �                ^  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)   �  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!5��                          )      �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                       	           V        c��q     �                ?  -- Automatically install missing parsers when entering buffer   W  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally5��                                �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c��r     �                 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c��t     �                G  -- Install parsers synchronously (only applied to `ensure_installed`)5��                          �       H               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c��v     �                 5��                          �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c��y     �                %  -- A list of parser names, or "all"5��                          )       &               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c��{     �                5  -- List of parsers to ignore installing (for "all")5��                          �       6               5�_�                            ����                                                                                                                                                                                                                                                                                                                               /                 V   /    c�ҙ     �                h    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files   !    disable = function(lang, buf)   1        local max_filesize = 100 * 1024 -- 100 KB   Q        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))   :        if ok and stats and stats.size > max_filesize then               return true           end       end,5��                          v      w              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c�ҟ     �                R    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.   Y    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).   ^    -- Using this option may slow down your editor, and you may see some duplicate highlights.   9    -- Instead of true it can also be a list of languages   .    additional_vim_regex_highlighting = false,5��                          w      u              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c�Ҡ     �                 5��                          v                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c�ҥ     �                a    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to   g    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is       -- the name of the parser)   -    -- list of language that will be disabled5��                          @                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c�Ҧ     �                 5��                          ?                     5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                  V        c�Ҩ     �   	   
          /    -- `false` will disable the whole extension5��    	                      �       0               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        c�Ҽ     �                 5��                          �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        c�ҽ     �                 5��                          �                      5�_�                             ����                                                                                                                                                                                                                                                                                                                            	           	           V        c�ҿ    �                 5��                          �                      5��