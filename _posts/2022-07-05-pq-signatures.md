---
layout: post
author: Sofía Celi
title:  "Post-quantum Signatures"
---
*The state of many signatures*

The algorithms to standardize of the Post-Quantum NIST standarisation process are out! We have:

For Public-Key Encryption/KEMs:

* CRYSTALS-KYBER

For Digital Signatures:

* CRYSTALS-Dilithium
* Falcon
* SPHINCS+

<br>
With a note:

"CRYSTALS-KYBER (key-establishment) and CRYSTALS-Dilithium (digital signatures) were both selected for their strong security and excellent performance, and NIST expects them to work well in most applications.
Falcon will also be standardized by NIST since there may be use cases for which CRYSTALS-Dilithium signatures are too large.
Additionally, SPHINCS+ will be standardized to avoid only relying on the security of lattices for signatures. NIST asks for public feedback on a version of SPHINCS+ with a lower number of maximum signatures."

<br>
NIST will also hold a new call for proposals for public key signatures:

"NIST also plans to issue a new Call for Proposals for public-key (quantum-resistant) digital signature algorithms by the end of summer
2022.
NIST is primarily looking to diversify its signature portfolio, so signature schemes that are not based on structured lattices are of greatest interest.
NIST would like submissions for signature schemes that have short signatures and fast verification (e.g., UOV)."

In this blog post, I'll be not focusing on the post-quantum KEM, but rather on
post-quantum signatures as this seems to be 'long-road-ahead' from both
a migration perspective as from standardization.

So, let's explore what post-quantum signatures are available.

## The Zoo of Signatures

<br>
### The lattices

<br>
Two of the "winners" of the post-quantum process are lattice-based:

