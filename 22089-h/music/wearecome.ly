\version "2.10"
\include "english.ly"

\header {
  title = "WE ARE COME, ALL COME."
  poet = "By G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  We are  come, all come, with the  crow -- ded throng,
  To  join our notes in a  plain -- tive song;
  For the  bond man sighs, and the  scal -- ding tear
  Runs _ down his cheek while we   min -- gle here.
}

verseTwo = \lyricmode {
  We are  come, all come, with a  hal -- lowed vow,
  At  the shrine of slave -- ry  never to bow,
  For the  des -- pots reign o'er _ hill and plain,
  Spreads _ grief and woe in his   hor -- rid train.
}

treble =  \relative c' {
  \clef treble
  \time 4/4
  \key f \major
  \autoBeamOff
  \stemUp  
  \override Staff.TimeSignature #'style = #'()

  \partial 4 f8 <e g>8 |
      <f a>4 <f a> <f a> <e g>8 <f a> |
      <a c>8[ <g bf>] <g bf>4 <g bf> <e g>8[ <f a>8] |

  \break
  <g bf>4 <g bf> <g bf> <f a>8 <g bf> |
      <bf d>8[ <a c>] <a c>4 <a c>_\fermata <a c>8 <d f> |
      <d f>8[ <c e>] <c e>[ <bf d>] <bf d>[ <c a>] <c a> <d f> |

  \break
  <d f>8[ <c e>] <c e>[ <bf d>] <bf d>[ <a c>] <a c> <f a> |
      f4 f f f8 <e g> |
      <f a>4 <e g> f^\fermata \bar "|."
}

alto =  \relative c' {
  \clef treble
  \time 4/4
  \key f \major
  \autoBeamOff
  \stemDown  
  \override Staff.TimeSignature #'style = #'()

  \partial 4 f8 s8 | s1 | s1 |

  \break
  s1 | s1 | s1 |
  
  \break
  s1 | f4 f4 f4 f8 s8 | s4 s4 f4 \bar "|."
}


bass =  \relative c {
  \clef bass
  \time 4/4
  \key f \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 f8 c8 |
      f4 f f e8 d8 |
      c4 c c c |

  \break
  c4 c c \stemUp d8 \stemNeutral c |
      f4 f f^\fermata f8 f |
      f[ a] a[ g] g[ f] f ~ f |

  \break
  f8[ a] a[ g] g[ f] f f |
      f4 f f a8 bf8
      c4 c, f^\fermata \bar "|."
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
             << 
     \new Voice = "treble" { \treble }
     \new Voice = "alto" { \alto }
             >> 
     \new Lyrics \lyricsto "treble" { \verseOne }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \verseTwo }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Lyrics \override LyricSpace #'minimum-distance = #2 }	
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}    
   }

