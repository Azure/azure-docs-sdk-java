# To those looking for the code2yml or repo.js

Those don't exist anymore. We apologize if you were not notified, but it was difficult to ascertain those who would be impacted by this change.

This repository has swapped to a maven-package based configuration system. Instead of pulling in pure source, we pull down a maven SOURCES package a build javadoc from that. Check the `packages.json` to see the configuration. It should be quite understandable.

- The `docs-ref-autogen` and `docs-ref-mapping` present in root are associated with the `stable` moniker.
- The `preview` is associated with `preview` moniker
- `legacy` is a static _snapshot in time_ of the documentation prior to this transition. This is an effort to mitigate and pain while remedies are implemented. 

Additionally:

- This method is far more compatible with the upcoming versioning changes
- Much more easily maintained
- The docs team would prefer to sunset the source-based implementation as soon as possible

Contact scbedd for additional details! Apologies for the difficulty and surprise!