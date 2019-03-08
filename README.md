# CA Studio
Universal cross cellular automaton logic simulator which compiles into many specific automatons. 

Each CA (cellular automaton) has its own properties, constructions, logic. Many times they all implement the same basic design pattern. In CA studio we collect the design patterns and present them in simplified and user friendly way, so that the end user could enjoy the intricacies of CA designs without having his hand durty. 

Everything in CA Studio would be compilable into Conway Game of Life. Each CA that wants to join the party will just need to provide a set of compilation layer, which the CA studio will provide tools to search for. Examples of inputs include gliders, reflectors, duplicators, construction arms, recipes etc. Examples of outputs include self replicating geminioids, caterloopillars, quadratic growth metacells, accelerating spaceship in arbitrary direction. 

- Lets start to implement stuff in QCA including parallel computing and threading theory for CA which might be a bit different. Just like we do for the GPU. So we need a C++ compiler or something - actually we will have CA studio that has includes that compile into QCA as well as to many CAs. Just the compiler into QCA is of higher priority. Implement critical section. 

