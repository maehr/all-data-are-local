-- Keep explicit semantic units together in the cheat sheet PDF.
-- HTML retains ordinary divs, headings, links, and executable-cell output.
function Div(el)
  if FORMAT ~= "typst" then
    return nil
  end
  if el.classes:includes("formula-summary") then
    local blocks = pandoc.Blocks({
      pandoc.RawBlock("typst", "#block(breakable: false)["),
      el.content[1],
      pandoc.RawBlock("typst", "#grid(columns: (1fr, 1fr), gutter: 0.8em,"),
    })
    -- Each existing heading and formula form one grid cell in print.
    for i = 2, #el.content, 2 do
      blocks:insert(pandoc.RawBlock("typst", "["))
      blocks:insert(el.content[i])
      blocks:insert(el.content[i + 1])
      blocks:insert(pandoc.RawBlock("typst", "],"))
    end
    blocks:insert(pandoc.RawBlock("typst", ")\n]"))
    return blocks
  end
  if el.classes:includes("keep-together") then
    el.content:insert(1, pandoc.RawBlock("typst", "#block(breakable: false)["))
    el.content:insert(pandoc.RawBlock("typst", "]"))
    return el.content
  end
  if el.classes:includes("ims-reference") then
    el.content:insert(1, pandoc.RawBlock("typst", "#block(sticky: true)["))
    el.content:insert(pandoc.RawBlock("typst", "]"))
    return el.content
  end
end

-- Limit plot width in print without changing the HTML figures or their data.
function Image(el)
  if FORMAT == "typst" and el.src:match("cell%-") then
    el.attributes.width = "6in"
    return el
  end
end
