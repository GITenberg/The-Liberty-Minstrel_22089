\version "2.10"
\include "english.ly"

\header {
  title = "THE BEREAVED MOTHER."
  composer = "Air, \"Kathleen O'Moore.\""
  poet = "Words by Jesse Hutchinson."
  source =  "Liberty Minstrel"
  tagline = ""
}

words = \lyricmode {

  Oh deep was the an -- guish of the
  slave mo -- ther's heart, When called from her dar -- ling for
  ev -- er to part; So grieved that lone mo -- ther, that
  heart bro -- ken mo -- ther, In sor -- row and woe.
}

treble =  \relative c' {
  \key a \major
  \time 6/8
  \stemUp
  \autoBeamOff

  \partial 8 <cs e>8 | <cs a'>8. <e b'>16 <cs a'>8 <cs a'> <e gs> <cs a'>16 <e a> | \break
  <gs  b>8. <gs b>16 <gs b>8 <gs b> r8 <cs, a'>16[ <e b'>] | <a cs>8. <gs d'>16 <a cs>8 <a cs> <e b'> <cs a'> \break
  <gs' b> <a cs> <gs b> <gs b>[ a] <gs b> | <e cs'>8. <e d'>16 <a cs>8 <e b'>16 <fs a>8. <gs b>8 | \break
  <a cs> <gs b> <e a> <d b'> <cs a'> <d fs> | <cs e >4( <e cs'>8) <gs b>4 <a cs>16[ <gs b>] | a4. ~ a4  \bar "|." 
}

bass =  \relative c {
  \key a \major
  \time 6/8
  \clef bass
  \autoBeamOff

  \partial 8 a8 | cs8. \stemUp d16 d8 \stemNeutral e e a16 a |
  e8. e16 e8 e r8 e16[ e] | e8. e16 e8 a gs a |
  e e e e4 e8 | a8. a16 a8 e16 fs8. e8 |
  a,8 b cs e e b | e4(  e8) e4 e8 | a,4. ~ a4 \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 8 ) }}    
   }

