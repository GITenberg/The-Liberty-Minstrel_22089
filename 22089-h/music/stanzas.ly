\version "2.10"
\include "english.ly"

\header {
 title = "STANZAS FOR THE TIMES."
  poet = "Words by J. G. Whittier."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
Is this the land our fa -- thers loved, The free -- dom
  which they toiled to win? Is this the soil where -- on they
  moved? Are these the graves they slum -- ber in? Are we the
    sons by whom are borne, The man -- tles which the dead have won?
}


trebleOne =  \relative c' {
  \key bf \major
  \time 6/8
  \clef treble
  \override Stem #'neutral-direction = #up
  \autoBeamOff

  \partial 8*3 f8 f f |
      d'4. d8 \stemDown  bf bf \stemNeutral |
      f4. f8 bf  f |

  \break
  f4. f8 a bf |
      a4.\fermata a8 a a |
      a4. a8 bf c |

  \break
  d4. bf16[ a] g8 bf |
      a4. a8 bf a |
      \stemDown bf4.\fermata c8 c bf16[ c] |
  
  \break
  d4. d8 f f |
      \stemDown bf,4. bf8 bf bf |
      d4. c8 bf c |
      d4. \bar "|."
}

altoone =  \relative c' {
  \key bf \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp

  \partial 8*3 f8 f f |
      <f bf>4. <f bf>8 <f d'> f |
      <d bf'>4. <d bf'>8 <f d'> <f bf> |

  <f bf>4. <f bf>8 <f c'> <f d'> |
      <f c'>4.^\fermata f8 <f c'> <f c'> |
      <f c'>4. <f c'>8 <f d'> <f f'> |

  <g bf>4. <g d'>16[ <g c>] <g bf>8 <g bf> |
      <f c'>4. <f c'>8 <f d'> <f c'> |
      <d f>4.^\fermata f8 f g |
  
  <f bf>4. <f bf>8 <a c> <bf d> |
      <d, f>4. <d f>8 <d f> <ef g> |
      <g bf>4. <f c'>8 <f d'> <f f'> |
      <f bf>4. \bar "|."
}

altotwo =  \relative c' {
  \key bf \major
  \time 6/8
  \clef treble
  \stemDown
  \autoBeamOff

  \partial 8*3 f8 f f |
      s8*5 f8 |
      s8*6 |

  s8*6 |
      s4. f8 s8  s8 |
      s8*6 |

  s8*6 |
      s8*6 |
      s4. f8 f8 f8 |
      
  s8*6 |
      s8*6 |
      s8*6 |
      s4. \bar "|."
}

bass =  \relative c {
 \key bf \major
  \time 6/8
  \clef bass
  \override Stem #'neutral-direction = #up
  \autoBeamOff

  \partial 8*3 f8 f d |
  bf4. bf8 bf bf |
  bf4. bf8 bf bf |

  d4. d8 f f |
  f4.\fermata f8 f f |
  f4. f8 bf f |

  g4. g8 g g |
  f4. f8 f f |
  bf,4.\fermata f'8 f ef |
  
    d4. d8 f f |
  bf,4. bf8 bf ef |
  g4. f8 f f |
  bf,4. \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" 
     <<
     \new Voice = "trebleTwo" { \altoone }
     \new Voice = "trebleThree" { \altotwo }
     >>
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}
