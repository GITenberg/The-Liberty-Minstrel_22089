\version "2.10"
\include "english.ly"

\header {
  title = "THE MAN FOR ME."
  poet = "Parody by J. N. T. Tucker."
  composer = "Air, \"The Rose that all are praising.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Oh, he is not the man for me, Who  buys or sells a 
  slave, Nor  he who will not set him free, But 
  sends him to his grave;  But he  whose no -- ble heart beats warm For 
  all men's life and  lib -- er -- ty; Who  loves a -- like each
  hu -- man form-- Oh  that's the man for  me,  Oh  that's the man for 
  me,  Oh  that's the man for me. 
}

treble =  \relative c' {
  \clef treble
  \time 6/8
  \key f \major
  \autoBeamOff
  \stemUp  

  \partial 8 <f a>8 |
      <f a>4 <f a>8 <f a>4 <e g>8 |
      <e g>4 <e g>8 f4 f8 |
      <e g>4 <e g>8 <e g>[ <d f>] <e g> |

  \break
  <f a>4. ~ \once \override TieColumn #'tie-configuration = #'((-5 . -1)  (-5 . -1)) <f a>4 <f a>8 |
      <f a>4 <f a>8 <f a>4 <e g>8 |
      <e g>4 f8 f4 f8 |

  \break
  <e g>4 <e g>8 <e g>[ <d f>] <e g> |
      \once\override Tie  #'control-points = #'((1.5 . 2.5) (3 . 4) (8.5 . 4) (10 . 2.5))
      f4. ~  f4 <e g>8 |
      <e g>4 <e g>8 <e g>4 <e g>8 |
      <f a>4 <f a>8 <f a>4 <f a>8 |

  \break
  <f a>4 <f a>8 <f a>[ <g bf>] <a c> |
      c8[ g] <e g> <e g>[^\fermata c'] <g bf> |
      <f a>4 <f a>8 <f a>4 <e g>8 |
  
  \break    
  <e g>4 f8 f4 f8 <e g>4 <e g>8 <e g>[ <d f>] <e g> |
      <f a>4.( <a c>4) <f a>8 |
      <a c>4 <f a>8 <a c>4 <f a>8 | 

  \break
  <a c>4.( <a f'>4) <a c>8 | 
      <a c>8[ <f a>] f <e g>[ <d f>] <e g> |
      \once \override Tie #'transparent = ##t
      f4. ~ f4  \bar "|."
}

alto = \relative c' {
  \clef treble
  \time 6/8
  \key f \major
  \autoBeamOff
  \stemDown 
	
  \partial 8 s8 |
      s2. |
      s4 s8 f4 f8 |
      s2. |
      
  s4. s4 s8 |
      s2. |
      s4 f8 f4 f8 |
      
  s2. |
      \once \override Tie #'transparent = ##t f4. ~ f4 s8 |
      s2. |
      s2. |
      
  s2. |
      e4 s8 e4 s8 |
      s2. |
      
  s4 f8 f4 f8 |
      s2. |
      s2. |
      s2. |
      
  s2. |
      s4 f8 s4 s8 |
      \once\override Tie  #'control-points = #'((1.5 . -2.5) (3 . -3.5) (11.5 . -3.5) (13 . -2.5))
      f4. ~ f4 \bar "|."	
}	

bass =  \relative c {
  \clef bass
  \time 6/8
  \key f \major

  \autoBeamOff
  \override Stem #'neutral-direction = #up

  \partial 8 f8 |
      f4 f8 f4 c8 | 
      c4 c8 f4 f8 | 
      c4 c8 c4 c8 |

  \break
  f4. ~ f4 f8 | 
      f4 f8 f4 c8 | 
      c4 f8 f4 f8 |

  \break
  c4 c8 c4 c8 | 
      f4. ~ f4 c8 | 
      c4 c8 c4 c8 | 
      f4 f8 f4 f8 |

  \break
  f4 f8 f4 f8 | 
      c4 c8 c4^\fermata c8 | 
      f4 f8 f4 c8
  
  \break    
  c4 f8 f4 f8 | 
      c4 c8 c4 c8 | 
      f4.( f4) f8 | 
      f4 f8 f4 f8 |

  \break
  f4. ~ f4 f8 | 
      f4 a8 c4 c,8 | 
      f4. ~ f4 \bar "|."
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
         <<
         \new Voice = "treble" { \treble }
         \new Voice = "alto" { \alto }
	  >>
     
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

