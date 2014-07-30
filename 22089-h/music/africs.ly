\version "2.10"
\include "english.ly"

\header {
  title = "THE AFRIC'S DREAM."
  poet = "Words by Miss Chandler."
  composer = "\"Emigrant's Lament,\" arranged by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {

  Why did ye wake me from my sleep? It was a
  dream  of bliss, And  ye have torn me from  that land, to
  pine a -- gain  in this; Me -- thought, be -- neath yon whis -- pering tree, That
  I was laid  to  rest, The turf, with all its
  
    with -- 'ring flowers, up -- on  my cold  heart pressed.
}

treble =  \relative c' {
  \clef treble
  \key c \major
  \time 4/4
  \autoBeamOff
  \stemUp
  \override Staff.TimeSignature #'style = #'()


  \partial 4 <e g>4 |
      <e g>8 <e g> <f a> <e g> <e c'>( <c e>4) <d fs>8 |
      <e g>4 r8 <e g> <f a>4 <a c> |

  \break    
  <f d'>8[ <e c'>] <f a>4 <e g>\fermata <c e>8[ <d f>] |
      <e g>4 <g e'> <e c'>4. <e c'>8 |
      <f d'>[ <e c'>] <f a>4 <e g>4. <e g>8 |
  
  \break    
  <f a>4 <a c> <f d'>8.[ <e c'>16] <d b'>4 |
      <e c'>2 r4 <e g c> |
      <d g b> <f b d> <f b d>4. <f b d>8 |
      <a c>4 <g c e> <e g>4. <e g>8

  \break    
  <f a>4 <a c> <d f>8[ <c e>] <b d>[ <a cs>] |
      <b d>2 r4 <e, g>4 |
      <e g>4. <e g>8 <f a>4 <e g>
  
  \break    
  <e c'>8( <c e>4) <d fs>8 <e g>4. <e g>8 |
  <f a>8.[ <g b>16] <a c>4 <f d'>8.[ <e c'>16] <d b'>4 |
  <e c'>2. \bar "|."
}

bass =  \relative c {
  \clef bass
  \key c \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 c4 |
      c8 c c c c4. c8 |
      c4 r8 c8 f4 f |

  f4 f c\fermata c |
      c c c4. c8 |
      f4 f c4. c8 |

  f4 f g g |
      c,2 r4 g' |
      g g g4. g8 |
      c,4 c c4. c8 |

  f4 f f fs |
      g2 r4 c,4 |
      c4. c8 c4 c
  
  c4. b8 c4. c8 |
      f4 f g g |
      c,2. \bar "|."
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

