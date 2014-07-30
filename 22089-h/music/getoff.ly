\version "2.10"
\include "english.ly"

\header {
  title =    "GET OFF THE TRACK."
  poet =     "Words by Jesse Hutchinson."
  composer = "Air, \"Dan Tucker.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Ho! the car E -- man -- ci -- pa -- tion Rides ma -- jes -- tic thro' our na -- tion,
  Bear -- ing on its train the sto -- ry, Lib-- er -- ty! a na -- tion's glo -- ry.
  Roll it a -- long, roll it a -- long, roll it a -- long,
  thro' the na -- tion, Free -- dom's car, E -- man -- ci -- pa -- tion!
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key bf \major
  \autoBeamOff

%%%%% solo part
  bf'8. bf16 bf8 bf |
  bf bf bf \stemDown g |
  \stemNeutral bf bf c d |
  f, f g bf16 r16 |

  \break
  bf8 bf bf bf |
  bf bf bf \stemDown g |
  \stemNeutral bf bf c d |
  f, f g \stemUp bf_\fermata |

%%%%% chorus part

  \break
  %[**NOTE: for these 3 measures, image shows "r8", but should be "r4".]
  <bf d>16 <bf d> <bf d> <bf d> r4 |
  <a c>16 <a c> <a c> <a c> r4 |
  <bf d>16 <bf d> <bf d> <bf d> r4 |

  \break
  <a c>8 <g bf> <ef g> <g bf>^\fermata |
  <f bf> <f bf> <f c'> <f d'> |
  <d f>8. <d f>16 <ef g>8 <g bf>8(
  <f bf>4) r4 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key bf \major
  \autoBeamOff

  s4*16 \bar "|" %%empty bass bars for solo part

  %%[NOTE: for these 3 measures, image shows "r8", but should be "r4".]
  bf16 bf bf bf r4 |
  f'16 f f f r4 |
  bf,16 bf bf bf r4 |

  \break
  f'8 g ef ef^\fermata |
  bf bf f' f |
  f8. f16 ef8 bf ~
  bf4 r4 |
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>

\layout {
	indent=0
	\context { \RemoveEmptyStaffContext }
	\context { \Score \override VerticalAxisGroup #'remove-first = ##t }
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
        }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }} 
}

%%Transcriber's Note:

%%Last system, bass part, first bar: added missing fermata.

%%See also notes above in code.