\version "2.10"
\include "english.ly"

\header {
  title = "OUR COUNTRYMEN IN CHAINS."
  poet = "Words by Whittier."
  composer = "\"Beatitude,\" by T. Hastings."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

afterGraceFraction = #(cons 3 8)

lineOne = \lyricmode {
  Our fel -- low coun -- try -- men in
  chains, Slaves in a land of light and law!
}

lineTwo = \lyricmode {
  Slaves-- crouch -- ing on the ve -- ry
  plains Where rolled the storm of Free -- dom's war!
  A groan from Eu -- taw's haunt -- ed
  wood-- A wail where Cam -- den's mar -- tyrs fell--
}

lineThree = \lyricmode {
  By eve -- ry shrine of pat -- riot
  blood, From Moult -- rie's wall and Jas -- per's well.
}	

treble =  \relative c' {
 \key d \major
  \time 2/2
  \clef treble
  \override Staff.TimeSignature #'style = #'()
  \autoBeamOff
  \stemUp

  \tag #'main { \repeat volta 2 {  \partial 2 d4.( e8) |
      <d fs>4 <d fs> <d fs> <d fs> |
      << { a'4.( g8) } 
      \new Voice = "alto" { \voiceTwo e2 } >>
      <d fs>2 |
  
  \break    
  <cs e>2 r4 <cs e>4 |
      <d fs>4. <cs g'>8 <d a'>4 <e g> |
      <d fs>2 <cs e> |
      d2.^\fermata } }

  \break
  \tag #'toDC { <d fs>8[ <e g>] |
      <fs a>4 <fs a> <fs a> <fs a> |
      <g b>2 <b d> 4( <g b>) |
  
  \break    
  <fs a>2 r4 <d fs>8[ <e g>] |
      <fs a>4 <fs a> <fs a> <fs a>  |
      <g b>2 <b d>4( <g b>) |
      <fs a>2^\markup{ \bold "D.C." } r4 \bar "|." }
}

bass =  \relative c {
  \key d \major
  \time 2/2
  \clef bass
  \override Staff.TimeSignature #'style = #'()
  \autoBeamOff

  \tag #'main { \repeat volta 2 { \partial 2 \stemUp  d2 |
  d4 d d d |
      cs2 d2 |

  a2 r4 a |
      \stemNeutral d4. e8 fs4 g |
      a2 a, |
      \stemUp d2.^\fermata }}

  \tag #'toDC { \stemNeutral d4 |
      d4 d d d |
      g2  \afterGrace g,2( { b8) }|

  d2 r4 d |
      d4 d d d |
      g2 \afterGrace g,( { b8 ) }
      %<< {g, } { s4( \grace { b8 )} } >>|
      \stemUp d2 r4 \bar "|." }
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \lineThree }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
	  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  
    \new Voice = "treble" { \unfoldRepeats \treble \keepWithTag #'main \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  \keepWithTag #'main \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    

}

%%Transcriber's Note:

%%A separate score is provided to unfold the repeat and generate the midi.
