\version "2.10"
\include "english.ly"

\header {
  title =    "STOLEN WE WERE."
  poet =     "Words by a Colored Man."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Sto -- len we were from Af -- ri -- ca, Trans --
  port -- ed to A -- mer -- i -- ca;
}

lineTwo = \lyricmode {
  It's work all day and half the night, And
  rise be -- fore the morn -- ing \markup{ "light;" \hspace #2.0 \raise #3 \rightbrace } Sin -- ner! man! why
  don't you re -- pent? For the judg -- ment is roll -- ing a --
  round! For the judg -- ment is roll -- ing a -- round!
}

treble = \relative c' {
  \clef treble
  \time 4/4
  \key g \major
  \autoBeamOff

  \repeat volta 2 {
    \partial 4*1 \voiceOne << { d4 } \context Voice="1" { \voiceTwo \autoBeamOff d4 \oneVoice } >> \oneVoice |
    \voiceOne << { g } \context Voice="1" { \voiceTwo \autoBeamOff g \oneVoice } >> \oneVoice <fs a> <g b> <b d> |
    <d g> <d g> <b d>^\fermata <g b> |

    \break
    \stemUp <a d>4 \stemNeutral <g c> <g b> <fs a> |
    \voiceOne << { g } \context Voice="1" { \voiceTwo \autoBeamOff g \oneVoice } >> \oneVoice <fs a> <g b>_( <a c>^\fermata) |
    %[**NOTE: Strangely, the partials don't balance, giving an extra 1/4 here.]
    %[**NOTE: Should last two notes be 1/8 instead of 1/4?]
  }
  <b d>16^\markup { \bold "Chorus." } <b d>8. r4 <b d>4. <g b>8 |

  \break
  \stemUp <a c>4 \stemNeutral <g b>8. <fs a>16 \voiceOne << { g4 } \context Voice="1" { \voiceTwo \autoBeamOff g4 \oneVoice } >> \oneVoice <g c>8. <g c>16 |
  <g b>4 <g b>8. <g b>16 <fs a>8[ d] <d fs> <fs a> |

  \break
  \voiceOne << { g4 } \context Voice="1" { \voiceTwo \autoBeamOff g4 \oneVoice } >> \oneVoice r <b g'>4. <c e>8 |
  <b d>4 <g b>8 <b d> <b d>[ <a c>] <g b> <d fs> |
  \partial 4*1 <b g'>4 \bar "|."
  %[**NOTE: Strangely, the partials don't balance.] 
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key g \major
  \autoBeamOff

  \repeat volta 2 {
    \partial 4*1 g'4 |
    g d g g |
    d d g^\fermata g |

    \break
    d4 g g \stemUp d |
    d d d( c)^\fermata |
    %[**NOTE: Strangely, the partials don't balance, giving an extra 1/4 here.]
    %[**NOTE: Should last two notes be 1/8 instead of 1/4?]
  }
  \stemNeutral g'16 g8. r4 g4. d8 |

  \break
  c4 \stemUp d8. d16 \stemNeutral g4 g8. g16 |
  %[**NOTE: typo: image shows "g8 g8. g16 d4 d8 d"; first 1/8 should be 1/4.]
  g4 g8. g16 \stemUp d4 d8 d \stemNeutral |

  \break
  g4 r g4. fs8 |
  g4 b,8 \stemUp d c4 d8 d
  \stemNeutral \partial 4*1 g4 |
  %[**NOTE: Strangely, the partials don't balance.]
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
}

\score {
  \unfoldRepeats {
     <<
      \context Staff = upper <<
         \context Voice = upper \treble
      >>
      \context Staff = lower <<
         \context Voice = lower \bass
      >>
    >>
  }  
  \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}
}

%%Transcriber's Note:

%%A second score block is provided to unfold the repeat and generate the midi.

%%See also notes in code above.