\version "2.10"
\include "english.ly"

\header {
  title = "PRAYER FOR THE SLAVE."
  composer = "Tune--Hamburgh."
  source = "The Liberty Minstrel."
  tagline = ""
}



words = \lyricmode {
  Oh let the pris -- 'ner's mourn -- ful sighs
  As in -- cense in thy sight ap -- pear!
  Their hum -- ble wail -- ings pierce the skies,
  If hap -- ly they may feel thee near.
}

treble = \relative c' {
  \key g \major
  \time 2/2
  \override Staff.TimeSignature #'style = #'()
  \clef treble
  \autoBeamOff
  \stemUp
 
  <d g>2 <d g>4 <fs a> |
       <g b>2 <fs a>4( <g b>) |
       <a c>2 <g b>4( <fs a> ) |
       <g b>2. r4 |
  
  \break     
  <g b>2 <g b>4 <g b> |
      <a c>2  <g b>4( <fs a>) |
      g2 \slurUp fs4( <e g> ) |
      <fs a>1 |

  \break    
  g2 g4 <fs a> |
      <g b>2 \slurDown <fs a>4( <g b> ) |
      <a c>2 <g b>4( <fs a> ) |
      <g b>1 |

  \break    
  <g b>2 <g b>4 <g b> |
      <a c>2  <g b>4( <fs a> ) |
      g2 <fs a>4( <d fs> ) |
      <d g>1 \bar "|."
}

trebleTwo = \relative c' {
  \key g \major
  \time 2/2
  \override Staff.TimeSignature #'style = #'()
  \clef treble
  \autoBeamOff
  \stemDown

  s1 | s1 | s1 | s1 |
  s1 | s1 | g'2 fs4 s4 | s1 |             
  g2 g4 s4 | s1 | s1 | s1 |
  s1 | s1 | g2 s2 | s1 |
}
  
bass =  \relative c {
   \key g \major
   \time 2/2
   \override Staff.TimeSignature #'style = #'()
   \clef bass
   \autoBeamOff
   \stemDown

  g'2 g4 d |
      g2 \slurDown c4( b4) |
      a2 d, |
      <g g,>2. r4 |

  g2 g4 g |
      g2 g4( c) |
      b2 \slurUp a4( g) |
      d1 |

  g2 g4 d |
      g2 \slurDown c4( b4) |
      a2 d, |
      g1 |

  g2 g4 g |
      \stemUp c,2 \stemDown \slurUp e4( d) |
      e2 d |
      <g g,>1 \bar "|."
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
        << 
     \new Voice = "treble" { \treble }
     \new Voice = "trebleTwo" { \trebleTwo }
        >>
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }
