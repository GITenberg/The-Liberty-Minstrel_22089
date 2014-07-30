\version "2.10"
\include "english.ly"

\header {
  title =    "PRAISE AND PRAYER."
  poet =     "Words by Miss Chandler."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Praise for slum -- bers of the night, For the
  waken -- ing mor -- ning's light,
}

lineTwo = \lyricmode {
  For the board with plen -- ty spread, Glad -- ness
  o'er the spi -- rit \markup{ "shed;" \hspace #1.0 \raise #3 \rightbrace } Health -- ful pulse and cloud -- less
  eye, Open -- ing on the smil -- ing sky.
}

lineThree = \lyricmode {
  Health -- ful pulse and cloud -- less eye, Open -- ing
  on the smil -- ing sky.
}

treble = \relative c' {
  \clef treble
  \time 3/4
  \key c \major
  \autoBeamOff

  \tag #'main { \repeat volta 2 {
    \partial 4 \stemUp <e g>8 <e g> |
    <f a>4 <e g> <e c'>8 <e g> |
    <f a>4( <e g>) <e c'>8 <e c'> |

    \break
    <g d'>4 <g d'> <g b>8 <g b> |
    <e g c>2
  } }
  \tag #'toDC { 
  <b' d>8 <b d> |
  \stemDown <c e>4 <b d> <e g>8 <b d> |

  \break
  \stemNeutral <c e>4( <b d>) <b d>8 <b d> |
  <c e>4 \stemUp <a c> \stemNeutral <g b>8 <fs a>
  \voiceOne << { g2^\markup { \bold "D.C." } } \context Voice="1" { \voiceTwo g2 \oneVoice } >> \oneVoice \bar "|."
  }
}

bass = \relative c {
  \clef bass
  \time 3/4
  \key c \major
  \autoBeamOff

    \tag #'main { \repeat volta 2 {
    \partial 4 c8 c |
    c4 c c8 c |
    f4( c) c8 c |

    \break
    f4 \stemUp d \stemNeutral g8 g
    c,2
  } }
  \tag #'toDC { 
  g'8 g |
  g4 g g8 g |

  \break
  g4 ~ g g8 g |
  c,4 c \stemUp d8 d |
  \stemNeutral g2 \bar "|."
  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \lineThree }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
	  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble  \keepWithTag #'main \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass \keepWithTag #'main \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
}

%%Transcriber's Notes:

%%A second score is provided to unfold the repeats and generate the midi.