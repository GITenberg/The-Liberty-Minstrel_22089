\version "2.10"
\include "english.ly"

\header {
  title = "OUR COUNTRYMEN ARE DYING."
  poet = "Words by C. W. Dennison."
  composer = "Tune--\"From Greenland's Icy Mountains.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  Our coun -- try -- men are  dy -- ing Be -- neath their can -- kering 
  chains, Full many a heart is sigh -- ing, Where 
  nought but slav -- 'ry  reigns; No note of joy and 
  glad -- ness, No  voice with free -- dom's  lay, Fall
  on them in their sad -- ness, To  wipe those tears a -- way.
}

treble =  \relative c' {
  \clef treble
  \time 4/4
  \key f \major
  \autoBeamOff
  \stemUp  
  \override Staff.TimeSignature #'style = #'()

  \partial 2 f2 |
      <f a>4 <a c> <a c> <bf d> |
      <a c>2 <f a>4 f |
      e <d f> <g bf> <f a> |

  \break
  <f a>2( <e g>4) f |
      <f a> <a c> <a c> <bf d> |
      <a c>2 <f a>4 <e g> |

  \break
  <f a>4 <bf d> <g c> <g b> |
      <g c>2 <a c> |
      <a f'>4 <f c'> <e bf'> <f a> |

  \break
  <f d'>2 <f c'>4 <c' e> |
      <c f> <a c> <g bf> <f a> |
      <f a>2( <e g>4) f
  
  \break
  <f a>4 <a c> <a c> <bf d> |
      <a c>2 <f a>4 f |
      <e g> <g bf> <f a> <e g> |
      f2 \bar "|."
}

alto =  \relative c' {
  \clef treble
  \time 4/4
  \key f \major
  \autoBeamOff
  \stemDown  
  \override Staff.TimeSignature #'style = #'()

  \partial 2 s2 |
      s1 | s2 s4 f4 | e4 s2. |

  \break
  s2. f4 | s1 | s1 |
  
  \break
  s1 | s1 | s1 |
  
  \break
  s1 | s1 | s2. f4 |
  
  \break
  s1 | s2. f4 | s1 | f2 \bar "|."
}


bass =  \relative c {
  \clef bass
  \time 4/4
  \key f \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 2 f2 |
      f4 f f f |
      f2 f4 a |
      bf a g f |

  \break
  c2. f4 |
      f f f f |
      f2 f4 e |

  \break
  f4 d g g |
      c,2 f |
      f4 a g f |

  \break
  bf2 a4 g |
      f f e f |
      c2. f4
  
  \break
  f4 f f f |
      f2 f4 a |
      bf g c, c
      f2 \bar "|."
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
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

