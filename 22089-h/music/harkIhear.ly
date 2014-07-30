\version "2.10"
\include "english.ly"

\header {
 title = "HARK! I HEAR A SOUND OF ANGUISH."
 poet = ""
 composer = "Air, \"Calvary.\" "
 source = "The Liberty Minstrel."
 tagline = ""
}


treble = \relative c' {
	\clef treble
	\key c \major
	\override Staff.TimeSignature #'style = #'()
	\time 2/2
	\stemUp
	
  <g' c >2. <b d >4 | 
      <c e >2. <b d >4 | 
      <a c > ( <g b > ) <f a > ( <e g > ) | 
      <e g> ( <g c > )  <g c >2 | 
  
  \break    
  <b d >  \slurDown <b e >4( << { \stemDown c8[) d8]  } \new Voice = "alt" { \voiceTwo \stemUp fs } >> | 
      \stemUp <e g >2 <c e >4( <a c > ) | 
      <g b >2 <fs a >  | 
      g1 | 
      <b d >2. <b d >4 | 
      
  \break    
  <g c > ( <g b > ) a ( g ) | 
      c2 <b d >  | 
      <c e >  <c e >  | 
      <c e >2. <g e' >4 | 
      <g d' > ( <a c > ) <g b > ( <f a > ) | 
      
   \break   
   g2 fs  | 
       g1 | 
       <a c >2. <a c >4 | 
       <a c > (  <g b > )  <g b >2^\fermata | 
       <f a >2.  <f a >4 |
    
   \break    
   <f a>4( <e g>) <e g>2^\fermata |
       <a e'>2. <a e'>4 |
       <c f>2. <c f>4 |
       <c e>2 <b d>2 |
       <g c>1  \bar "|."   
}

bass = \relative c {
	\clef bass
	\key c \major
	\override Staff.TimeSignature #'style = #'()
	\time 2/2

  c2. g'4 | 
      c2. g4 | 
      c,2 c  | 
      c  c  | 
      
  g' g4( fs )  | 
      e2 c  | 
      \stemUp d  d  | 
      \stemNeutral g1 | 
      g2. g4 | 
      
  c,2 c  | 
      e  g  | 
      c  c,  | 
      \stemDown c4( e  g)  c  | 
      \slurDown b(  a) \slurUp g( \stemUp c,)  | 
      
  d2 d  |
      g,1 |
      a2. a4 | 
      \stemNeutral e'2 e^\fermata  | 
      f2.  f4 
      
  c2 c^\fermata |
      c'2. bf4 |
      a2. f4 |
      g2 g, |
      c1 |    
}

words = \lyricmode {
  Hark! I hear a sound of an -- guish
  In my _ own, my na -- tive land; Breth -- ren,
  doomed in chains to lan -- guish, Lift to heaven the 
  sup -- pliant hand, And de -- spair -- ing, And de --	
  spair -- ing, Death the end of woe de -- mand.
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
