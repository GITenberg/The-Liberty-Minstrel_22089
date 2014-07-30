\version "2.10"
\include "english.ly"

\header {
  title = "THE BEREAVED FATHER."
  poet = "Words by Miss Chandler."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
}


words = \lyricmode {

  Ye've gone from me, my gen -- tle
  ones! With all your shouts of mirth; A si -- lence
  is with -- in my  walls, A dark -- ness round my
  hearth, A dark -- ness round my hearth.
}

trebleOne =  \relative c'' {
  \clef treble
  \key d \minor
  \time 3/4
  \autoBeamOff

  \partial 4. a8 a8. a16 | a4. a8 bf a | \break
  c4. a8 a a | a2 a4 | a4.\fermata a8 a a | \break
  g4. g8 a g | c4. f,8 f f | a2 g4 | \break
  f4.. a16 a8 a | a2 g4 | <f a>2 \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \key d \minor
  \time 3/4
  \autoBeamOff

  \partial 4. a'8 a8. a16 | c4. c8 d c |
  a4. d8 d e | d2 cs4 | d4.\fermata d8 f f |
  c4. c8 d c | a4. a8 a a | c2 bf4 |
  a4.. d16 d8 e | d2 cs4 | d2 \bar "|."
}

bass =  \relative c {
  \clef bass
  \key d \minor
  \time 3/4
  \autoBeamOff

  \partial 4. f8 f8. f16 | f4. f8 f f |
  f4. d8 d d | d2 a'4 | d,4.\fermata d8 d d |
  c4. c8 a c | f4. d8 d d | f2 e4 |
  d4.. d16 d8 d | a2 a4 | d2 \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 4 ) }}   

}
 

