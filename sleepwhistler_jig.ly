% Irish template (KJC)
%
% Sleepwhistler Jig
% Transcribed by Kevin Cole [ubuntourist@hacdc.org] 2024-11-19 (kjc)
%

\version "2.26.0"
\language "english"

\include "predefined-guitar-fretboards.ly"
\include "articulate.ly"
\include "/home/kjcole/.local/lib/lilypond/larsen-symbols.ily"

% Use environment variable to decide if discrete pagination (PDF) or
% continuous pagination (SVG). Default to SVG if none defined.
%
pageBreaking = #(string-append (getenv "HOME") "/.local/lib/lilypond/" (if (getenv "PAGE_BREAKING") (getenv "PAGE_BREAKING") "svg") ".ily")
\include \pageBreaking

% Asking Perplexity AI about sustaining chords a bit...
%
% It suggests "You can also use the \laissezVibrer command (often
% abbreviated as \l.v.) to let notes ring" Normally, it has to be
% added after every single chord. However, Perplexity helpfully
% offered (when prompted) the following macro to apply the effect
% "globally"
%

applyLV = #(define-music-function (music) (ly:music?)
  (map-some-music
    (lambda (e)
      (if (eq? (ly:music-property e 'name) 'EventChord)
          (begin
            (set! (ly:music-property e 'articulations)
                  (cons (make-music 'LaissezVibrerEvent)
                        (ly:music-property e 'articulations)))
            e)
          #f))
    music))

\header {
  tagline       = ##f    % Remove default LilyPond tagline
  enteredby     = "KJC"
  title         = \markup \with-color "#804000" \with-url #"sleepwhistler_jig.mp3" "The Sleepwhistler"
  subtitle      = \markup \with-color "#B82E00" "(Jig)"
  subsubtitle   = "[November 10, 2024]"
  % poet        = \markup { "Words by "      \smallCaps "Kevin Cole" }
  composer      = \markup { "Decomposed by " \smallCaps "Kevin Cole" }
  arranger      = \markup { "Deranged by "   \smallCaps "Kevin Cole" }
  copyright     = \markup { "Copyleft"  \char ##x1F12F \smallCaps "Tadonic the Flautulent, Breaker of Wind," "2024-11-10" }
  % copyright   = \markup { "Copyright" \char ##x00A9  \smallCaps "Tadonic the Flautulent, Breaker of Wind," "2024-11-10" }
  % metre       = ""
  % opus        = ""
  % piece       = ""
  % source      = ""
  % dedication  = ""
  % texidoc     = "All header fields with special meanings."
  % instrument  = \markup { \smallCaps { "Soprano" } }
}

global = {
  \numericTimeSignature
  \time 6/8
  \key d \major
  % \set Score.tempoHideNote = ##t
  % \tempo \markup { \italic "With tempo" }
}

frets = \chordmode {
% d s b:m s e:m s g s fs:m s cs:dim s a s
  d s b:m s e:m s g s fs:m s a s
}

chordNames = \chordmode {
  \global
  \partial 8 s8 |                              %  0
  \repeat volta 2 {
    d2. | b2.:m | d2. | e4.:m d4. |            %  1 -  4
    d2. | g2. |                                %  5 -  6
  }
  \alternative {
    { fs2.:m | d2.      | }                    %  7 -  8 (Ending 1)
%   { fs2.:m | cs4.:dim d4. | }                %  7 -  8 (Ending 2)
    { fs4.:m g4. | a4. d4. | }                 %  7 -  8 (Ending 2)
  }

  \repeat volta 2 {
    d2. | d4. a4. | d2. | e4.:m a4. |          %  9 - 12
    d2. | d4. a4. | g2. |                      % 13 - 15
  }
  \alternative {
    { a4. d4. | }                              % 16 (Ending 1)
    { d2. | }                                  % 16 (Ending 2)
  }
}

playChords = \chordmode {
  \global
% \set ChordNames.midiInstrument = "acoustic guitar (nylon)"
% \set ChordNames.midiInstrument = "acoustic grand"   % piano
% \set ChordNames.midiInstrument = "tremolo strings"
% \set ChordNames.midiInstrument = "pizzicato strings"
  \set ChordNames.midiInstrument = "orchestral harp"
  \applyLV
  \transpose c' c {
    \global
    \partial 8 s8 |                            %  0
    \repeat volta 2 {
%     d2.\ppppp | b2.:m | d2. | e4.:m d4. |    %  1 -  4
      d2. | b2.:m | d2. | e4.:m d4. |          %  1 -  4
      d2. | g2. |                              %  5 -  7
    }
    \alternative {
      { fs2.:m | d2.      | }                  %  7 -  8 (Ending 1)
%     { fs2.:m | cs4.:dim d4. | }              %  7 -  8 (Ending 2)
      { fs4.:m g4. | a4. d4. | }               %  7 -  8 (Ending 2)
    }

    \repeat volta 2 {
      d2. | d4. a4. | d2. | e4.:m a4. |        %  9 - 12
      d2. | d4. a4. | g2. |                    % 13 - 15
    }
    \alternative {
      { a4. d4. | }                            % 16 (Ending 1)
      { d2. | }                                % 16 (Ending 2)
    }
  }
}

melody = \relative c' {
  \global
  \set melismaBusyProperties = #'()
  \set Staff.midiInstrument = "recorder"
  \clef treble

  \sectionLabel \markup{ \box \pad-markup #0.5 "A" }
  \partial 8 a'8               | %  0
  \repeat volta 2 {
    d,8[ fs8 a8] d8[ a8 fs8]   | %  1
    d8[ fs8 a8] b8[ a8 fs8]    | %  2
    d8[ fs8 a8] d8[ a8 fs8]    | %  3
    g8[ fs8 e8] fs4 a8         | %  4
    \break
    d,8[ fs8 a8] d8[ a8 fs8]   | %  5
    g8[ fs8 g8] e8[ fs8 g8]    | %  6
  }

  \alternative {
    {
      fs8[ e8 fs8] g8[fs8 e8] | %  7 (Ending 1)
      fs8[ e8 d8] d4 a'8      | %  8 (Ending 1)
    }
    {
      fs8[ e8 fs8] g8[fs8 g8] | %  7 (Ending 2)
      a8[ b8 cs8] d4 a8       | %  8 (Ending 2)
    }
  }
  \bar "||"
  \break

  \sectionLabel \markup{ \box \pad-markup #0.5 "B" }
  \set Score.currentBarNumber = #9
  \repeat volta 2 {
    d8[ fs8 fs8] g8[ e8 e8]    | %  9
    fs8[ d8 d8] e8[ cs8 a8]    | % 10
    d8[ fs8 fs8] g8[ e8 e8]    | % 11
    fs8[ e8 d8] e4 a,8         | % 12
    \break
    d8[ fs8 fs8] g8[ e8 e8]    | % 13
    fs8[ e8 d8] e8[ cs8 a8]    | % 14
    g8[ fs8 g8] e8[ fs8 g8]    | % 15
  }

  \alternative {
    { a8[ b8 cs8] d4 a8 | }      % 16 (Ending 1)
    { fs8[ d8 d8] d4. | }        % 16 (Ending 2)
  }

  \bar "|."
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
    \new Voice = "mel" \melody
  >>

  \layout {
    \autoBeamOff
    indent = 0\mm
    \context {
      \Staff
      \RemoveAllEmptyStaves
    }
  }
}

\score {
  \unfoldRepeats {
    \articulate
    <<
      \new ChordNames \playChords
      \new Voice = "mel" \melody
    >>
  }

  \midi {
    \tempo 4=124
  }
}
