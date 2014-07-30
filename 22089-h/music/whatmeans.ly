\version "2.10"
\include "english.ly"

\header {
  title = "WHAT MEANS THAT SAD AND DISMAL LOOK?"
  poet = "Words by Geo. Russell."
  composer = "Arranged from \"Near the Lake,\" by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
\set stanza = "1."
  What means that sad and dis -- mal look, And 
  why those fall -- ing tears? No voice is heard, no 
  word is spoke, Yet nought but grief ap -- pears. 
}

trebleOne =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 8 \stemUp bf'8 | \stemNeutral f4 f8 c'4 d8 | ef4 d8 \stemUp bf16( g8.) g8 | \break
  bf4 bf8 bf8.[ a16] g8 | a4. r4 a8 | \stemDown c4 bf8 \stemUp a4 bf8 | \break
  a4 bf8 g4 g8 | \stemDown bf4 bf8 bf4 c8 | d4.^\fermata r4 \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 8 f8 | bf4 bf8 a4 bf8 | c4 bf8 \stemUp g16( bf8.) bf8 | 
  f4 f8 \stemDown d'8.[ c16] bf8 | c4. r4 c8 | ef4 d8 c4 bf8 | 
  c4 bf8 \stemUp g16[ bf8.] bf8 | f4 f8 \stemDown d'4 c8 bf4.^\fermata r4 \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 8*1 bf8 | bf4 bf8 f'4 f8 | f4 f8 ef4 ef8 | \break
  bf4 bf8 bf4 bf8 | f'4. r4 f8 | f4 f8 f4 f8 | \break
  f4 f8 ef4 ef8 | bf4 bf8 f'4 f8 bf,4.^\fermata r4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleTwo" { \verseone }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}
 
