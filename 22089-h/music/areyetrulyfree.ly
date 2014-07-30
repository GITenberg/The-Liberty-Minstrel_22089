\version "2.10"
\include "english.ly"

\header {
  title =    "ARE YE TRULY FREE?"
  poet =     "Words by J.R. Lowell."
  composer = "Air, \"Martyn.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Men! whose boast it is that ye
  Come of fa -- thers brave and free;
}

lineTwo = \lyricmode {
  If there breathe on earth a slave,
  Are ye tru -- ly free and \markup{ "brave?" \hspace #1.0 \raise #3 \rightbrace }
  If ye do not feel the chain,
  When it works a broth -- er's pain.
}

lineThree = \lyricmode {
  Are ye not base slaves in -- deed,
  Men un -- wor -- thy to be freed?
}

treble = \relative c' {
  \clef treble
  \time 6/4
  \key f \major
  \autoBeamOff
  \stemUp

  \tag #'main { \repeat volta 2 {
    <f a>2 <f a>4 <f a>2 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> \oneVoice |
    <e g>2 <e g>4 <e g>2 r4 |
    <f a>2 <f a>4 \stemUp <a c>2 \stemNeutral <g bf>4 |

    \break
    <f a>2. <e g>2. |
    \voiceOne << { f2. ~ f2 } \context Voice="1" { \voiceTwo f2. ~ f2 \oneVoice } >> \oneVoice r4 |
  } } 
  \tag #'toDC { 
  <f c'>2 <f c'>4 <f c'>2 <f c'>4 |
  <f d'>2. <f d'>2. |

  \break
  <f c'>2. ~ <f c'>2 r4 |
  \stemUp <a c>2 <a c>4 <a c>2 <a c>4 |
  <bf d>2. <bf d>2. |
  <a c>2. ~ <a c>2 r4 \bar "|."
  }
}

bass = \relative c {
  \clef bass
  \time 6/4
  \key f \major
  \autoBeamOff

  \tag #'main { \repeat volta 2 {
    <f c'>2 <f c'>4 <f c'>2 <f a>4 |
    <c c'>2 <c c'>4 <c c'>2 r4 |
    <f c'>2 <f c'>4 <f c'>2 <bf, bf' d>4 |

    \break
    <c c'>2. <c bf'>2. |
    <f a>2. ~ <f a>2 r4 |
  } }
  \tag #'toDC {
  <f a>2 <f a>4 <f a>2 <f a>4 |
  <bf, bf'>2. <bf bf'>2. |

  \break
  <f' a>2. ~ <f a>2 r4 |
  f2 f4 f2 f4 |
  bf,2. bf2. |
  f'2. ~ f2 r4 |
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
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 2 ) }}    
}

%%Transcriber's Notes:

%%A second score is provided to unfold the repeats and generate the midi.