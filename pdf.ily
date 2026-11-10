% PDF
% 8.5" x 11" (Letter) page size
%
% Last modified by Kevin Cole <ubuntourist@hacdc.org> 2025.06.24 (kjc)
%
% Usage:
%     PAGE_BREAKING=pdf lilypond --pdf $j
%

\paper {
  #(include-special-characters)
  #(set-paper-size "letter")
  print-page-number = ##f
  ragged-last-bottom = ##t
}
