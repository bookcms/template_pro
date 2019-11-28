<meta property="og:type" content="novel"/>
    <meta property="og:title" content="{$novel.Title}"/>
    <meta property="og:description" content="{$novel.Introduction|msubstr=0,180}"/>
    <meta property="og:image" content="{$novel.LocalImage | down_image}"/>
    <meta property="og:novel:category" content="{$novel.category.name}"/>
    <meta property="og:novel:author" content="{$novel.Author}"/>
    <meta property="og:novel:book_name" content="{$novel.Title}"/>
    <meta property="og:novel:read_url" content="{:url('/book/' . $novel.PrimaryId,array(),'html',true)}"/>
    <meta property="og:url" content="{:url('/book/' . $novel.PrimaryId,array(),'html',true)}"/>
    <meta property="og:novel:status" content="{eq name="$novel.Full" value="1"}完结{else/}连载中{/eq}"/>
    <meta property="og:novel:author_link" content="{:url('/author/' . urlencode($novel.Author),array(),'html',true)}"/>
    <meta property="og:novel:UpdateTime" content="{$novel.UpdateTime | date='Y-m-d H:i:s'}"/>
    <meta property="og:novel:latest_chapter_name" content="{$novel.LastChapterTitle}"/>
    <meta property="og:novel:latest_chapter_url" content="{:url('/chapter',array($novel['PrimaryId'] => get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag'])),'html',true)}"/>