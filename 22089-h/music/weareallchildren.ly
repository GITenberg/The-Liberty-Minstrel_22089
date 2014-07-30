\version "2.10"
\include "english.ly"

\header {
  title =    "WE ARE ALL CHILDREN OF ONE PARENT."
  poet =     "Words from the Youth's Cabinet."
  composer = "Music by L. Mason."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  Sis -- ter, thou art worn and wear -- y, Toil -- ing for an -- oth -- er's gain;
  Life with thee is dark and drear -- y, Filled with wretch -- ed -- ness and pain,
}

versetwo = \lyricmode {
  Thou must rise at dawn of light, \skip 4 And thy dai -- ly task pur -- sue,
  Till the dark -- ness of the night \skip 4 Hide thy la -- bors from thy view.
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key c \major
  \autoBeamOff
  \stemUp

  <c e>4 <c e> |
  <e g> <c e> |
  <d f> <f a> |
  <f a> <e g> |
  <e c'> <c e> |
  <c e> <b d>8[ <c e>] |
  <d f>4 <c e> |
  <b d>2^\fermata

  \break
  <e g>4 <e g> |
  <g e'> <e c'> |
  <f a> <a c> |
  <f a> <e g> |
  <e g> <g e'> |
  <f d'> <e c'> |
  <f a> <b, g'> |
  <c e>2^\fermata \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 2/4
  \key c \major
  \autoBeamOff

  c4 c |
  c c |
  c c |
  c c |
  c e |
  g g |
  g g |
  g2^\fermata |

  \break
  c,4 c |
  c c |
  f f |
  c c |
  c c |
  g' a |
  f g |
  c,2_\fermata
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \verseone }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \versetwo }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    	   
}
