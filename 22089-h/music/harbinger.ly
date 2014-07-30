\version "2.10"
\include "english.ly"

\header {
  title = "HARBINGER OF LIBERTY."
  poet = "Words by a Lady."
  composer = "Music from by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }


verseOne = \lyricmode {
  See yon glo -- rious star as -- cend -- ing, Bright -- ly
  o'er the South -- ern sea!
}

verseTwo = \lyricmode {
  Truth and peace on earth por -- tend -- ing, Her -- ald
  of a ju -- bi -- \markup{ "lee!" \hspace #2.0 \raise #3 \rightbrace } Hail it, Free -- men! Hail it,
  Free -- men! 'Tis the star of Lib -- er -- ty.
}

trebleOne =  \relative c' {
  \key d \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \repeat volta 2 { 
     \partial 4 d'8 d |
     d4 d d8 d |
     d4 d d8 d |

    \break
    d4 \stemUp b \stemNeutral a8 a |
    a2^\fermata
  } 
  e'8 d |
  cs4 e fs8 e |

  \break    
  d4 fs d8 d
  d8 cs \stemDown a4 \stemNeutral a |
  a2_\fermata \bar "|."
}

trebleTwo =  \relative c' {
  \key d \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \repeat volta 2 {
    \partial 4 <fs a>8 <fs a> |
    <fs a>4 <g b> <fs a>8 <fs a> |
    <d fs>4 <fs a> <fs a>8 <g b> |

    \break
    <g b>4 \stemUp <b d> <a e'>8 <g cs> |
    <fs d'>2^\fermata \bar ":|"
  }
  <a cs>8 <a d> |
  <a e'>4 <a cs> <a d>8 <a e'> |

  \break
  \stemDown <a fs'>4 \stemUp <a d> <fs a>8 <fs a> |
  <g b>8 <g e'> <fs d'>4 <e cs'> |
  <fs d'>2_\fermata
}

bass =  \relative c {
   \key d \major
   \time 3/4
   \clef bass
   \autoBeamOff

    \repeat volta 2 {
    \partial 4 d8 d |
    d4 g d8 d |
    d4 d fs8 e |

    \break
    g4 g a8 a |
    d,2^\fermata \bar ":|"
  }
  a'8 a |
  a4 a fs8 e |

  \break    
  \stemUp d4 d d8 d |
  \stemNeutral g8 e a4 a, |
  \stemUp d2_\fermata
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleOne" { \verseOne }
     \new Lyrics \lyricsto "trebleOne" { \verseTwo }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \override PaperColumn #'keep-inside-line = ##t }

	  }

}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  
          <<
    \new Voice = "trebleOne" { \unfoldRepeats \trebleOne  }
    \new Voice = "trebleTwo" { \unfoldRepeats \trebleTwo }
           >>
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4 ) }}    

}

%%Transcriber's Notes:

%%Added missing fermatas at 2nd system, trebleTwo part, 2nd bar; and last system, trebleTwo and bass parts, last bar.

%%Last system, trebleTwo part, 2nd bar: corrected second chord from <fs e> to <g e>.