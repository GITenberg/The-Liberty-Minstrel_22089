\version "2.10"
\include "english.ly"

\header {
  title = "HEARD YE THAT CRY."
  composer = "From \"Wind of the Winter night.\""
  source = "The Liberty Minstrel."
  tagline = ""
}


leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

verseone = \lyricmode {
  Heard ye that cry! Twas the
  wail of a 
  slave, 
}

versetwo = \lyricmode {
  \set ignoreMelismata = ##t As he sank in des -- pair, to the
  \unset ignoreMelismata
  rest of the \markup{ "grave;" \hspace #2.0  \raise #3 \rightbrace } Be --
  hold him where
  bleed -- ing and pros -- trate he lies, Un --
  friend -- ed he lived, and un -- pit -- ied he died.
}

treble = \relative c' {
  \key g \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \repeat volta 2 { \partial 4 <d g>8( <d a'>8) |
      <d b'>2 <d a'>8( <d g>8) |
      <c e>2 <d fs>8 <d g>8 |

  \break    
  <d a'>2 <d g>8 <d a'>8 |
      <d g b>2 }  \stemUp <g b>8( <a c>8) |
      <b d>2 <a c>8 <g b>8 |

  \break    
  <fs a>2 <fs a>8 <g b>8 |
      <a c>2 <g b>8 <fs a>8 |
      <g b>2^\fermata <g b>8( <a c>8) |

  \break    
  <b d>2 <a c>8 <g b>8 |
      <c e>2 <b d>8 <a c>8 |
      <g b>2 <a c>8 <fs a>8 |
      <b, g'>2 \bar "|."
}


bass = \relative c {
  \key g \major
  \time 3/4
  \clef bass
  \autoBeamOff
  
  \repeat volta 2 { \partial 4 g'8( d8) |
      g2 fs8( g8) |
      c,2 \stemUp d8 d8 |

  \stemNeutral d2 d8 d8 |
      g2 } g8( d8) |
      g2 fs8 g8 |

  d2 d8 d8 |
      d2 d8 d8 |
      g2\fermata g8( g8) |

  g2 fs8 g8 |
      c,2 g'8 fs8 |
      g2 d8 d8 |
      \stemDown <g g,>2 \bar "|."
}



\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \verseone }
     \new Lyrics \lyricsto "treble" { \versetwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
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
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble  }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    

}


%%Transcriber's Note:

%%A separate score is provided to unfold the repeats and generate the midi.
