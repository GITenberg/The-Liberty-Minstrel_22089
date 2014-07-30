\version "2.10"
\include "english.ly"

\header {
  title = "THE LAW OF LOVE."
  poet = "Words by a Lady."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  Blest is the  man whose  ten -- der  heart Feels 
  all a -- noth -- er's   pain, To  whom the 
  sup -- pli -- cat -- ing  eye Was  nev -- er 
  raised in vain, Was ne -- ver raised in vain.
}

verseTwo = \lyricmode {
  Whose breast ex -- pands with  gen -- erous  warmth, A 
  stran -- ger's  woe to  feel, And  bleeds in 
  pi -- ty  o'er the  wound, He  wants the 
  power to heal, He wants the power to heal.
}

soprano =  \relative c' {
  \clef treble
  \time 3/4
  \key a \major
  \autoBeamOff
  \override Stem #'neutral-direction = #up

  \partial 4 a'4 |
      a4.( b8) gs4 |
      a2 a4 |
      gs( b) b |
      cs2^\fermata cs4 |

  \break
  b4( gs) a |
      gs2 a4 |
      \stemDown b2^\fermata \stemNeutral cs4 |
      d( cs) b |

  \break
  a2 a4 |
      b( a) b |
      \stemNeutral cs2^\fermata gs4 |
      gs2 a4 |
    
  \break    
   d4( cs) b |
      a2 cs8.[ b16] |
      a4( b) cs |
      a2 gs4 |
      a2. \bar "|."    
}

alto =  \relative c' {
  \clef treble
  \time 3/4
  \key a \major
  \autoBeamOff

  \partial 4 <e a>4 |
      << { \slurDown cs'4.( d8) } \\ { e,2 } >> <e b'>4 |
      <e a>2 <e cs'>4 |
      << { \slurDown b'4( d) } \\{ e,2 } >> <e gs>4 |
      <e a>2^\fermata <e a>4 |

  \break
  << { \slurDown gs4( b4) } \\{ e,2 } >> <e cs'>4 |
      <e b'>2 <e a>4 |
      <e gs>2^\fermata a4 |
      \stemUp \slurDown b( a) b |

  \break
  \stemNeutral cs2 cs4 |
      \slurUp d( cs) d |
      e2^\fermata <e, b'>4 |
      << { \slurDown b'4( e) } \\{ e,2 } >> <e cs'>4 |

  \break      
  << { b'4( a) } \\{ e2 } >> <e b'>4 |
      <e cs'>2 << { e'8. d16 } \\{ e,4 } >> |
      \stemUp \slurDown <e cs'>4( <fs d'>) <a e'> |
      <e cs'>2 <d b'>4 |
      <cs a'>2. \bar "|."   
}

bass =  \relative c {
  \clef bass
  \time 3/4
  \key a \major
  \autoBeamOff	
  \override Stem #'neutral-direction = #up
	
 \partial 4 a'4 |
      a2 e4 |
      fs2 fs4 |
      e2 e4 |
      a,2^\fermata cs4 |

  \break
  e2 e4 |
      e2 e4 |
      e2^\fermata
  %% SMALL NOTES START
      \set fontSize = #-3
      e4 |
      e2 e4 |

  \break
  e2 e4 |
      e2 e4 |
      e2^\fermata
  \unset fontSize
  %% SMALL NOTES END
      e4 |
      e2 e4 |

  \break      
  e2 e4 |
      a2 e4 |
      cs( d) e |
      e2 \stemDown d4 |
      \stemNeutral a2. \bar "|."   
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Lyrics \lyricsto "soprano" { \verseOne }
     \new Staff = "upperTwo" \new Voice = "alto" { \alto }
     \new Lyrics \lyricsto "soprano" { \verseTwo }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}   

}

%%Transcriber's Notes:

%%Last system, bass staff, 3d bar: last note corrected to E; 4th bar: second note corrected to D.

%%Last system, alto staff, last bar: bottom note of chord corrected to C-sharp.