# Coding Exercise #

## Testing

I'm using my normal test workflow, which is Test::Unit with shoulda, automated with Guard so I can easily get continuous feedback.

After handling the trivial case of an empty string, I decided that I wanted to be manipulating an array of job/dependency hashes,
so I added a simple job structure parser class, that just splits on a line break and the '=>' delimeter and returning the hash.

Then I could modify the sequencer method to handle simple jobs lists with no dependencies.

Next I added some simple logic to handle the case of jobs only having one level deep dependencies.

I realized the jobs parser wasn't actually parsing into the format I wanted, so I amended the test to reflect this and changed the parser and sequencer code to work with this new requirement.

Decided it was better for the JobsParser class to not use class methods, and parse the jobs with an instantiated object. Also make the Sequencer objects instantiate themselves with the relevent instance variables.

I realised my tests were a bit too rigid when checking orders, so I redid this while adding the test for jobs with nested dependencies

I decided the nested dependencies were best resolved with a recursive method, which would be called against a job until the job itself was sorted.