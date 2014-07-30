\version "2.10"
\include "english.ly"

\header {
  title = "SLAVE'S WRONGS."
  poet = "Words by Miss Chandler."
  composer = "Arranged from \"Rose of Allandale.\""
  tagline = ""
}

words = \lyricmode {
  With  ach -- ing brow and  wea -- ried limb, The  
  slave his toil pur -- sued; And  oft I saw 
  the  cru -- el scourge Deep  in his blood im -- 
  brued; He  tilled op -- pres -- sion's  soil where men For   
  lib -- er -- ty had bled, And the
  ea -- gle wing of Free -- dom waved In
  mock -- ery, o'er his head.
}

treble =  \relative c' {
  \clef treble
  \time 4/4
  \key bf \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \stemUp

  \partial 4 <d bf'>8[ <ef c'>] |
      <f d'>4. <ef c'>8 <d bf'>4 <d a'>8( <d bf'>8) |
      << { c'8[ bf] a[ g] } \new Voice = "alto" { \voiceTwo ef4 ef } >> <d f>4. <d f>8 | 

  \break
  <d f>4 <f bf> <f bf> <a c>8[ <bf d>8] |
      <a c>2 r4 <d, bf'>8[ <ef c'>] |
      <f d'>4. <ef c'>8 <d bf'>4 <c a'>8[ <d bf'>8] |

  \break
  << { c'8[ bf] a[ g] } \new Voice = "altoB" { \voiceTwo ef4 ef } >> <d f>4. <d f>8 |
      <ef g>4 <d bf'> <c a'>8[ <d bf'>] <ef c'>[ <f d'>] |

  \break
  <d bf'>2 r4 <f f'>8.( <f f'>16) |
      <d f'>4. <f d'>8 <f d'>4. <d bf'>16( <d bf'>16) |
      <ef c'>8 <d bf'> <ef g>4. r8 <f d'>4 |
  
  \break
  <g ef'>4. <f d'>8 <ef c'>4 <d bf'>4 |
    <f a>8( f4.) r4 <d f>8 <d f>8 |
  
  \break  
  <ef g>4 <g bf>4 <ef c'>8[ <d bf'>8] <c a'>8[ <bf g'>8] |
      <d f>4 <f bf>4 <f d'>4^\fermata <d bf'>8[ <c a'>8] |
  
  \break    
  <ef g>8( <d bf'>4) <d bf'>8 <c a'>8[ <d bf'>8] <ef c'>8[ <f d'>8] |
      < d bf'>2.^\fermata \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 4/4
  \key bf \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 bf4 |
      bf4. bf8 bf4 \stemUp d8( d) |
      \stemNeutral ef4 ef bf4. bf8 |

  \break
  bf4 bf bf f' |
      f2 r4 bf, |
      bf4. bf8 bf4 d |

  \break
  ef4 ef bf4. bf8 |
      ef4 ef f f |

  \break
  bf,2 r4 \slurDown bf'8.( bf16) |
      bf4. bf8 bf4. g16( g16) |
      ef8 ef ef4. r8 bf4 |
  
  \break
  ef4. ef8 ef4 ef4 |
      f8( f4.) r4 bf,8 bf8 |

  \break    
  ef4 ef4 ef4 ef4 |
      bf4 bf4 bf4^\fermata \stemUp d4 |

  \break    
  \stemNeutral ef8( ef4) ef8 f4 f4 |
     <f bf,>2.^\fermata \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
   }

