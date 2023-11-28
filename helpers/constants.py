NEWS_PARSER = {
    "IN": {
        "structure": ["title", "date", "article"],
        "name": "The Malta Independent",
        "scrape": {"articletitle": {"type": "class", "maps": "title"},
                   "date-published": {"type": "class", "maps": "date"},
                   "text-container": {"type": "class", "maps": "article"}}
    },
    "MT": {
        "structure": ["title", "sub-title", "date", "author", "article"],
        "name": "Malta Today",
        "scrape": {"h1": {"type": "name", "maps": "title"},
                   "h2": {"type": "name", "maps": "sub-title"},
                   "date": {"type": "class", "maps": "date",  "failsafe": {
                       "date_last_published": {"type": "class", "maps": "date"}
                   }},
                   "name": {"type": "class", "maps": "author"},
                   "content-news": {"type": "class", "maps": "article"}},

    },
    "ToM": {
        "structure": ["title", "sub-title", "date", "author", "article"],
        "name": "Malta Today",
        "scrape": {"h1": {"type": "name", "maps": "title"},
                   "wi-WidgetMeta-time": {"type": "class", "maps": "date"},
                   "wi-WidgetSubCompType_13-subtitle": {"type": "class", "maps": "sub-title"},
                   "wi-WidgetMeta-author": {"type": "class", "maps": "author"},
                   "ar-Article_Content": {"type": "class", "maps": "article"}}
    },
    "TVM": {
        "structure": ["title", "date", "article"],
        "name": "Malta Today",
        "scrape": {"post-title single-post-title entry-title": {"type": "class", "maps": "title"},
                   "entry-date published": {"type": "class", "maps": "date"},
                   "inner-post-entry entry-content": {"type": "class", "maps": "article"}},
    },
    "NB": {
        "structure": ["title", "date", "author", "article"],
        "name": "Newsbook",
        "scrape": {"entry-title": {"type": "class", "maps": "title"},
                   "entry-date": {"type": "class", "maps": "date"},
                   "td-post-author-name": {"type": "class", "maps": "author"},
                   "td-post-content": {"type": "class", "maps": "article"}}
    },
}
