% Web SVG (Sphinx Cloud theme):
% One long continuous page
%
% Last modified by Kevin Cole <ubuntourist@hacdc.org> 2026.04.29 (kjc)
%
% 2026.04.29 KJC - upgrade to 2.26.0 syntax for font definitions
%
% Usage:
%     PAGE_BREAKING=svg lilypond --svg $j
%

#(ly:set-option 'backend 'cairo)
\paper {
  #(include-special-characters)
  fonts.roman      = "Open Sans"
  fonts.sans       = "Open Sans"
  fonts.typewriter = "DejaVu Sans Mono"
  oddHeaderMarkup  = \markup \null
  evenHeaderMarkup = \markup \null
  page-breaking    = #ly:one-page-breaking
}
