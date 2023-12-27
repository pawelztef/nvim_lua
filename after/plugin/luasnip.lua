local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
    all = {
        snip(
            {
                trig = "meta",
                namr = "Metadata",
                dscr = "Yaml metadata format for markdown"
            },
            {
                text({ "---",
                    "title: " }), insert(1, "note_title"), text({ "",
                    "author: " }), insert(2, "author"), text({ "",
                    "date: " }), func(date, {}), text({ "",
                    "categories: [" }), insert(3, ""), text({ "]",
                    "lastmod: " }), func(date, {}), text({ "",
                    "tags: [" }), insert(4), text({ "]",
                    "comments: true",
                    "---", "" }),
                insert(0)
            }
        ),
    },
    javascript = {
        snip(
            'req',
            {
                text({ "const " }),
                insert(1, ""),
                text({ " = require('" }),
                insert(2, ""),
                text({ "');" }),
            }
        ),
        snip(
            'con',
            {
                text({ "console.log(" }),
                insert(1, ""),
                text({ ");" }),
            }
        ),
        snip(
            'the',
            {
                text({"then( result => {", ""}),
                text({"\t"}), insert(1, " "), text({ "", "" }),
                text({"}).catch( err => {", ""}),
                text({"\t"}), insert(2, " "), text({ "", "" }),
                text({"});"})
            }
        )
    },
    html = {
        snip(
            "ejr",
            {
                text({ "<%= " }),
                insert(1, ""),
                text({ " %>" }),
                insert(2, ""),
            }
        ),
        snip(
            "eje",
            {
                text({ "<%- " }), insert(1, ""), text({ " %>" }), insert(2, ""),
            }
        ),
        snip(
            "ej",
            {
                text({ "<% " }), insert(1, ""), text({ " %>" }), insert(2, ""),
            }
        ),
        snip(
            "ejif",
            {
                text({ "<% if (" }), insert(1, ""), text({ ") { %>", "" }),
                text({ "\t" }), insert(2, ""), text({ "" }),
                text({ "", "<% } %>" }), insert(3, ""),
            }
        ),
        snip(
            "ejife",
            {
                text({ "<% if (" }), insert(1, ""), text({ ") { %>", "" }),
                text({ "\t" }), insert(2, ""), text({ "" }),
                text({ "", "<% } else { %>", "" }),
                text({ "\t" }), insert(3, ""), text({ "" }),
                text({ "", "} %>" }),
            }
        ),
        snip(
            "eji",
            {
                text({ "<%- include(" }), insert(1, ""), text({ ") { %>", "" }), insert(2, ""),
            }
        ),
    },
    python = {
        snip(
            "br",
            {
                text { "breakpoint()" },
            }
        ),
    },
})
