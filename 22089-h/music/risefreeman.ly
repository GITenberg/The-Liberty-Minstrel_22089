\version "2.10"
\include "english.ly"

\header {
  title = "RISE, FREEMEN, RISE."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}


words = \lyricmode {
  Rise, free -- men, rise! the call goes forth, At -- tend the high com --
  mand; O -- be -- dience to the word of God, Through --
  out this guil -- ty land: Through -- out this guil -- ty land.
}


trebleOne = \relative c' {
  \key c \major
  \time 3/4
  \clef treble
  \autoBeamOff
  \stemUp

  \partial 4 g'4 |
      <g c>8 <e g> <g c>4 <f c'> |
      <g d>8 <g b> <e g>4 <e g> |
      <c' e>8 <c e> <d f>4 <c e> |

  \break    
  <b d>2^\fermata g4 |
      <g c>8 <g c> <g e'>4 <f c'> |
      a8 <a c> g4 g |

  <a c>8 <c e> <e g>4 d |
      <g, c e>2^\fermata <b d>4 |
      <c e>8 <c g'> <b d>4 <c e>8[ <g b d>] |
      <e g c>2. \bar "|."
}

trebleTwo = \relative c' {
  \key c \major
  \time 3/4
  \clef treble
  \autoBeamOff
  \stemDown
  
  \partial 4 g'4 |
      s2. |
      s2. |
      s2. |
      
  s2 g4 |
      s2. |
      a8 s8 g4 g |
      
  s2 d'4 |    
      s2. |
      s2. |
      s2. \bar "|."
}      
      
bass = \relative c {
\key c \major
  \time 3/4
  \clef bass
  \autoBeamOff
  
  \partial 4 c4 |
      c8 c c4 a' |
      g8 g c,4 g' |
      c8 c b4 c |

  g2^\fermata e4 |
      c8 c c'4 a |
      f8 f g4 e |

  c8 c c4 g' |
      c,2^\fermata g'4 |
      e8 e g4 g |
      c,2. \bar "|."
}



\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
            <<
         \new Voice = "trebleOne" { \trebleOne } 
         \new Voice = "trebleOne" { \trebleTwo }
            >>	 
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  } 
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    

}
