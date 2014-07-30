\version "2.10"
\include "english.ly"

\header {
  title = "THE CLARION OF FREEDOM."
  poet = "Words from the Emancipator."
  composer = "Music \"The Chariot.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  The clar -- ion-- the clar -- ion of Free -- dom now
  sounds, From the east to the west In -- de --
  pend -- ence re -- sounds; From the hills, and the
  streams, and the far dis -- tant skies, Let the
  shout In -- de -- pend -- ence from Slav -- 'ry a -- rise.
}

treble =  \relative c' {
  \key d \major
  \time 2/2
  \clef treble
  \autoBeamOff
  \stemUp  
  \override Staff.TimeSignature #'style = #'()

  \partial 8 a'8 |
      <fs a>2<fs a>8 r4 <d' fs>8 |
      <d fs>2<d fs>8 r4 <b d>8 |
      <a e'>2 <a d>4 <a cs>4 |

  \break    
  <a d>2 <fs a>4. <d' fs>8 |
      <a d>2 <cs e>4. <cs e>8 |
      <d fs>2 <cs e>4. <cs e>8 |

  \break
  <b d>2 <a cs>4. <gs b>8 |
      <e a>2^\fermata <fs a>4. <fs d'>8 |
      <fs a>2 <d' fs>4. <cs e>8 |

  \break    
  <b d>2 <d, fs>4 <e g>4 |
     <fs a>2 <a d>4. <g b>8 |
     <fs a>2^\fermata <a d>4. <cs e>8 |

  \break   
  <b fs'>2 <cs e>4 <d fs>4 |
     <b d>2 <fs a>4. <e' g>8 |
     <a, d fs>2 <a e'>4. <a e'>8 |
     <fs a d>2. \bar "|."
}

bass =  \relative c {
  \key d \major
  \time 2/2
  \clef bass
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()


 \partial 8 \stemUp d8 |
      d2 d8 r4 d8 |
      d2 d8 r4 d8 |
      a2 a4 a4 |

  \stemDown d2 d4. d8 |
      d2 a'4. a8 |
      fs2 e4. e8 |

  d2 e4. e8 |
      \stemUp a,2^\fermata d4. d8 |
      d2 d4. d8 |

  \stemDown d2 d4 d4 |
      d2 d4. d8 |
      d2^\fermata a'4. a8 |
  
  d2 a4 a4 |
      d,2 fs4. g8 |
      a2 \stemUp a,4. a8 |
      d2. \bar "|."
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 2 ) }}    
   }

%%Transcriber's Notes:

%%3rd system, treble staff, 1st bar, last chord: G-natural changed to G-sharp to correct dissonance.

%%4th system, bass staff, 3rd bar, 1st note: added missing fermata.
