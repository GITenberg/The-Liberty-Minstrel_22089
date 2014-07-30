\version "2.10"
\include "english.ly"

\header {
  title = "ROUSE UP, NEW ENGLAND."
  poet = "Words by a Yankee."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Rouse up, New Eng -- land! Buck -- le on your mail of proof sub --
  lime, your stern old hate of tyr -- an -- ny, your
  deep con -- tempt of crime; A trai -- tor plot is
   hatch -- ing now, more full of woe and shame, Than
  ev -- er from the i -- ron heart of blood -- iest des -- pot came.
}


trebleOne =  \relative c' {
  \key g \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \partial 8 b'8 |
      d d b4 b |
      c8 e d4 d |
      a8 a \stemUp b4 \stemNeutral c8.[ b16] |

  \break      
  a2 d4 |
      c8 b e4 d |
      c8 b c4 c |

  \break    
  b8 b a4 d |
      d2^\fermata b4 |
      c8 b d4. g,8 |
  
  \break    
  e'8 e d4 a |
      d8 b8 b4. d8 |
      a2 a4 |

  \break    
  d8 d b4 b |
      c8 e d4 b |
      e8 c d4. a8 |
      b2 \bar "|."
}

altoOne =  \relative c' {
  \key g \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \partial 8 <g' d'>8 |
      <b g'> <b g'> <g d'>4 <g d'> |
      <g e'>8 \stemDown <g c> \stemUp <g b>4 <g b> |
      <fs d'>8 <fs d'> \stemDown <g g'>4 \stemUp e' |

  d4 ~ d4 \stemDown <b g'> |
      <g e'>8 <g d'> <g c>4 <g b> |
      <a c>8 <b d> <a e'>4 <a e'> |

  <g d'>8 <g d'> <g d'>4 <a fs'> |
      <b g'>2^\fermata <g g'>4 |
      <g e'>8 <g d'> \stemUp <g b>4. <g b>8 |
  
  <g c>8 <g c> <g b>4 <a c> |
      <g b>8 \stemDown <b d>8 <g g'>4. \stemUp <g b>8 |
      <fs d'>2 d'8[ fs] |

  \stemDown <g, g'>8 <g g'> <g d'>4 <g d'> |
      <g e'>8 \stemUp <g c> <g b>4 d'8[ e] |
      <g, c>8 <fs a> <g>4 <d fs> |
      <d g>2 \bar "|."
}

altoTwo =  \relative c' {
  \key g \major
  \time 3/4
  \clef treble
  \stemDown

  \partial 8 s8 |
      s2. |
      s2. |
      s4 s4 a'8[ g] |
      
  fs2 s4 |
      s2. |
      s2. |

  s2. |
      s2. |
      s2. |
      
  s2. |    
      s2. |
      s2 fs4 |
      
  s2. |
      s4 s4 g4 |
      s4 g4 s4 |
      s2 \bar "|."
}

bass =  \relative c {
  \key g \major
  \time 3/4
  \clef bass
  \autoBeamOff	
	
 \partial 8 g'8 |
      g g g4 g |
      c,8 c g'4 g |
      d8 d g4 a4 |

  \stemUp d,2 \stemNeutral g4 |
      c,8 c c4 g' |
      a8 g c,4 c |

  g'8 g \stemUp d4 d |
      \stemNeutral g2^\fermata g4 |
      g8 g g4 e |
  
  c8 c g'4 fs |
      g8 g8 g4. g8 |
      \stemUp d2 d4 |

  \stemNeutral g8 g g4 g |
      c,8 c g'4 b, |
      c8 c \stemUp d4 d |
      <g g,>2 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" 
     <<
     \new Voice = "altoOne" { \altoOne }
     \new Voice = "altoTwo" { \altoTwo }
     >>
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}   

}
