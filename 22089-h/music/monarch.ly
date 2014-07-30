\version "2.10"
\include "english.ly"

\header {
title = "I AM MONARCH OF NOUGHT I SURVEY."
poet = "A Parody."
composer = "Air \"Old Dr. Fleury.\""
tagline = ""
}

trebleOne =  \relative c' {
		\clef treble 
		\key g \major 
		\time 6/8
		\autoBeamOff
  \partial 4 g'8[ g] | \stemUp b g b \stemDown d b d | b4. b | d8 c b b \stemNeutral a g | \break
  d'4. d4 ~ d8 | \stemUp b8 g b \stemDown d b d | b4. b | \break
  d8 b d c b c | b4. b | \stemUp b8 g b b g b | \break
  \stemNeutral c4. e4 ~ e8 | d8 c b b a g | d'4. a4 ~ a8 | \break
  b8 d d d b d | b4. e | d8 a d c b c | b2.^\fermata \bar "|."
}

trebleTwo =  \relative c' {
		\clef treble 
		\key g \major 
		\time 6/8
		\autoBeamOff
  \partial 4 d8[ d] | g8 d g \stemUp b g \stemDown b | d4. d | \stemUp b8 a b \stemNeutral d c b | 
  a4. d,4 ~ d8 | g8 d g \stemUp b g b | \stemNeutral d4. d | 
  b8 d b a g a | g4. d' | d8 b d d b d | 
  e4. c4 ~ c8 | b8 c d d c b | a4. d,4 ~ d8 |
  g8 d g \stemUp b g \stemNeutral b | d4. c | b8 d b a g a | g2.^\fermata \bar "|."
}

bass =  \relative c {
		\clef bass 
		\key g \major 
		\time 6/8
		\autoBeamOff
  \partial 4 g'8[ g] | g g g g g g | g4. g | d8 d d d d d |
  d4. d4 ~ d8 | g8 g g g g g | g4. g |
  g8 g g d d d | g4. g | g8 g g g g g |
  c,4. c4 ~ c8 | g'8 g g d d d | \stemUp d4. d4 ~ d8 |
  \stemNeutral g8 g g g g g | g4. c, | d8 d d d d d | g2. \bar "|."
}

words = \lyricmode {
  "I   am" mon -- arch of nought I sur -- vey,
  My wrongs there are none to dis -- pute;
  My mas -- ter con -- veys me a -- way,
  His whims or ca -- pri -- ces to suit.
  O sla -- ver -- y, where are the
  charms that "\"pa" -- "triarchs\"" have seen in thy face;
  I dwell in the midst of a -- larms,
  And serve in a hor -- ri -- ble place.
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleTwo" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}
