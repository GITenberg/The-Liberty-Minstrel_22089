\version "2.10"

\header {
  title = "THE QUADROON MAIDEN."
  composer = "Theme from the Indian Maid."
  poet = "Words by Longfellow."
  source =  "The Liberty Minstrel"
}

trebleOne =  \relative c' {
  \key g \major
  \time 2/4
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 \stemUp b'4 | a8 \stemUp b \stemNeutral b c | c d d4 | b d8 d | \break
  c b b4 | r4 g | a8 \stemUp b \stemNeutral b c | c d d4 | \break
  \afterGrace b4( { \stemDown b8) } c d | d b b4 ~ | b4 \bar "||" 
      \set Score.measurePosition = #(ly:make-moment 1 4) r8 g8 | \break
  a8. a16 b8 c | \stemUp b g e4 | a b8 \stemNeutral c |  \break
  c8 b b4 ~ | b g8 ~ g | a \stemUp b \stemDown b c | \break
  c8 d d4 | b d8 d | c b b4 \bar "|."
}

trebleTwo =  \relative c' {
  \key g \major
  \time 2/4
  \autoBeamOff

  \partial 4 g'4 | d8 g g a | a \stemUp b b4 | \stemDown d \stemUp a8 b | 
  a g g4 | r4 d | d8 g g a | a b b4 |
  \stemDown \afterGrace d4( { \stemDown d8) } \stemUp a b | a g g4 ~ | g4 
      \set Score.measurePosition = #(ly:make-moment 1 4) r8 \stemNeutral b8 |
  c8. c16 d8 e |  d b g4 | c d8 e |
  e8 d d4 ~ | d d,8 ~ d | d g g a |
  a8 \stemUp b b4 | \stemDown d \stemUp a8 b | a g g4 
}

bass =  \relative c {
  \key g \major
  \time 2/4
  \clef bass
  \autoBeamOff

  \partial 4 g'4 | d8 e e d | d g g4 | g d8 d |
  d g g4 | r4 g | d8 e e d | d g g4 |
  \afterGrace g4( { \stemDown g8) } d d | d g g4 ~ | g 
      \set Score.measurePosition = #(ly:make-moment 1 4) r8 e8 |
  c8. c16 b8 c | d g g4 | c, b8 c8 |
  c8 g' g4 ~ | g g8 ~ g | d e e d |
  d8 g g4 | g d8 d | d \stemDown <g, g'> <g g'>4 
}

words = \lyricmode {
  The Sla -- ver in the broad la -- goon, Lay moored with
  i -- dle sail; He wait -- ed for the ris -- ing moon,
  And for the eve -- ning gale. The
  Plan -- ter un -- der his roof of thatch, Smoked thoughtful -- 
  ly and slow; The Slav -- er's thumb was 
  on the latch, He seemed in haste to go. 
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleTwo" { \words }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4 ) }}   

}
 
%%Transcriber's Note:

%% Bass part, last measure of song: corrected typo in 2nd chord -- quarter notes should be eighth notes, to match the treble.
