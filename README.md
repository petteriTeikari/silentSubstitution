# silentSubstitution

To clone:

`git clone --recurse-submodules https://github.com/petteriTeikari/silentSubstitution`

To pull 

`git pull && git submodule update --recursive --remote`

To replicate the plots

run `plot_separation_surfaces.m`

## "Ratio Spectra"

In other words, the spectra when the separation is maximized pairwise. So we get 15 different pairs using 6 dfferent spectra. Notice also that the V means V(lambda) that is a compound function consisting of MWS and LWS sensitivities

![Ratio Spectra](https://github.com/petteriTeikari/silentSubstitution/blob/master/figures_out/ratio_spectra.png "Ratio Spectra")

## Estimate the effect of half-bandwidth to photoreceptor separability

1nm and 10 nm correspond to available narrow-band bandpass interference filters, and 25 nm is a typical LED half-bandwidth (or Full Wifth at Half Maximum, FWHM value). We can see as expected that the narrow-band illuminants (with [extremely narrow](https://www.edmundoptics.com.sg/optics/optical-filters/bandpass-filters/488nm-cwl-1nm-fwhm-12.7mm-diameter-9.6mm-thickness/) bandpass interference filters or with [lasers](https://sg.rs-online.com/web/c/displays-optoelectronics/laser-modules-components/laser-diodes/?gclid=Cj0KCQjwjN7YBRCOARIsAFCb936uXPeb_Fm4ZDmyrVgaEWglpo_Jcn_tCypulnDN_Uwc1nWnfTm2CG0aAozDEALw_wcB&cm_mmc=SG-PPC-DS3A-_-google-_-1_SG_EN_G_Components_BMM-_-Laser_Diodes-_-%2Blaser%20%2Bdiodes&matchtype=b&gclsrc=aw.ds)) are the best for silent substitution paradigms. 

Of course the price and complexity of such system goes up, so in practice you might want to evaluate how well the quasi-monochromatic LEDs perform in your task. And more importantly often, how well you can generate metamers, including the use of phosphor-based broadband white LEDs.

![HBW Simulation](https://github.com/petteriTeikari/silentSubstitution/blob/master/figures_out/modulation_depths.png "HBW Simulation")

