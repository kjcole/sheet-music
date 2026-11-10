% Decomposed template (KJC)
%
% The Ghost of Summers Past
%
% Conceived   by Kevin Cole [ubuntourist@hacdc.org> 1995 (kjc)
% Transcribed by Kevin Cole [ubuntourist@hacdc.org] 2022-08-10 (kjc)
% Extended    by Kevin Cole [ubuntourist@hacdc.org] 2025-12-23 (kjc)
%
% Formerly known as "Memory", then "Revisited Memory" then
% "Arpegi-88-ed Memory" (due to voice teacher Allen Thompson telling
% me that it had an 8/8 time signature, which I'd never heard of,
% and that the chords might sound better arpeggiated).
%
% Older attempts at adding inverted sections and retrograde
% sections to "Arpeggi-88-ed" are available, but not very good.
%
% NOTE: \articulate BREAKS the printed score while fixing MIDI
%

\version "2.26.0"
\language "english"

\include "predefined-guitar-fretboards.ly"

\include "articulate.ly"

\header {
  tagline       = ##f    % Remove default LilyPond tagline
  enteredby     = "KJC"
  title         = \markup \with-url #"summers_ghost.mp3" "The Ghost of Summers Past"
  % subtitle    = ""
  % subsubtitle = ""
  % poet        = \markup { "De words by "   \smallCaps "Kevin Cole" }
  composer      = \markup { "Decomposed by " \smallCaps "Kevin Cole" }
  arranger      = \markup { "Deranged by "   \smallCaps "Kevin Cole" }
  copyright     = \markup { "Copyleft" \char ##x1F12F \smallCaps "Tadonic the Flautulent, Breaker of Wind," "2025" }
  % metre       = ""
  % opus        = ""
  % piece       = ""
  % source      = ""
  % dedication  = ""
  % texidoc     = "All header fields with special meanings."
  % instrument  = \markup { \smallCaps { "Soprano" } }
}

pageBreaking = #(string-append (getenv "HOME") "/.local/lib/lilypond/" (if (getenv "PAGE_BREAKING") (getenv "PAGE_BREAKING") "svg") ".ily")
\include \pageBreaking

global = {
  \numericTimeSignature
  \time 8/8
  \key d \minor
  \tempo 4=126
}

frets = \chordmode {
  d1:m/a s1 c1/g s1 bf1/f s1 e1:dim s1 bf s1 a1:m/e s1 f1/c
}

chordNames = \chordmode {
  \global
  d1:m/a   | d1:m/a    | c1/g       | c1/g        |         %  1 -  4
  bf1/f    | c1/g      | e1:dim     | d1:m/a      |         %  5 -  8
  r2 bf2/f | s4 bf2.   | s4 a2.:m/e | s8 f2../c   |         %  9 - 12
  bf1/f    | c1/g      | e1:dim     | d2.:m/a  s4 |         % 13 - 16

  f1/c     | f1/c      | e1:dim     | e1:dim      |         % 17 - 20
  a1:m/e   | e1:dim/bf | e1:dim     | f1/c        |         % 21 - 24
  r1       | a1:m      | g1:m/d     | g1:m        |         % 25 - 28
  a1:m/e   | bf1/f     | e1:dim/g   | f1/a        |         % 29 - 32
}

% Tie named chords across measures, and soften them a bit.

chordSounds = \chordmode {
  \global
  d1:m/a\pp  | d1:m/a      | c1/g         | c1/g          |  %  1 -  4
  bf1/f      | c1/g        | e1:dim       | d1:m/a        |  %  5 -  8
  s2 bf2/f~  | bf4/f bf2.~ | bf4 a2.:m/e~ | a8:m/e f2../c |  %  9 - 12
  bf1/f      | c1/g        | e1:dim       | d2.:m/a  s4   |  % 13 - 16

  f1/c       | f1/c        | e1:dim       | e1:dim        |  % 17 - 20
  a1:m/e     | e1:dim/bf   | e1:dim       | f1/c          |  % 21 - 24
  r1         | a1:m        | g1:m/d       | g1:m          |  % 25 - 28
  a1:m/e     | bf1/f       | e1:dim/g     | f1/a          |  % 29 - 32
}

melody = \relative c'' {
  \global
  \clef treble
  c4 d e f

  \bar "|."
}

upper = \relative c' {
  \global
  \clef treble

  \sectionLabel \markup{ \box \pad-markup #0.5 "A" }
  f4\fff g8 a4 bf8[ a8 g8]      | %  1
  f4 g8 a4 bf8[ a8 g8]          | %  2
  e4 f8 g2 r8                   | %  3
  e4 f8 g4 a8[ g8 f8]           | %  4
  \break
  d4 f8 bf4 a8 g4               | %  5
  e4 f8 g4 a4.                  | %  6
  bf4 bf8 bf4 a8 g4             | %  7
  f2 d2                         | %  8
  \break
  a'8[ a8] c4 d2                | %  9
  e4 f4 f8 f4 e8                | % 10
  d4 c4. g8[ g8 bf8~]           | % 11
  bf8 a4. a8[ a8] g4            | % 12
  \break
  d4 f8 bf4 a8 g4               | % 13
  e4 f8 g4 a4.                  | % 14
  bf4 bf8 bf4 a8 g4             | % 15
  f4. d8~ d2                    | % 16
  \section  % \bar "||"

  \break

  \sectionLabel \markup{ \box \pad-markup #0.5 "B" }
  a'4 g8 f4 e8[ f8 g8]          | % 17
  a4  g8 f4 e8[ f8 g8]          | % 18
  bf4 a8 g2 r8                  | % 19 (c4 -> bf4)
  bf4 a8 g4 f8[ g8 a8]          | % 20 (c4 -> bf4)
  \break
  c4 a8 e4 f8 g4                | % 21
  bf4 a8 g4 f4.                 | % 22
  e4 e8 e4 f8 g4                | % 23
  a2 c2                         | % 24
  \break
  f8[ f8] d4 c2                 | % 25
  bf4 a4 a8 a4 bf8              | % 26
  c4 d,4. g8[ g8 e8~]           | % 27
  e8 f4. f8[ f8] g4             | % 28
  \break
  c4 a8 e4 f8 g4                | % 29
  bf4 a8 g4 f4.                 | % 30
  e4 e8 e4 f8 g8[ e8]           | % 31
  f1                            | % 32
  \bar "|."
}

%lower = \relative c {
% \global
% \clef bass
% <a d f>1\p                    | %  1
% <a d f>1                      | %  2
% <g c e>1                      | %  3
% <g c e>1                      | %  4
% \break
% <f bf d>1                     | %  5
% <g c e>1                      | %  6
% <e' g bf>1                    | %  7
% <a,~ d~ f~>1                  | %  8
% \break
% <a d f>2 <f~ bf~ d~>2         | %  9
% <f bf d>4 <bf~ d~ f~>2.       | % 10
% <bf d f>4 <e~ a~ c~>2.        | % 11
% <e a c>8 <c f a>2. r8         | % 12
% \break
% <f, bf d>1                    | % 13
% <g c e>1                      | % 14
% <e' g bf>1                    | % 15
% <a, d f>2. r4                 | % 16
% \bar "|."
%}

lower = \relative c {
  \global
  \clef bass
  a8[\pp d8 f8] <a d f>4 f8[ d8 a8]      | %  1
  f'8[ d8 a8] <a d f>4 a8[ d8 f8]        | %  2
  g,8[ c8 e8] <g c, e>4 e8[ c8 g8]       | %  3
  e'8[ c8 g8] <g c e>4 g8[ c8 e8]        | %  4
  \break
  f,8[ bf8 d8] <f bf d,>4 d8[ bf8 f8]    | %  5
  g8[ c8 e8] <g c e,>4 e8[ c8 g8]        | %  6
  e'8[ g8 bf8] <e, g bf>4 bf8[ g8 e8]    | %  7
  a8[ d8 f8] <a,~ d~ f~>4 <a~ d~ f~>4.   | %  8
  \break
  <a d f>2 <f~ bf~ d~>2                  | %  9
  <f bf d>4 <bf~ d~ f~>2.                | % 10
  <bf d f>4 <e~ a,~ c~>2.                | % 11
  <e a, c>8 <c f a>2. r8                 | % 12
  \break
  f,8[ bf8 d8] <f bf d>4 d8[ bf8 f8]     | % 13
  g8[ c8 e8] <g c e,>4 e8[ c8 g8]        | % 14
  e'8[ g8 bf8] <e, g bf>4 bf8[ g8 e8]    | % 15
  <a d f>2. r4                           | % 16
  \bar "||"
  \break

  c8[ f8 a8] <f a c>4 a8[ f8 c8]         | % 17
  a'8[ f8 c8] <f a c>4 c8[ f8 a8]        | % 18
  e8[ g8 bf8] <e, g bf>4 bf'8[ g8 e8]    | % 19
  bf'8[ g8 e8] <e g bf>4 e8[ g8 bf8]     | % 20
  \break
  e,8[ a8 c8] <e, a c>4 c'8[ a8 e8]      | % 21
  bf8[ e8 g8] <e bf' g>4 g8[ e8 bf8]     | % 22
  e8[ bf8 g8] <g bf e>4 g8[ bf8 e8]      | % 23
  <f a c,>1                              | % 24
  \break
  r1                                     | % 25
  e8[ c8 a8] <a c e>4 a8[ c8 e8]         | % 26
  g8[ bf8 d8] <g, bf d>4 d'8[ bf8 g8]    | % 27
  d8[ g8 bf8] <d, bf' g>4 bf'8[ g8 d8]   | % 28
  \break
  e8[ a8 c8] <e, a c>4 c'8[ a8 e8]       | % 29
  d'8[ bf8 f8] <f d bf>4 f8[ bf8 d8]     | % 30
  bf,8[ e8 g8] <g e bf>4 g8[ e8 bf8]     | % 31
  <f a c>1                               | % 32
}

\score {
  <<
    \new ChordNames \frets
    \new FretBoards \frets
  >>
  \layout { indent = 0\mm }
}

\score {
  <<
    \new ChordNames \chordNames
    \new PianoStaff
    <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
  >>
  \layout {
    \autoBeamOff
    indent = 0\mm
  }
}

\score {
  % \transpose c c,       % For Jen
  <<
    \new ChordNames
    \with { midiInstrument = "string ensemble 2" } % "cello" is nice too
    \chordSounds
    \new PianoStaff
    %     \with { midiInstrument = "orchestral harp" }
    <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
  >>
  \midi { }
}
