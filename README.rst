The origin of the escape of Lyman α and ionizing photons in Lyman continuum emitters
====================================================================================


This repository contains the data, code, and plots used in the publication:

**Gazagnes et al. (2020), A&A 639, A85**  
DOI: https://doi.org/10.1051/0004-6361/202038096

- `The origin of the escape of Lyman α and ionizing photons in Lyman continuum emitters <https://www.aanda.org/articles/aa/pdf/2020/07/aa38096-20.pdf>`_ 


Summary
-------

In this study, we investigate the physical mechanisms that enable the escape of ionizing (Lyman Continuum, LyC) and Lyman-α (Lyα) photons from star-forming galaxies, focusing on a sample of 22 galaxies, including 13 confirmed LyC emitters.

We show that low neutral hydrogen (H I) covering fractions and narrower H I velocity widths are strongly correlated with:
- Higher LyC and Lyα escape fractions,
- Lower Lyα peak velocity separations,
- Greater Lyα equivalent widths and residual flux at the Lyα trough.

These results suggest that the porosity of the interstellar medium (ISM)—due to low-density channels—is a key factor enabling photon escape. While porosity provides a lower bound on the escape, the most extreme emitters may be density-bounded along all lines of sight.

Contents
--------

- `Data/` — Observational data
- `Paper/` — Contains the article pdf
- `Notebooks/` — Jupyter notebooks for making the final figures
- `Images/` — Figures from the paper (see examples below)
- `CodeFittingIDL/` — IDL code used to perform the non-linear least square fitting.

Result figures:
---------------

This is an overview of the main figures in the paper, which are reproducible with the python notebooks. The paper provides the details and context for the interested reader. 

1. Spectral model fitting result:

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/fit_example.png" width="85%" />
      </div>

2. Lyα profile characteristic features:

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/Lya_example.png" width="90%" />
      </div>

3.  Lyα equivalent width correlations:

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/ewvwidth.png" width="24%" />
          <img src="Images/ewcfvwidth.png" width="24%" />
      </div>


4. H I / Lyα Velocity / Covering fraction correlations:

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/vsepvwidth.png" width="24%" />
          <img src="Images/vsepcf.png" width="24%" />
          <img src="Images/vredcf.png" width="24%" />
          <img src="Images/bluecf.png" width="24%" />
      </div>


5.  Escape fraction correlations:

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/fesclycfmin.png" width="24%" />
          <img src="Images/fesclycebvlog.png" width="24%" />
          <img src="Images/fesclyaebvlog.png" width="24%" />
          <img src="Images/fesclyacf.png" width="24%" />
      </div>

6. Summary figures

   .. raw:: html

      <div style="display: flex; justify-content: space-between;">
          <img src="Images/sketch.png" width="75%" />
      </div>


Cite
----

If you use this code or data, please cite:

Gazagnes et al. (2020), *Astronomy & Astrophysics*, 639, A85  
https://doi.org/10.1051/0004-6361/202038096



Author
------

- Simon Gazagnes <sgsgazagnes@gmail.com>
