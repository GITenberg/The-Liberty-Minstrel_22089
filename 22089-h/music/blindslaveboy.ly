\version "2.10"
\include "english.ly"

\header {
  title = "THE BLIND SLAVE BOY."
  composer = "Music arranged from Sweet Afton."
  poet = "Words by Mrs. Dr. Bailey."
  source =  "Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Come back to me moth -- er! why lin -- ger a --
  way  From thy  poor little blind boy, the long wea -- ry
  day! I mark eve -- ry foot -- step, I list to each
  tone, And won -- der my moth -- er should leave me a --
  lone! \set ignoreMelismata = ##t  There are voi -- ces of sor -- row,  and _
  voi -- ces of glee, But there's no one to joy or to
  sor -- _ row _ with _ me; For _ each hath of _
  pleas -- ure and trou -- ble his share, And _
  none for the poor lit -- tle blind boy will care.
}


treble = \relative c' {
 \key bf \major
  \time 3/4
  \autoBeamOff
  \stemUp

  \partial 4 <d f>4 | <d bf'> <d bf'> <f d'>8[ <ef c'>] | <d bf'> \grace bf'8  <d, bf'>4. <d f>4 | <ef g> <g bf> <ef g> | \break
  
  <d f>2 <d f>8[ <d f>] | <d bf'>4 <d bf'> <a' c> | <bf d> <a f'>^\fermata <bf d> | <a c>4. bf8 <c ef>[ <bf d>] | \break

  <a c>2 <d, f>4 | <d bf'> <d bf'> <f d'>8[ <ef c'>] | <d bf'>4 <d bf'> <d f> | <ef g> <g ef'>^\fermata <ef g> | \break
  
  <d f>2 <d f>4 | <d bf'> <d bf'> <ef c'> | <f d'> <d f'>^\fermata <ef ef'> | <d f> <d f> <f a> | \break
  
  <d bf'>2\fermata <f a>8[ <f bf>] | <f c'>4 <f c'> <f f'> | <f c'> <f c'> <f a>8[ <f bf>] | \break
  
  <f c'>4 <f bf> <e g> | f2 <f a>8[ <f bf>] | <f c'>4 <f c'> <d f'> | <f c'> <f c'> <f a> | \break
  
  <d bf'>8.[ <c a'>16] <d bf'>8[ <ef c'>] << { d'8.[ e16] } \new Voice = "alto" { \voiceTwo f,4 } >> |
      <f f'>2 <g g'>8[ <g g'>8] | <d f'>4 <f d'> <f d'>8[ <ef c'>] | \break
      
  <d bf'>4 <d bf'> <d f> | <ef g> <g ef'>^\fermata <ef g> | <d f>2 <d f>8[ <d f>] | \break
  
  <d bf'>4 <d bf'> <ef c'> | <f d'> <d f'>^\fermata <ef ef'> | <d f> <d f> <c a'> | <d bf'>2 \bar "|."
}


  
bass =  \relative c {
  \key bf \major
  \time 3/4
  \clef bass
  \autoBeamOff
  \override Stem #'neutral-direction = #up
  
  \partial 4 bf4 | bf bf bf | bf8 \grace bf8 bf4. bf4 | ef ef ef |
  
  bf2 bf8[ bf] | d4 d f | d f^\fermata f | f4. f8 f4 |

  f2 d8[ c] | bf4 bf bf | bf bf bf | ef ef^\fermata ef |
  
  bf2 bf4 | bf bf f' | bf bf^\fermata ef, | \stemDown d \stemNeutral f f |
  
  bf,2\fermata f'8[ f ] | f4 f f | f f f8[ f] |
  
  c4 c c | f2 f8[ f] | f4 f f | f f f |
  
  bf bf8[ a] g4 | f2 ef8[ ef] | bf4 bf bf |
  
  d d d | ef ef^\fermata ef | bf2 bf8[ bf] |
  
  d4 d f | bf bf^\fermata ef, | \stemDown d \stemNeutral f f | bf,2 \bar "|."
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}    
   }


%%Transcriber's Note:

%%7th system, 1st bar, treble part, last note was E-flat in original, but should probably be E-natural.