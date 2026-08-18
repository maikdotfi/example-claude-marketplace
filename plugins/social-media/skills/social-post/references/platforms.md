# Platform constraints

Limits change and platforms A/B-test their truncation points. Treat the hard
character limits as reliable and the "visible before truncation" figures as
approximate — they vary by device, viewport, and client. When a post lands close
to a limit, tighten it rather than betting on the boundary.

## X / Twitter

- **Hard limit:** 280 characters on a free account; up to 25,000 with Premium.
  Write to 280 unless the user says they have Premium.
- **Links:** every URL counts as 23 characters regardless of actual length.
- **Truncation:** none within the limit — the whole post shows.
- **Hashtags:** zero to two. More reads as spam.
- **Threads:** if the idea needs more than 280, write numbered posts and make
  post 1 stand alone as a complete thought.
- **Note:** posts with links tend to get less reach than posts without; consider
  putting the link in a reply and telling the user why.

## LinkedIn

- **Hard limit:** 3,000 characters.
- **Truncation:** roughly the first 140–210 characters show before "…see more".
  The hook must complete an idea inside that window.
- **Links:** full URL counts against the limit. External links suppress reach
  somewhat; a link in the first comment is a common workaround.
- **Hashtags:** three to five, at the end, specific to the industry.
- **Formatting:** short paragraphs with blank lines between them. No markdown —
  LinkedIn renders none of it, so asterisks show up literally.

## Bluesky

- **Hard limit:** 300 characters (counted in graphemes).
- **Links:** count toward the limit as written; the client auto-detects them.
- **Hashtags:** zero to two, and they are clickable.
- **Tone:** conversational; reads closer to early Twitter than to LinkedIn.

## Threads

- **Hard limit:** 500 characters.
- **Links:** allowed and count normally.
- **Hashtags:** one topic tag is the convention, not a stack.

## Mastodon

- **Hard limit:** 500 characters by default, but each instance can raise it. Ask
  which instance if the draft needs more room.
- **Content warnings:** use the CW field for spoilers or heavy topics — the
  culture expects it.
- **Hashtags:** two to four; hashtags are the primary discovery mechanism here,
  so they matter more than elsewhere.
- **Alt text:** expected on every image, not optional.

## Instagram

- **Caption limit:** 2,200 characters; about the first 125 show before "more".
- **Links:** not clickable in captions. Drive to the profile link or a link
  sticker in Stories, and say so explicitly.
- **Hashtags:** up to 30 permitted; five to ten relevant ones perform better
  than a wall.
- **Requires an image or video.** If the user has no asset, say what image would
  work before writing the caption.

## Facebook

- **Hard limit:** 63,206 characters — effectively unlimited.
- **Truncation:** around 250 characters before "See more".
- **Hashtags:** minimal; one or none is normal.
