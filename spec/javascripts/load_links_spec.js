//= require load_all_links

describe('Status Lookup', function(){
  it('returns status of a read link', function(){
    link = {read: true};
    assert.equal(statusLookup(link), "Read");
  });

  it('returns status of an unread link', function(){
    link = {read: false};
    assert.equal(statusLookup(link), "Unread");
  });
});

describe('Button Text', function(){
  it('returns text for a read link', function(){
    link = {read: true};
    assert.equal(buttonText(link), "Mark as Unread");
  });

  it('returns text for an unread link', function(){
    link = {read: false};
    assert.equal(buttonText(link), "Mark as Read");
  });
});
