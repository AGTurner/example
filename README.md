# Coding Exercise #

## Testing

I'm using my normal test workflow, which is Test::Unit with shoulda, automated with Guard so I can easily get continuous feedback.

After handling the trivial case of an empty string, I decided that I wanted to be manipulating an array of job/dependency hashes,
so I added a simple job structure parser class, that just splits on a line break and the '=>' delimeter and returning the hash.

Then I could modify the sequencer method to handle simple jobs lists with no dependencies.

Next I added some simple logic to handle the case of jobs only having one level deep dependencies.