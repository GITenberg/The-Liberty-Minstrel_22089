\version "2.10"
\include "english.ly"

\header {
  title = "TO THOSE I LOVE."
  poet = "Words by Miss E. M. Chandler."
  composer = "Music from an old air by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyrics {
  Oh, turn ye not dis -- pleased a -- way, though
  I should some -- times seem Too much to press up --
  on your ear, an oft re -- peat -- ed
  theme; The sto -- ry of the ne -- gro's wrongs is
  hea -- vy at my heart, And can I choose but
  wish from you a sym -- pa -- thiz -- ing part?
}

trebleOne = \relative c' {
  \key f \major
  \time 4/4
  \clef treble
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \stemUp
 
  \partial 8 <a' c>8 |
      <a c>4. <f a>8 <a f'>4. <f a>8 |
      <a c>4. <g bf>8 <e g>4. <e g>8 |
  
  \break    
  <f a>4. <f a>8 <a c>[ <g bf>] <f a>[ <e g>] |
      \slurUp f2( e4) r8 <a c> |
      <a c>4. <f a>8 <c' f>4. <f, a>8 |

  \break
  <a c>4. <g bf>8 <e g>4 r8 <e g> |
      <f a>[ <a c>] <g bf>[ <e g>] f4 <f a>8.[ <e g>16] |

  \break
  <e g>2( f4) r8 <f a>8 |
      <e g>4. <e g>8 <g bf>[ <f a>] <e g>[ <f a>] |
      <a c>4. <g bf>8 <e g>4. <e g>8 |
  
  \break
  <f a>4. <f a>8 \slurDown <g b>8( <b f'>4) <g b>8 |
      \slurUp d'4^\fermata( c2) r8 <a c> |
      <a c>4. <f a>8 <c' f>4. <f, a>8 |

  <a c>4. <g bf>8 <e g>4 r8 <e g> |
      <f a>[ <a c>] <g bf>[ <e g>] <e c'>4^\fermata g8[ bf16a] |
      f2 \bar "|."
}

trebleTwo = \relative c' {
  \key f \major
  \time 4/4
  \clef treble
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \stemDown
 
  \partial 8 s8 |
      s1 |
      s1 |
  
  \break    
  s1 |
      f2 e4 s4 |
      s1 |
      
  \break
   s1  |
      s4 s4 f4 s4 |
  
  \break    
  s2 f4 s4 |
      s1 |
      s1 |
    
  \break    
  s1 |
      g2. s4 |
      s1 |
      
  \break    
  s1 |
      s2 s4 e4 |
      f2 \bar "|."
}
  
bass =  \relative c {
  \key f \major
  \time 4/4
  \clef bass
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \override Stem #'neutral-direction = #up

 \partial 8 f8 |
  f4. f8 f4. f8 |
  f4. f8 c4. c8 |

  f4. f8 f4 bf, |
  c2. r8 f |
  f4. f8 f4. f8 |

  c4. c8 c4 r8 c |
  f4 bf, c c |

  c2( f4) r8 f |
  c4. c8 c4 c |
  c4. c8 c4. c8 |
  
  f4. f8 b,4. b8 |
  c2.\fermata r8 f |
  f4. f8 f4. f8 |

  c4. c8 c4 r8 c |
  f4 bf, c\fermata c |
  f2 \bar "|."
  
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
        << 
     \new Voice = "trebleOne" { \trebleOne }
     \new Voice = "trebleTwo" { \trebleTwo }
        >>
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
   }
   
%%Transcriber's Notes:

%%5th system, bass staff, 1st bar: changed B-flat to B-natural to match treble; 2nd bar: added missing fermata.

%%Last system, last bar, bass: changed discordant G to F.
