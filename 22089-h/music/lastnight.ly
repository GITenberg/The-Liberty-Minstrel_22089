\version "2.10"
\include "english.ly"

\header {
  title =    "THE LAST NIGHT OF SLAVERY."
  composer = "Tune--\"Cherokee Death-song.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  \set ignoreMelismata = ##t Let \unset ignoreMelismata the floods clap their hands, Let the moun -- tains re --
  joice, Let all the glad lands Breathe a ju -- bi -- lant
  voice; The sun that now sets on the waves of the
  sea Shall gild with his ris -- ing the land of the free.
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key f \major
  \autoBeamOff 
  \stemUp

  \partial 8*1 <a' c>16( <a c>) |
  <a c>4 <f a>8. <g bf>16 |
  <a c>4 <bf d>8. <a c>16 |
  <g bf>4 <e g>8. <e g>16 |

  \break
  <e g>4 \voiceOne << { g8.[ a16] } \context Voice="1" { \voiceTwo \autoBeamOff e8. f16 \oneVoice } >> \oneVoice |
  \stemUp <g bf>4 <e g>8 <f a> |
  <g bf>8[ <bf d>] <a c>8. <g bf>16 |
  <f a>4 \voiceOne << { f8. f16 } \context Voice="1" { \voiceTwo \autoBeamOff f8. f16 \oneVoice } >> \oneVoice |

  \break
  \stemUp f4 \stemDown e8 \melisma f \melismaEnd |
  \stemUp <e g>4 <e g>8. <e g>16 |
  <e g>8[ <f a>] <f a>8. f16 |
  e16[ c8.] c8 c |

  \break
  c4 e8. \melisma f16 \melismaEnd |
  <e g>4 <e g>8 <f a> |
  <g bf>8[ <bf d>] <a c>8. <g bf>16 |
  <f a>4 <d f>8. <d f>16 |
  \partial 8*3 <d f>4 r8 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key f \major
  \autoBeamOff

  \partial 8*1 f16( f) |
  f4 f8. f16 |
  f4 f8. f16 |
  c4 c8. c16 |

  \break
  c4 c8. ~ c16 |
  c4 c8 c |
  c4 c8. c16 |
  f4 f8. f16 |

  \break
  f4 c8 ~ c |
  c4 c8. c16 |
  c4 f8. a16 |
  c4 c8 c |

  \break
  c4 bf8. a16 |
  g4 c,8 f |
  bf,4 c8. c16 |
  f4 f8. f16
  \partial 8*3 f4 r8 |
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble } 
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Lyrics \override LyricSpace #'minimum-distance = #2 }	
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   
}
