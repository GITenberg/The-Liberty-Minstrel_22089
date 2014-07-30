\version "2.10"
\include "english.ly"

\header {
  title = "AM I NOT A MAN AND BROTHER?"
  poet = "Words by A. C. L."
  composer = "Air--\"Bride's Farewell.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

lineOne = \lyricmode {
  Am I not a man and broth -- er?
  Ought I not, then, to be free?

  Christ our Sa -- viour, Christ our Sa -- viour,
  Died for me as well as thee.
}

lineTwo = \lyricmode {
  Sell me not one to an -- oth -- er,
  Take not thus my lib -- er -- ty.
}

lineFine = \lyricmode {
  Christ our Sa -- viour, Christ our Sa -- viour,
  Died for me as well as thee.
}

treble =  \relative c' {
  \key g \major
  \time 2/4
  \clef treble
  \autoBeamOff
  \stemUp

  \repeat volta 2 { <g' b>4 <fs a> |
      <e g> d |
      <fs a> <e g>8[ <fs a>] |
      <g b> <b d>4 r8 |

  \break    
  <g b>4 <fs a> |
      <e g> d |
      <fs a>( <a c>8) <g b>16[ <fs a>] |
      g4.^\fermata r8^\markup { \bold "Fine." } }

  \break
  \tag #'toDC { <a c>4 <a c> |
      <c e> <a c> |
      <a c> <a c>8[ <b d>16 <c e> ] |
      <c e>8 <b d>4 r8 |

  \break
  <b d>4 <a cs> |
      <a c!> <g b> |
      <fs a> <a cs> |
      <fs a d>4.\fermata r8^\markup { \bold "D.C." } \bar "|." }
}

bass = \relative c {
  \key g \major
  \time 2/4
  \clef bass
  \autoBeamOff
  
  \repeat volta 2 { g'4 d |
      e b |
      d d |
      g8 g4 r8 |

  g4 d |
      e b |
      d4. d8 |
      <g g,>4.^\fermata r8 }

  \tag #'toDC { c,4 c |
      c c |
      c c |
      g'8 g4 r8 |

  d4 a' |
      a g |
      \stemUp d a |
      d4.^\fermata r8 }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble }
         \new Lyrics \lyricsto "treble" { \lineOne }
	 \new Lyrics \lyricsto "treble" { \lineTwo }
         \new Staff = "lower"  \new Voice = "bass" { \bass }
	 \new Lyrics \lyricsto "bass" { \lineFine }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  } 
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
   \new Voice = "treble" { \unfoldRepeats { \treble }  %%% from begining, through repeats, to D.C.
                           \removeWithTag #'toDC \treble  }  %%% D. C. to FINE
 
   \new Staff = "lower" { \unfoldRepeats { \bass }  %%% from begining, through repeats, to D.C.
                          \removeWithTag #'toDC \bass  }  %%% D. C. to FINE		
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)  }}    

}


%%Transcriber's Note:

%% Last system, last bar, top staff: added missing fermata.