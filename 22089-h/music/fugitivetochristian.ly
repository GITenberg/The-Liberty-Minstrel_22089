\version "2.10"
\include "english.ly"

\header {
  title = "THE FUGITIVE SLAVE TO THE CHRISTIAN."
  poet = "Words by Elizur Wright, jr."
  composer = "Music arranged from Cracovienne."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  The fet -- ters galled my wea -- ry "soul,--"  A
  soul that _ seemed but thrown a -- way; I spurned the ty -- rant's
  base con -- trol, Re -- solved at _ last the
  man to "play :--"  The hounds are bay -- ing
  on my track; O Christ -- ian! _ will you
  send me back? The hounds are bay -- ing on my track; O
  Christ -- ian _ will you send me back?
}
  
treble = \relative c' {
	\time 4/4 
	\key f \major 
	\override Staff.TimeSignature #'style = #'()
	\stemUp

  \partial 4 f4 | 
      < c e >4 < g' e >4 < bf g >4 < d bf >4 | 
      < a c >4 < a f >4 < f a >4 r8 < a c >8 | 
 
  \break    
  < c a >4 < bf d >8[ < a c >8] < g bf >4 < e g >4 | 
      < f a >4 < c' a >4 < a c >4.^\fermata f8 | 
      < c e >4 < e g >4 < g bf >4 < bf d >4 | 
    
  \break    
  < a c >4 < f a >4 < f a >4 r8 < a c >8 | 
      < a c >4 < bf d >8[ < a c >8] < g bf >4 < e g >4 | 
  
  \break    
  < g e >4 f4 f4.^\fermata f8^\markup { \bold "Chorus." } | 
      < g bf >4 < bf d >4 < d f >4 < bf d >4 |
     
  \break    
  < a c >4 < f a >4 < f a >4 r8 < a c >8 | 
      < a c >4 < bf d >8[ < a c >8] < g bf >4 < e g >4 | 
      
  \break    
  < f a >4 < a c >4 < a c >4.^\fermata f8 | 
      < g bf >4 < bf d >4 < d f >4 < bf d >4 |
      < a c >4 < f a >4 < f a >4 r8 < a c >8 | 
      
  \break    
  < a c >4 < bf d >8[ < a c >8] < g bf >4 < g e >4 |
      < e g >4 < c f >4 < c f >4^\fermata \bar "|." 
}

bass = \relative c  {
                \clef bass
	\time 4/4      
	\key f \major 
	\override Staff.TimeSignature #'style = #'()
	
  f4 | 
      c4 c4 c4 c4 | 
      f4 f4 f4 r8 f8 | 
      
  f4 f4 c4 c4 | 
      f4 f4 f4.^\fermata d8 | 
      c4 c4 c4 c4 | 
 
  f4 f4 f4 r8 f8 | 
      f4 f4 c4 c4 | 
      
  c4 f4 f4.^\fermata f8 | 
      bf,4 bf4 bf4 bf4 |
      
  f'4 f4 f4 r8 f8 | 
      f4 f4 c4 c4 | 
      
  f4 f4 f4.\fermata f8 | 
      bf,4 bf4 bf4 bf4 | 
      f'4 f4 f4 r8 f8 | 
      
  f4 bf,4 c4 c4 | 
      c4 f4 f4^\fermata \bar "|."     
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }
   
   
%%Transcriber's Notes:

%%2nd system, 3rd measure lyrics: corrected "tyrants" to "tyrant's."

%%6th system, 1st measure, bass, 3rd note: added fermata to match treble.
