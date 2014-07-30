\version "2.10"
\include "english.ly"

\header {
  title = "SONG OF THE FREE."
  poet = "Parodied by G. W. C."
  composer = "Tune, Lutzow's Wild Hunt."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  From vall -- ey and moun -- tain, from hill -- top and glen, What
  shouts thro' the air are re -- bound -- ing! And ech -- o is send -- ing the sounds
  back a -- gain, And loud thro' the air they are sound -- ing, And
  loud through the air they are sound -- ing; And if you
  ask what those joy -- ous \set associatedVoice = "bass" strains? 'Tis the 'Tis the
  songs of bond -- men now burst -- ing their chains.
}

soprano =  \relative c' {
  \key c \major
  \time 6/8
  \clef treble
  \autoBeamOff

  \partial 8 c8 |
      c8 c8 c8 c8 c8 c8 |
      c8 c8 c8 c4 e8 |

  \break    
  e8 e8 e8 e8 g8 e8 |
      g2. |
      e4. r4 f8 |
      f8 f8 f8 f8 f8 f8 |

  \break    
  f8. f16 f8 f4 f8 |
      f8 f8 f8 f8 f8 f8 |
      f8[ c8 f8] f4 f8 |
  
  \break    
  g8 g8 g8 a8 a8 a8 |
      d4. d4 r8 | R2. |
      
  \break
  R2.*4 \repeat volta 2 { g,4. g4. |

  \break	  
  g4. g4. |
      g8 g8 g8 g8 e8 g8 |
  g4._\fermata ~ g4 r8 }
}

alto =  \relative c' {
  \key c \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp

  <e g>8 |
      <e g>8 <e g>8 <e g>8 <e g>8 <c e>8 <e g>8 |
      <e g>8 <e c'>8 <e g>8 <e g>4 <g c>8 |

  <g c>8 <g c>8 <g c>8 <g c>8 <e g>8 <g c>8 |
      <c e>2. |
      <g c>4. r4 f8 |
      f8 f8 f8 f8 f8 <f a>8 |

  <f bf>8. <f bf>16 <f bf>8 <f a>4 <a c>8 |
      <a c>8 <a c>8 <a c>8 <a c>8 <f a>8 <a c>8 |
      c8[ f8 c8] <a c>4 <a c>8 |
  
  <g c>8 <g c>8 <g c>8 <fs c'>8 <fs c'>8 <fs c'>8 |
      <g b>4. <b d>4 r8 |
      g4. g4 g8 |

  af8 g8 fs8 g4 b8 |
      d4. r4 r8 |
      R2.*2 \repeat volta 2 { \stemDown <c e>4. <c e>4. |

  <e g>4. <c e>4. |
      <b d>8 <b d>8 <b d>8 <b d>8 <g c>8 <b d>8 |
      <c e>4.^\fermata ~ <c e>4 r8 }
}

tenor = \relative c' {
  \key c \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemDown

  s8 |
      s2. |
      s2. |

  s2. |
     s2. |
      s4. s4 f8 |
      f8 f8 f8 f8 f8 s8 |

  s2. |
      s2. |
      a4. s4 s8 |
  
  s2. |
      s2. |
      g4. g4 g8 |

  af8 g8 fs8 g4 b8 |
      d4. s4 s8 |
      R2.*2 \repeat volta 2 { s4. s4. |

  s2. |
      s2. |
      s4. s4  s8 }
}
  
bass =  \relative c {
  \key c \major
  \time 6/8
  \clef bass
  \autoBeamOff	
  \override Stem #'neutral-direction = #up

  c8 |
      c8 c8 c8 c8 c8 c8 |
      c8 c8 c8 c4 c8 |

  c8 c8 c8 c8 c8 c8 |
      c2. |
      c4. r4 f8 |
      f8 f8 f8 f8 f8 c8 |

  df8. df16 df8 df4 f8 |
      f8 f8 f8 f8 f8 f8 |
      f8[ c8 f8] f4 f8 |
  
  e8 e8 e8 fs8 fs8 fs8 |
      g4. g,4 r8 |
      R2. |
      
  R2.*2 |
       c'2. |
       c,2. \repeat volta 2 { c4. c4. |

  c4. c4. |
      g8 g8 g8 g8 g8 g8 |
       c4._\fermata ~ c4 r8  }
}

\score { 
<<	
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Staff = "upperTwo" 
               <<
     \new Voice = "alto" { \alto }
     \new Voice = "tenor" { \tenor }
               >> 
     \new Lyrics = "lyrics" {s1}
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   \context Lyrics = "lyrics" \lyricsto "alto" \verseOne
>>

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }

}

\score { 
	
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \unfoldRepeats \soprano }
     \new Staff = "upperTwo" 
               <<
     \new Voice = "alto" { \unfoldRepeats \alto }
     \new Voice = "tenor" { \unfoldRepeats \tenor }
               >> 
     \new Staff = "bass"  \new Voice = "bass" { \unfoldRepeats \bass }
   >>
   
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 140 4 ) }}   

}

%%Transcriber's Note:

%%Lyrics alignment has been corrected in the 2nd and 3rd systems.

%%Second score provided to unfold repeats and generate midi.