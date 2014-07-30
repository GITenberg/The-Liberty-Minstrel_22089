\version "2.10"
\include "english.ly"

\header {
  title = "YE SPIRITS OF THE FREE."
  composer = "Air--\"My faith looks up to thee.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  \set stanza = "1. " Ye spir -- its of the free, Can ye for
  ev -- er see Your broth -- er man A yoked and
  scour -- ged slave, Chains drag -- ging to his grave,
  And raise no hand to save? Say if you can.
}

verseTwo = \lyricmode {
  \set stanza = "2. " In pride and pomp to roll, Shall ty -- rants
  from the soul God's im -- age tear, And call the
  wreck their own,-- While from th'e -- ter -- nal throne,
  They shut the sti -- fled \once \override LyricSpace #'minimum-distance = #3 groan, And bit -- ter prayer?
}

treble =  \relative c' {
  \key g \major
  \time 2/2
  \clef treble
  \autoBeamOff
  \stemUp  
  \override Staff.TimeSignature #'style = #'()

  g'2 <g b>4 <a d>4 |
      <b d>4. <a c>8 <g b>2 |
      d2 <fs a>4 <a c>4 |

  \break    
  <a c>4. <g b>8 <fs a>2 |
      <g b>2 <fs a>4 <g e'>4 |
      <fs d'>1 |
      <b d>2 <g b>4 <a c>4 |

  \break    
  <b d>4. <c e>8 <b d>2 |
      <b d>2 <g b>4 <a c>4 |
      <b d>4. <c e>8 <b d>2 |

  \break
  <e g>2 <d fs>4 <c e>4 |
  <b d>4. <a c>8 <g b>4 << { g4 } \new Voice = "alto" { \voiceTwo g4 } >> |
      <e a>2 <fs d'>2 |
      << { g2. } \new Voice = "alto" { \voiceTwo g2. } >> \bar "|."
}

bass =  \relative c {
  \key g \major
  \time 2/2
  \clef bass
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  g'2 g4 d4 |
      g4. g8 g2 |
      d2 d4 d4 |

  d4. d8 d2 |
      g2 a4 a,4 |
      d1 |
      R1 |

  R1 |
      R1 |
      R1 |

  g2 g4 g4 |
  g4. g8 g4 b,4 |
  c2 \stemUp d2 |
  \stemNeutral g2. \bar "|."
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \verseOne }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \verseTwo }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

