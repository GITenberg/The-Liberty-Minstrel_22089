\version "2.10"
\include "english.ly"

\header {
  title = "THE BALLOT-BOX."
  composer = "Air--from \"Lincoln.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  Free -- dom's con -- se -- cra -- ted \set ignoreMelismata = ##t dow -- \unset ignoreMelismata er, Cas -- ket
  of a price -- less gem! No -- bler her -- it -- age of \set ignoreMelismata = ##t pow -- \unset ignoreMelismata er,
  Than im -- pe -- rial di -- a -- dem! Cor -- ner -- stone, on which was
  reared, Lib -- er -- ty's tri -- um -- phal dome, When her
  glor -- i -- ous form \set ignoreMelismata = ##t ap -- \unset ignoreMelismata peared, 'Midst our own Green Moun -- tain home.
}

versetwo = \lyricmode {
  Guard it, Free -- men! guard it well, Spot -- less
  as your maid -- en's fame! Nev -- er let your chil -- dren tell
  Of your weak -- ness, of your shame; That their fa -- thers base -- ly
  sold, What was bought with blood and toil, That you
  bar -- tered right for gold, Here, on Free -- dom's sa -- cred soil.
}

treble = \relative c' {
  \clef treble
  \key ef \major
  \time 2/4
  \autoBeamOff
  \stemUp
  
  <ef g>4. <ef g>8 |
  <ef g>8 <ef g>8 <ef g>8 <ef g>8 |
  <g bf>4( <f af>8) r8 |
  <d f>4. <d f>8 |

  \break
  <d f>8 <d f>8 <d f>8 <d f>8 |
  <ef g>2 |
  <ef g>4. <ef g>8 |
  <ef g>8 <ef g>8 <ef g>8 <ef g>8 |
  <g bf>4( <f af>8) r8 |

  \break
  <d f>4. <d f>8 |
  <d f>8 <d f>8 <d f>8 <d f>8 |
  ef2 |
  <bf' ef>4. <bf ef>8 |
  <bf ef>8 <bf ef>8 <bf ef>8 <bf ef>8 |

  \break
  \grace ef4( <bf d>2) |
  <f c'>4. <f c'>8 |
  <f c'>8 <f c'>8 <f c'>8 <af c>8 |
  <g bf>2 |
  ef4. <d f>8 |

  \break
  <ef g>8 <f af>8 <g bf>8 <af c>8 |
  \voiceOne << { d4( ef8) } \context Voice="1" { \voiceTwo bf4. \oneVoice } >> \oneVoice r8|
  \stemUp <f f'>4. <f f'>8 |
  <ef bf'>4 <af ef'>4 |
  <g ef'>4 <f d'>4 |
  <g ef'>2 \bar "|."
}

bass =  \relative c {
  \clef bass
  \key ef \major
  \time 2/4
  \autoBeamOff

  ef4. ef8 |
  ef8 ef8 ef8 ef8 |
  bf4. r8 |
  bf4. bf8 |

  \break
  bf8 bf8 bf8 bf8 |
  ef2 |
  ef4. ef8 |
  ef8 ef8 ef8 ef8 |
  bf4. r8 |

  \break
  bf4. bf8 |
  bf8 bf8 bf8 bf8 |
  ef2 |
  ef4. ef8 |
  ef8 ef8 ef8 ef8 |

  \break
  g2 |
  af4. af8 |
  af8 af8 af8 af8 |
  ef2 |
  ef4. bf8 |

  \break
  ef8 ef8 ef8 ef8 |
  bf4( ef8) r8 |
  af4. af8 |
  g4 c4 |
  bf4 bf,4 |
  ef2 |
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
