\version "2.10"
\include "english.ly"

\header {
  title =    "LIBERTY BATTLE-SONG."
  poet =     "From \"The Emancipator.\""
  composer = "Air--\"Our Warrior's Heart.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  A -- rouse, ye friends of law and right,
  A -- rouse, a -- rouse, a -- rouse!
}

lineTwo = \lyricmode {
  All who in Free -- dom's cause de -- light,
  A -- rouse, a -- rouse, a -- \markup{ "rouse!" \hspace #1.0 \raise #3 \rightbrace }
  The time, the time, is draw -- ing near,
  When we must at our posts ap -- pear;
}

lineThree = \lyricmode {
  Then clear the decks for ac -- tion, clear!
  A -- rouse, a -- rouse, a -- rouse!
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key c \major
  \autoBeamOff
  \stemUp

  \tag #'main { \repeat volta 2 {
    \partial 8*1 <e c'>8 |
    <e c'>8 <e g> <e g> <e c'> |
    <a c> <f a> <f a> r16 <a f'> |

    \break
    <g e'>8. <e c'>16 <f d'>8. <d b'>16 |
    \partial 8*3 <e c'>4. |
  } }
  \tag #'toDC {
    \partial 8*1 <e c'>8 |
  <d b'>8 <e c'> <g d'>8. <d b'>16 |

  \break
  <e c'>8 <f d'> <g e'>8. <e c'>16 |
  <d b'>8 <e c'> <f d'> <d b'> |
  \partial 8*3 <e c'>8 <f d'> <g e'>_\fermata^\markup { \bold "D.C." } \bar "|."
  }
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key c \major
  \autoBeamOff

  \tag #'main { \repeat volta 2 {
    \partial 8*1 c8 |
    c8 c c c |
    f f f r16 f16 |

    \break
    g8. g16 g8. g16
    \partial 8*3 c,4.
  } }
  \tag #'toDC {
  \partial 8*1 c8 |
  <g g'>8 <g g'> <g g'>8. <g g'>16 |

  \break
  c8 c c8. c16 |
  <g g'>8 <g g'> <g g'> <g g'>
  \partial 8*3 c8 c c^\fermata |
  }
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
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble  \keepWithTag #'main \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass \keepWithTag #'main \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
}

%%Transcriber's Notes:

%%A second score is provided to unfold the repeats and generate the midi.