\version "2.10"
\include "english.ly"

\header {
  title =    "EMANCIPATION SONG."
  poet =     "Words from the \"Bangor Gazette.\""
  composer = "Air, \"Crambambule.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Let wait -- ing throngs now lift their voi -- ces, As
  Free -- dom's glo -- rious day draws near,
}

lineTwo = \lyricmode {
  While ev -- ery gen -- tle tongue re -- joi -- ces, And
  each bold heart is filled with \markup{ "cheer." \hspace #2.0 \raise #3 \rightbrace } The
  slave has seen the Nor -- thern star, He'll soon be free, hur -- rah, hur -- rah!
  Hur -- rah, hur -- rah, \set ignoreMelismata = ##t hur -- \unset ignoreMelismata rah, hur -- rah!
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff
  \stemUp

  \repeat volta 2 {
   \partial 4 <fs a>4 |
   <b d> <a cs>8[ <g b>] |
   <fs a>4. <fs a>8 |
   <g b>[ <fs a>] <g b>[ <a cs>] |
   <a d> <fs a>4 <fs a>8 |

   \break
   <g b>8[ <fs a>] <e g>[ <d fs>] |
   <g b>[ <fs a>] <e g>[ <d fs>] |
   e4 <e a> |
   \partial 8*3 <e a>4. |
   }
  \partial 8 <fs a>8 |

  \break
  <d fs>8 <fs a> <fs a> <fs a> |
  <g b> <fs a> <fs a> ~ <fs a> |
  <d fs> <fs a> <fs a> <fs a> |
  <g b> <fs a> <fs a> <fs a> |

  \break
  \stemDown <b d>4( <cs e>8) <cs e> |
  <d fs>4( <b d>8) <b d> |
  <a e'>4( <a cs>8) <a cs> |
  \stemUp <fs a d>2 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key d \major
  \autoBeamOff

  \repeat volta 2 {
   \partial 4 d4 |
   d d |
   d4. d8 |
   g[ fs] e4 |
   d8 d4 d8 |

   \break
   \stemUp d4 d |
   d d |
   \stemNeutral a a
   \partial 8*3 a4.
   }
  \partial 8 \stemUp d8 |

  \break
  d8 d d d |
  d d d ~ d |
  d d d d |
  d d d d |

  \break
  \stemNeutral g4( a8) a |
  d,4( g8) g |
  a4( a,8) a |
  \stemUp d2
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
}

\score {
  \unfoldRepeats {
     <<
      \context Staff = upper <<
         \context Voice = upper \treble
      >>
      \context Staff = lower <<
         \context Voice = lower \bass
      >>
    >>
  }  
  \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}
}

%%Transcriber's Note:

%%3rd system: lyrics do not match note values in original; tie added in second bar to correct.

%%A second score block is provided to unfold the repeat and generate the midi.