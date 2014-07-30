\version "2.10"
\include "english.ly"

\header {
  title = "SONG OF THE COFFLE GANG."
  poet = "Words by the Slaves."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {

  See these poor souls from Af -- ri -- ca, Trans --
  port -- ed to A -- mer -- i -- ca; \set ignoreMelismata = ##t We \unset ignoreMelismata are
  stolen, and sold to Geor -- gi -- a, will you
  go a -- long with me? \set ignoreMelismata = ##t We \unset ignoreMelismata are  stolen and sold to
  Geor -- gi -- a, go sound the ju -- bi -- lee.
}

treble =  \relative c' {
  \clef treble
  \key f \major
  \time 2/4
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \stemDown

  \partial 4 <a' c>4 |
      <f a>8 <a c> <a c> <a c> |
      <bf d> <a c> <a c>4( |
      <a c>) <a c> |

  \break    
  <bf d>8 <d f> <d f>8. <d f>16 |
      <bf d>8 <a c> <a c>4( |
      <a c>) <a f'>8.( <a f'>16) |

  \break
  <bf d>8 <bf d> <a c> <a c> |
      <f a> <a c> <a c>4( |
      <a c>) <a c>8 <a c> |

  \break    
  <bf d>8 <bf d> <a c> <f a> |
      <a c>4\fermata <a c>8( <a c>) |
      <bf d> <bf d> <bf d> <bf d> |
      
  \break    
  <a f'>8 <a f'> <a f'>8. <a f'>16 |
      <bf d>8. <bf d>16 <a c>8 <a c> |
      <a c>2 \bar "|."    
}

bass =  \relative c {
  \clef bass
  \key f \major
  \time 2/4
  \override Staff.TimeSignature #'style = #'()
  \autoBeamOff

  \partial 4 f4 |
  f8 f f f |
      f f f4( |
      f) f |

  d8 d d8. d16 |
      f8 f f4( |
      f) f8.( f16) |

  f8 f f f |
      f f f4( |
      f) f8 f |

  bf,8 bf f' f |
      f4\fermata f8( f) |
      g g g g
  
  f8 f f8. f16 |
      bf,8. bf16 f'8 f |
      f2 \bar "|."
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
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