* [Dilithium](https://pq-crystals.org/dilithium/) follows the [Lyubashevsky’s Fiat–Shamir](https://www.iacr.org/archive/asiacrypt2009/59120596/59120596.pdf) [with aborts framework](https://eprint.iacr.org/2011/537.pdf). Its security is based on the Module-LWE assumption.
* [Falcon](https://falcon-sign.info/) follows the [hash-and-sign framework of Gentry, Peikert and Vaikuntanathan](https://eprint.iacr.org/2007/432) framework. Its security is based on the hardness of the SIS Problem over NTRU lattices.

Dilithium is considered to be "simpler to implement", but has significant bigger sizes when compared with non-post-quantum signatures.
Falcon, on the other hand, has better signing and verification times, and its parameters are smaller than Dilithium (though, they are bigger than non-post-quantum signatures).
Falcon also uses constant-time floating point arithmetic, which could be difficult to implement.
Falcon also does not provide, as it is, the ["beyond unforgeability"](https://ieeexplore.ieee.org/document/9519420) security property.
In terms of speed, they both seem to outperform implementations of non-post-quantum algorithms.

While they both seem suitable for the 'online' signature of a TLS 1.3 handshake (the signature of the handshake), it is unclear if they will work for the whole certificate chain (which involves many other signatures that are generated in an "offline" manner but, sometimes, verified online).
Even if we put the performance time's of the operations aside, the transmission of long parameters as part of the certificate chain can have impact on the latency of TLS connections.
We are unclear on how much that impact will be noticable for end-users and if there are mechanisms that we can use to prevent it (caching, supressing intermidiates, zero-knowledge-like proofs of the whole chain, etc.).
Some notes around the matter can be found [here](https://sofiaceli.com/PQNet-Workshop/tls.html) and [here](https://sofiaceli.com/slides/PQC_KEMTLS.pdf).

For other protocols, they might fail.
For DNSSEC, for example, public key and signatures sizes have to be small.
From the two, only Falcon's parameters fall within the size limit needed for DNSSEC, but leaves no room for shipping more than one key/signature at a time or extra payload. For an interesting research around the matter see ['Retrofitting Post-Quantum Cryptography in Internet Protocols: A Case Study of DNSSEC'](https://www.sidnlabs.nl/downloads/7qGFW0DiOkov0vWyDK9qaK/de709198ac34477797b381f146639e27/Retrofitting_Post-Quantum_Cryptography_in_Internet_Protocols.pdf) or some notes [here](https://sofiaceli.com/PQNet-Workshop/dnssec.html).

There is a "simpler-to-implement" version of Falcon, [Mitakaya](https://eprint.iacr.org/2021/1486.pdf), which manages to avoid floating point arithmetic in one version.

Recently, a very [interesting paper](https://eprint.iacr.org/2022/785.pdf) has been proposed to reduce the size of lattice-based signatures by sampling according to a suitably chosen ellipsoidal discrete Gaussian rather than a spherical one.
This technique reduces the signature size of Falcon by 30–40%.
This technique seems very interesting and a very nice avenue of research.

So, it seems like we might see in the future improvements to the lattice schemes.

### The alternative that got broken and some news
<br>
An interesting candidate that was part of the process was ['Rainbow'](https://www.pqcrainbow.org/), which uses a multivariate approach.
It is based on the Unbalanced Oil and Vinegar (UOV) scheme.
The signature size was perfect for usage in DNSSEC (and TLS 1.3) but the public key size was not able to fit a DNS packet.
Unfortunately, [Rainbow was broken](https://eprint.iacr.org/2022/214.pdf): the attack returns the private key after on average 53 hours (which is basically, one weekend).

But there is another candidate from UOV schemes: [MAYO](https://eprint.iacr.org/2021/1144.pdf), which has very nice performance and sizes (bigger than non-postquantum-schemes though).
This might be a nice contender in the future if its performance is improved.

### The MPC ones

<br>
[Picnic](https://microsoft.github.io/Picnic/) was a candidate for standardisation that will no longer be considered in the NIST process.
It is a non-interactive zero-knowledge proof of knowledge of a private key bound to the message being signed.
Its security is based on the hash function and on the security of the LowMC block cipher.
There has been a lot of research on its security, which has found [several](https://eprint.iacr.org/2020/1034.pdf) [weak points](https://eprint.iacr.org/2021/1345.pdf) (listing the ones I've read so far, but there are more).

On the positive news: there is hope.
Several variants of Picnic have been proposed that are based on AES.
There is [BBQ](https://eprint.iacr.org/2019/781.pdf), [Banquet](https://eprint.iacr.org/2021/068.pdf), and [much](https://eprint.iacr.org/2021/215.pdf) [more](https://eprint.iacr.org/2021/692.pdf).
This very interesting area of research can also lead to a signature scheme with small public keys (as Picnic has).

### The isogenies

<br>
The security of isogeny schemes falls on the hardness of finding a path in the l-isogeny supersingular graph between two given vertices, which is said to be hard for both classical and quantum computers.
The [KLPT algorithm](https://eprint.iacr.org/2014/505.pdf) (from Kohel, Lauter, Petit and Tignol) solves the quaternion analog of this problem under the Deuring correspondence.
Based on it, Galbraith, Petit and Silva gave the [first theoretical signature scheme](https://eprint.iacr.org/2016/1154.pdf) related to isogeny graphs of supersingular elliptic curves.

Building on the latter, [SQISign](https://eprint.iacr.org/2020/1240.pdf) was proposed.
The scheme has the best parameters of all the post-quantum schemes (mainly, they are small), but its performance is slow.
Recently, there has been [efforts](https://eprint.iacr.org/2022/234.pdf) to improve its performance.

Isogeny-based cryptography is an active area of research.
Interesting candidates might come from this area.

### Hash-based

<br>
There are two "types" here: schemes that maintain state ([XMSS](https://datatracker.ietf.org/doc/html/rfc8391) or [LMS](https://datatracker.ietf.org/doc/html/rfc8554)) and schemes that are state-less ([SPHINCS+](https://sphincs.org/)).
Both types use the same security assumption: security of the underlying hash function used.
The reason why there are two types is that some applications might not be able to maintain state (and need [careful consideration](https://csrc.nist.gov/publications/detail/sp/800-208/final) for doing so), and, hence, will benefit from using SPHINCS+.
Nevertheless, SPHINCS+ has larger signature sizes.

Great documentation of hash-based schemes can be found [here](https://huelsing.net/wordpress/?page_id=165).

A table of comparison of sizes:
![Comparison](/assets/comparison-pq.png)

So, lots of avenues of research are still open for a post-quantum signature scheme that work on the protocols we use nowadays.
Let the science begin!

<strong>EDIT</strong>: Thank you Peter Schwabe, Andreas Hülsing, Gustavo Banegas and Carsten Baum for pointing out additions needed and fixes to be made.
